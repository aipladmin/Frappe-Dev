import pdfkit
import platform
import logging
from flask import Flask, session, redirect, url_for
from functools import wraps
from datetime import datetime
from app.config import Config
from flaskext.mysql import MySQL
from typing import Optional, List
from dataclasses import dataclass


mysql = MySQL()

app = Flask(__name__)

app.config['MYSQL_DATABASE_USER'] = str(Config.DatabaseConfig.get('MYSQL_DATABASE_USER'))
app.config['MYSQL_DATABASE_PASSWORD'] = str(Config.DatabaseConfig.get('MYSQL_DATABASE_PASSWORD'))
app.config['MYSQL_DATABASE_HOST'] = str(Config.DatabaseConfig.get('MYSQL_DATABASE_HOST'))
mysql.init_app(app)


if platform.system().lower() == "linux":
    config = pdfkit.configuration(wkhtmltopdf='/usr/local/bin/wkhtmltopdf')
if platform.system().lower() == "windows":
    config = pdfkit.configuration(wkhtmltopdf='C:\\Program Files\\wkhtmltopdf\\bin\\wkhtmltopdf.exe')

logging.basicConfig(level=logging.WARNING)


# DECORATORS
def user_sess(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'email' in session:
            return f(*args, **kwargs)
        return redirect(url_for('auth.login'))
    return wrap


def mysql_query(sql):
    print(sql)
    connection = mysql.connect()

    cursor = connection.cursor()
    if sql.lower().strip().startswith('select'):
        connection.escape_string(sql)
        cursor.execute(sql)
        logging.warning(sql)
        columns = [column[0].strip() for column in cursor.description]
        results = [dict(zip(columns, row)) for row in cursor.fetchall()]
        cursor.close()
        connection.close()
        return results
    else:
        cursor.execute(sql)
        logging.warning(sql)

        mysql_query.last_row_id = cursor.lastrowid

        connection.commit()
        cursor.close()
        connection.close()
        return None


class Transactions:
    def __init__(self, email=None):
        self.email = email

    @staticmethod
    def os_amt_validator(days):
        # email=self.email
        os_amt = 50 * int(days)
        return str(os_amt)

    def checkOutstanding(self, email=None):
        if email is None:
            cos = mysql_query('''select * from lms.transactions inner join lms.members ON
            members.MID=transactions.MID inner join lms.inventory ON inventory.IID=transactions.IID inner join
            lms.books ON books.BID=inventory.BID ;''')
        else:
            cos = mysql_query('''select * from lms.transactions inner join lms.members ON members.MID=transactions.MID
            inner join lms.inventory ON inventory.IID=transactions.IID inner join lms.books ON books.BID=inventory.BID
            where transactions.Status != 'returned' and members.Email_ID='{}';'''.format(email))

        for x in cos:
            x['osTimePeriod'] = (datetime.now().date()-x['Issued'].date())
            x['osTimePeriod'] = str(x['osTimePeriod'].days)
            day = (datetime.now().date()-x['Issued'].date()).days
            x['osAmount'] = self.os_amt_validator(days=day)
        print(cos)
        return cos

    def isEligible(self):
        """ isEligible

        Check Whether user is valid of not

        Returns:
            [JSON]: Eligibility,holdCount,HoldData
        """
        email = self.email
        elg = mysql_query("select auth from lms.members where Email_ID='{}'".format(email))
        holdCount = mysql_query('''select *,count(*) as holdCount from lms.members inner join lms.transactions ON
        members.MID = transactions.MID where members.Email_ID='{}';'''.format(email))

        return {'eligible': elg[0]['auth'], 'holdCount': holdCount[0]['holdCount'], 'holdData': holdCount[0]}


class inventoryManager:

    @staticmethod
    def inventory_merger():
        '''
            Inventory Method

            Returns:
            JSON : Book Details
            JSON : Inventor Details
            JSON : Stock Count

        '''
        books = mysql_query('Select books.BID,books.bookID,title,authors,publisher,isbn from lms.books')
        inventoryDt = mysql_query("Select count(*) as 'CInt',BID from lms.inventory group by BID ")
        print(inventoryDt)
        lst = []
        for x in books:
            for y in inventoryDt:
                if str(y.get('BID')) == str(x.get('BID')):
                    x['inventory'] = y
            lst.append(x)
        return {'books': books, "inventory": inventoryDt, 'books_inventory': lst}


@dataclass
class Message:
    book_id: int
    title: str
    authors: str
    average_rating: str
    isbn: str
    isbn13: str
    language_code: str
    ratings_count: int
    text_reviews_count: int
    publication_date: str
    publisher: str
    message_num_pages: Optional[int] = None
    num_pages: Optional[int] = None


@dataclass
class Books:
    message: List[Message]

    def BooksInsert(self, iterData):
        message = self.message
        # print(message)
        i = 1
        for dic in message:
            print("*"*50, i, "*"*50)
            if i > int(iterData):
                break

            dictStrip = {k.strip(): v.strip() for k, v in dic.items()}
            # print(dictStrip)
            dit = mysql_query("select  bookID from lms.books;")
            ditList = []
            for y in dit:
                for x in y.items():
                    ditList.append(str(x[1]))

            dateObj = datetime.strptime(str(dictStrip['publication_date']), '%m/%d/%Y')
            i += 1
            # print(ditList,dic['bookID'])

            print(str(dictStrip['bookID']), ditList)
            if str(dictStrip['bookID']) in ditList:
                print("inside")
                BID = mysql_query("select BID from lms.books where bookID={};".format(int(dictStrip['bookID'])))
                print(BID)
                BID = BID[0]['BID']
                mysql_query("insert into lms.inventory(BID) values({});".format(int(BID)))
            else:
                print("outside")
                mysql_query('INSERT INTO lms.books({})values{a}'.format(','.join(dictStrip),
                            a=(int(dictStrip['bookID']),
                               ''.join(dictStrip['title']), ''.join(dictStrip['authors']),
                               float(dictStrip['average_rating']),
                               ''.join(dictStrip['isbn']), int(dictStrip['isbn13']),
                               ''.join(dictStrip['language_code']),
                            int(dictStrip['num_pages']), int(dictStrip['ratings_count']),
                            int(dictStrip['text_reviews_count']),
                            str(dateObj.date()), ''.join(dictStrip['publisher']))))

                mysql_query("insert into lms.inventory(BID) values({});".format(mysql_query.last_row_id))
        return None
