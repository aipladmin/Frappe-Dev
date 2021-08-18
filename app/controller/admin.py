from datetime import datetime

import matplotlib
import pandas as pd
import pdfkit
from flask import (Blueprint, flash, jsonify, make_response, redirect,
                   render_template, request, url_for)

from .admin_controller import InventoryManager, Transactions, api_caller
from .controller import WKHTML_CONFIG, mysql_query
from flask import current_app as app
from .models import db, Settings

matplotlib.use('Agg')


admin = Blueprint('admin', __name__, template_folder='templates', static_folder='static',
                  static_url_path='/controller/static')


# @admin.before_request
# def before_request():
#     session.pop('email', '')
#     session.clear()

def get_settings():
    settings = Settings.query.order_by(Settings.timestamp.desc()).first()
    if settings:
        return {"Status": 'Success', 'Validity': settings.validity, 'Charges': settings.charges}
    else:
        return {"Status": 'Failure', 'Message': 'No Records Found!'}


@admin.route('/testing', methods=['GET'])
def user_records():
    """Create a user via query string parameters."""
    username = "madhav"
    email = "madhav"
    if username and email:
        existing_user = Settings.query.order_by(Settings.timestamp.desc()).first()
        app.logger.info(existing_user.validity)
        if existing_user:
            return str(existing_user)+"DONE"
    new_settings = Settings(
            validity=30,
            charges=30,
            timestamp=datetime.now()
        )  # Create an instance of the User class
    db.session.add(new_settings)  # Adds new User record to database
    db.session.commit()
    idd = new_settings.id
    data = Settings.query.all()
    for x in data:
        app.logger.info(x.validity)
    return str(Settings.query.all())+str(idd)


@admin.route('/settings', methods=['GET', 'POST'])
def settings():
    return render_template('admin/settings.html',
                           exsisting_settings=Settings.query.order_by(Settings.timestamp.desc()).first())


@admin.route('/settings-update', methods=['POST'])
def settings_post():
    validityPeriod = request.form['validityPeriod']
    amountToCharge = request.form['amountToCharge']
    threshold = request.form['threshold']
    new_settings = Settings(
            validity=int(validityPeriod),
            charges=int(amountToCharge),
            limit=int(threshold),
            timestamp=datetime.now()
        )
    db.session.add(new_settings)
    db.session.commit()
    flash("Settings Updated Successfully.", "success")
    return redirect(url_for('admin.settings'))


@admin.route('/')
@admin.route('/index')
def index():
    return render_template('index.html')


@admin.route('/books', methods=['GET'])
def books():
    title = mysql_query("select distinct(title) as 'title' from lms.books")
    authors = mysql_query("select distinct(authors) as 'authors' from lms.books")
    publisher = mysql_query("select distinct(publisher) as 'publisher' from lms.books")
    return render_template('admin/books.html', title=title, authors=authors, publisher=publisher)


@admin.route('/insert', methods=['POST'])
def books_to_inv():
    nof_books = request.form['nob']
    nof_requests = int(request.form['nob'])/20
    params = request.form.to_dict(flat=False)
    api_caller(nof_books=nof_books, nof_requests=nof_requests, params=params)
    flash('Books Inserted Successfully', 'success')
    return redirect(url_for('admin.books'))


@admin.route('/inventory', methods=['GET'])
def inventory():
    inventory_obj = InventoryManager()
    inventory = inventory_obj.inventory_merger()
    return render_template('admin/inventory.html', data=inventory['books_inventory'])


@admin.route('/inventory-operations', methods=['POST'])
def inventory_post():

    if 'update' in request.form:
        for _ in range(int(request.form['inventory'])):
            mysql_query("INSERT INTO lms.inventory(BID) values({});".format(request.form['update']))

    if 'delete' in request.form:
        books_in_stock = mysql_query('''SELECT
                                        inventory.IID
                                    FROM
                                        lms.inventory
                                            INNER JOIN
                                        lms.books ON books.BID = inventory.BID
                                            LEFT JOIN
                                        lms.transactions ON transactions.IID = inventory.IID
                                    WHERE
                                        status IS NULL AND books.BID = {}
                                        limit {};'''.format(request.form['delete'], request.form['inventory']))
        for x in books_in_stock:
            mysql_query("DELETE FROM lms.inventory WHERE IID={};".format(x['IID']))
    flash("Inventory Updated.", "success")
    return redirect(url_for('admin.inventory'))


@admin.route('/members', methods=['GET', 'POST'])
def members():
    if request.method == 'POST':
        mysql_query("insert into lms.members(Full_Name, Email_ID,Mobile_No) values('{}','{}',{})".format(
                    request.form['Full_Name'], request.form['Email_ID'], request.form['Mobile_No']))
        flash("Member Successfully Added.", "success")
        return redirect(url_for('admin.members'))
    return render_template('admin/members.html')


@admin.route('/member-detailedInfo', methods=['GET', 'POST'])
def memberDetailedInfo():
    if request.method == 'POST':
        mysql_query('''UPDATE `lms`.`members`
                    SET
                    `Full_Name` = '{}',
                    `Email_ID` = '{}',
                    `Mobile_No` = {},
                    Auth='{}'
                    WHERE `MID` = {};
                    '''.format(
                        request.form['Full_Name'], request.form['Email_ID'], request.form['Mobile_No'],
                        request.form['Auth'], request.form['MID']))
        flash("Member Detailed Updated.", "success")
        return redirect(url_for('admin.memberDetailedInfo'))

    data = mysql_query("select * from lms.members")
    return render_template('admin/memberDetailedInfo.html', data=data)


@admin.route('/booking', methods=['GET', 'POST'])
def bookings():
    if request.method == 'POST':
        MID = mysql_query("select MID from lms.members where Email_ID='{}';".format(request.form['User']))
        MID = MID[0]['MID']
        mysql_query('INSERT into lms.transactions(IID,MID) values({},{})'.format(request.form['books'], MID))
        flash("Book Issued.", "success")
        return redirect(url_for('admin.bookings'))

    user = mysql_query("select * from lms.members where Auth != 'Terminated';")
    books = mysql_query('''select IID,title,authors,publisher from lms.books inner join
    lms.inventory ON inventory.BID=books.BID where inventory.IID
    NOT IN (select IID from lms.transactions where Status='issued');''')
    return render_template('admin/bookings.html', User=user, books=books)


@admin.route('/booking/ajax', methods=['GET', 'POST'])
def booking_ajax():
    outstanding_data = Transactions().check_outstanding(email=request.form['UserID'])
    charges = Settings.query.order_by(Settings.timestamp.desc()).first()
    return jsonify({'bookings': outstanding_data, 'charges': int(charges.charges)})


# @admin.route('/cos', methods=['GET', 'POST'])
# def cos():
#     cosObj = Transactions(email='parikh.madhav1999@gmail.com')
#     return "render_template"+str(cosObj.check_outstanding())


@admin.route('/returnbookings', methods=['GET', 'POST'])
def returnBooks():
    user = mysql_query("select * from lms.members")
    gd = Transactions().check_outstanding()
    return render_template('admin/returnBooks.html', user=user, gd=gd, enableAct="enableAct")


@admin.route('/post-returnBooks', methods=['POST'])
def returnBooks_post():
    user = mysql_query("select * from lms.members")
    gd = Transactions().check_outstanding()
    if 'getData' in request.form:
        transaction_object = Transactions()
        gd = transaction_object.check_outstanding(email=request.form['gdEmail'])
        return render_template('admin/returnBooks.html', user=user, gd=gd, enableAct="enableAct")
    elif 'gdReturns' in request.form:
        mysql_query("UPDATE lms.transactions SET status='returned' WHERE transactions.TID={}".format(
            request.form['gdReturns']))
        return render_template('admin/returnBooks.html', gd=gd)
    elif 'gdAuth' in request.form:
        authStatus = mysql_query('select Auth from lms.members where MID={};'.format(request.form['gdAuth']))
        if authStatus[0]['Auth'] == "Activated":
            mysql_query("Update lms.members SET Auth='{}' WHERE MID={};".format(
                "Deactivated", request.form['gdAuth']))
        else:
            mysql_query("Update lms.members SET Auth='{}' WHERE MID={};".format(
                "Activated", request.form['gdAuth']))
        return redirect(url_for('admin.returnBooks'))
    return redirect(url_for('admin.returnBooks'))


@admin.route('/popular-book-report', methods=['GET', 'POST'])
def popular_book_report():
    data = InventoryManager.inventory_merger()

    complete_list_of_set = {'In Stock', 'returned', 'issued'}
    data = data['books_inventory']
    for x in data:
        status = set()
        for items in x['inventory']:
            status.add(str(items['stock']))
        # print(items, status)
        a = complete_list_of_set - status
        if len(a) > 0:
            for ind in a:
                updated_dict = {'stock_count': 0, 'stock': str(ind), 'BID': x['BID']}
                x['inventory'].append(updated_dict)

    return render_template('admin/popularBookReport.html', data=data)


@admin.route('/report1', methods=['GET', 'POST'])
def report1():
    data = mysql_query('''SELECT
                        books.title,
                        books.authors,
                        books.publisher,
                        books.isbn,
                        COUNT(CASE Status
                            WHEN 'issued' THEN 1
                            ELSE NULL
                        END) AS 'Issued',
                        COUNT(CASE Status
                            WHEN 'returned' THEN 1
                            ELSE NULL
                        END) AS 'Returned'
                    FROM
                        lms.transactions
                            INNER JOIN
                        lms.inventory ON inventory.IID = transactions.IID
                            INNER JOIN
                        lms.books ON books.BID = inventory.BID;''')
    if request.method == 'POST':
        rendered = render_template('admin/report1_pdf.html', data=data,
                                   DG=datetime.today().strftime('%d-%m-%Y %H:%M:%S'))
        pdf = pdfkit.from_string(rendered, False, configuration=WKHTML_CONFIG)
        response = make_response(pdf)
        response.headers['Content-Type'] = 'application/pdf'
        if 'view' in request.form:
            response.headers['Content-Disposition'] = 'inline; filename="report1.pdf"'
        else:
            response.headers['Content-Disposition'] = 'attachment; filename="report1.pdf"'
        return response

    return render_template('admin/report1.html', data=data)
