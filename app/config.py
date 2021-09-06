from datetime import timedelta
import secrets
import os


class Config(object):

    TESTING = False
    DEBUG = False

    FLASK_ENV = 'development'
    secret_key = secrets.token_hex(32)
    SECRET_KEY = "CF1F79742E5DB423F112CDB927E9B6A1F"
    PERMANENT_SESSION_LIFETIME = timedelta(minutes=30)
    DatabaseConfig = {
                    'MYSQL_DATABASE_USER': 'MyCommDB',
                    'MYSQL_DATABASE_PASSWORD': str(os.environ.get('MYSQL_DATABASE_PASSWORD')),
                    'MYSQL_DATABASE_HOST': 'database-1.ceo7csjfbddw.ap-south-1.rds.amazonaws.com'
    }
    EmailConfig = {
        'MAIL_USERNAME': 'developer.websupp@gmail.com',
        'MAIL_PASSWORD': str(os.environ.get('MAIL_PASSWORD'))
    }
