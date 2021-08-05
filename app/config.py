from datetime import timedelta
import secrets
import os


class Config(object):

    TESTING = True
    DEBUG = True

    FLASK_ENV = 'development'
    secret_key = secrets.token_hex(32)
    SECRET_KEY = secret_key
    PERMANENT_SESSION_LIFETIME = timedelta(minutes=300)
    DatabaseConfig = {
                    'MYSQL_DATABASE_USER': 'MyCommDB',
                    'MYSQL_DATABASE_PASSWORD': str(os.environ.get('MYSQL_DATABASE_PASSWORD')),
                    'MYSQL_DATABASE_HOST': 'database-1.ceo7csjfbddw.ap-south-1.rds.amazonaws.com'
    }
