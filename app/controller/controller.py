from flask_mail import Mail, Message
import logging
from flask import session, redirect, url_for, render_template
from functools import wraps
from app import mysql


# if platform.system().lower() == "linux":
#     WKHTML_CONFIG = pdfkit.configuration(wkhtmltopdf='/usr/local/bin/wkhtmltopdf')
# if platform.system().lower() == "windows":
#     WKHTML_CONFIG = pdfkit.configuration(wkhtmltopdf='C:\\Program Files\\wkhtmltopdf\\bin\\wkhtmltopdf.exe')

logging.basicConfig(level=logging.ERROR)


def mysql_query(sql):
    logging.warning(sql)
    connection = mysql.connect()

    cursor = connection.cursor()
    if sql.lower().strip().startswith('select'):
        connection.escape_string(sql)
        cursor.execute(sql)
        logging.debug(sql)
        columns = [column[0].strip() for column in cursor.description]
        results = [dict(zip(columns, row)) for row in cursor.fetchall()]
        cursor.close()
        connection.close()
        return results
    else:
        cursor.execute(sql)
        logging.debug(sql)

        mysql_query.last_row_id = cursor.lastrowid

        connection.commit()
        cursor.close()
        connection.close()
        return None


# login validator
def login_required(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'emailid' in session and 'user_type' in session:
            return f(*args, **kwargs)
        else:
            return redirect(url_for('auth.login'))
    return wrap


# MAIL DRIVER
def send_mail(**deets):
    mail = Mail()
    msg = Message(deets['Subject'],
                  recipients=[deets['Emailid']])
    msg.html = render_template('auth/mail.html', emailid=deets['Emailid'],
                               otp=deets['OTP'])
    mail.send(msg)
