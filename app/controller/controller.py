import pdfkit
import platform
import logging
from flask import Flask, session, redirect, url_for
from functools import wraps
from app.config import Config
from flaskext.mysql import MySQL


mysql = MySQL()

app = Flask(__name__)

app.config['MYSQL_DATABASE_USER'] = str(Config.DatabaseConfig.get('MYSQL_DATABASE_USER'))
app.config['MYSQL_DATABASE_PASSWORD'] = str(Config.DatabaseConfig.get('MYSQL_DATABASE_PASSWORD'))
app.config['MYSQL_DATABASE_HOST'] = str(Config.DatabaseConfig.get('MYSQL_DATABASE_HOST'))
mysql.init_app(app)


if platform.system().lower() == "linux":
    WKHTML_CONFIG = pdfkit.configuration(wkhtmltopdf='/usr/local/bin/wkhtmltopdf')
if platform.system().lower() == "windows":
    WKHTML_CONFIG = pdfkit.configuration(wkhtmltopdf='C:\\Program Files\\wkhtmltopdf\\bin\\wkhtmltopdf.exe')

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
