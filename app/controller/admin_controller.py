import math
from dataclasses import dataclass
from datetime import datetime
from typing import List, Optional
import requests

from .controller import mysql_query


def settings_data():
    from .admin import get_settings
    return get_settings()


class Transactions:
    def __init__(self, email=None):
        self.email = email

    @staticmethod
    def os_amt_validator(days):
        data = settings_data()
        if data['Status'] == 'Success':
            charges = int(data['Charges'])
            os_amt = charges * int(days)
        return str(os_amt)

    def check_outstanding(self, email=None):
        data = settings_data()
        if email is None:
            cos = mysql_query('''select * from lms.transactions inner join lms.members ON
            members.MID=transactions.MID inner join lms.inventory ON inventory.IID=transactions.IID inner join
            lms.books ON books.BID=inventory.BID ;''')
        else:
            cos = mysql_query('''select * from lms.transactions inner join lms.members ON members.MID=transactions.MID
            inner join lms.inventory ON inventory.IID=transactions.IID inner join lms.books ON books.BID=inventory.BID
            where transactions.Status != 'returned' and members.Email_ID='{}';'''.format(email))

        for x in cos:
            if x['Status'] == 'issued':
                time_period = (datetime.now().date()-x['Issued'].date())
                x['osTimePeriod'] = str(time_period.days)
                day = (datetime.now().date()-x['Issued'].date()).days
            else:
                time_period = (x['Returned'].date()-x['Issued'].date())
                x['osTimePeriod'] = str(time_period.days)
                day = (x['Returned'].date()-x['Issued'].date()).days
            # FREE TRIAL CODE
            day = day - int(data['Validity'])
            if day < 0:
                day = 0
            x['osAmount'] = self.os_amt_validator(days=day)
        return cos

    def isEligible(self):
        """ isEligible

        Check Whether user is valid of not

        Returns:
            [JSON]: Eligibility,holdCount,HoldData
        """
        email = self.email
        eligible = mysql_query("select auth from lms.members where Email_ID='{}'".format(email))
        holdCount = mysql_query('''select *,count(*) as holdCount from lms.members inner join lms.transactions ON
        members.MID = transactions.MID where members.Email_ID='{}';'''.format(email))

        return {'eligible': eligible[0]['auth'], 'holdCount': holdCount[0]['holdCount'], 'holdData': holdCount[0]}


class InventoryManager:
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

        complete_data = mysql_query(''' SELECT
                                        COUNT(inventory.BID) as 'stock_count',IFNULL(Status,'In Stock') as 'stock',
                                        inventory.BID
                                    FROM
                                        lms.inventory
                                            left join
                                        lms.transactions ON inventory.IID = transactions.IID
                                    GROUP BY transactions.Status , inventory.BID ORDER BY BID,stock desc; ''')

        lst = []
        for x in books:
            x['inventory'] = []
            for y in complete_data:
                if str(y.get('BID')) == str(x.get('BID')):
                    x['inventory'].append(y)
            lst.append(x)
        return {'books': books, "inventory": complete_data, 'books_inventory': lst}


def api_caller(nof_books, nof_requests, params):
    try:
        nobCeil = math.ceil(nof_requests)
        data_list = []
        for x in range(1, int(nobCeil)+1):
            params['page'] = int(x)
            params.pop('nob', None)
            response = requests.get("https://frappe.io/api/method/frappe-library", params=params)

            if response.status_code != 200:
                return "API Error: " + response.status_code+"\n"+response.text
            api_data = response.json()
            data_list.extend(api_data['message'])

        merged_data = {'message': data_list}
        iter_data = int(len(merged_data['message']))

        if int(iter_data) > int(nof_books):
            iter_data = nof_books

        book_import = Books(**merged_data)
        book_import.BooksInsert(iterData=iter_data)
        return iter_data

    except requests.exceptions.Timeout as e:
        return "Connection timed out."+"\n"+str(e)

    except requests.exceptions.RequestException as e:
        raise str("System Experiencing Unexpected Problem. Please Try Again Later")+"\n"+str(e)

    except Exception as e:
        return str(e)


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
        i = 1
        for dic in message:
            if i > int(iterData):
                break
            dictStrip = {k.strip(): v.strip() for k, v in dic.items()}
            dit = mysql_query("select  bookID from lms.books;")
            ditList = []
            for y in dit:
                for x in y.items():
                    ditList.append(str(x[1]))

            data_conversion = datetime.strptime(str(dictStrip['publication_date']), '%m/%d/%Y')
            i += 1

            if str(dictStrip['bookID']) in ditList:
                BID = mysql_query("select BID from lms.books where bookID={};".format(int(dictStrip['bookID'])))
                BID = BID[0]['BID']
                mysql_query("insert into lms.inventory(BID) values({});".format(int(BID)))
            else:
                mysql_query('INSERT INTO lms.books({})values{a}'.format(','.join(dictStrip),
                            a=(int(dictStrip['bookID']),
                               ''.join(dictStrip['title']), ''.join(dictStrip['authors']),
                               float(dictStrip['average_rating']),
                               ''.join(dictStrip['isbn']), int(dictStrip['isbn13']),
                               ''.join(dictStrip['language_code']),
                            int(dictStrip['num_pages']), int(dictStrip['ratings_count']),
                            int(dictStrip['text_reviews_count']),
                            str(data_conversion.date()), ''.join(dictStrip['publisher']))))

                mysql_query("insert into lms.inventory(BID) values({});".format(mysql_query.last_row_id))
        return None
