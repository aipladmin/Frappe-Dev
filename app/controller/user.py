from flask import render_template, Blueprint, session
from .controller import mysql_query

user = Blueprint('user', __name__, template_folder='templates', static_folder='static',
                 static_url_path='/controller/static', url_prefix='/user')


# @user.before_request
# def before_request():
#     session.permanent = True
#     app.permanent_session_lifetime = timedelta(minutes=10)


@user.route('/', methods=['GET', 'POST'])
def user_index():
    return render_template('index.html')


@user.route('/vb')
def view_books():
    books = mysql_query("select * from lms.books;")
    return render_template('user/viewBooks.html', data=books)
