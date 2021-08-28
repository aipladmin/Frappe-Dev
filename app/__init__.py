from flask import Flask
from flaskext.mysql import MySQL
import decimal
import flask.json
from .config import Config
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
import sentry_sdk
from sentry_sdk.integrations.flask import FlaskIntegration

sentry_sdk.init(
    dsn="https://82d4dc242ad346e987496f9b07776adf@o416140.ingest.sentry.io/5933949",
    integrations=[FlaskIntegration()],

    # Set traces_sample_rate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production.
    traces_sample_rate=1.0
)


class MyJSONEncoder(flask.json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, decimal.Decimal):
            # Convert decimal instances to strings.
            return str(obj)
        return super(MyJSONEncoder, self).default(obj)


mysql = MySQL()
db = SQLAlchemy()


def create_app():
    app = Flask(
        __name__,
        instance_relative_config=True,
        static_url_path='')

    app.config.from_object(Config)
    app.json_encoder = MyJSONEncoder

    app.config['MYSQL_DATABASE_USER'] = str(Config.DatabaseConfig.get('MYSQL_DATABASE_USER'))
    app.config['MYSQL_DATABASE_PASSWORD'] = str(Config.DatabaseConfig.get('MYSQL_DATABASE_PASSWORD'))
    app.config['MYSQL_DATABASE_HOST'] = str(Config.DatabaseConfig.get('MYSQL_DATABASE_HOST'))
    mysql.init_app(app)

    mail = Mail()
    app.config['MAIL_SERVER'] = 'smtp.gmail.com'
    app.config['MAIL_PORT'] = 465
    app.config['MAIL_USE_SSL'] = True
    app.config['MAIL_USERNAME'] = str(Config.EmailConfig.get('MAIL_USERNAME'))
    app.config['MAIL_PASSWORD'] = str(Config.EmailConfig.get('MAIL_PASSWORD'))
    app.config['MAIL_DEFAULT_SENDER'] = str(Config.EmailConfig.get('MAIL_USERNAME'))
    app.config['MAIL_USE_TLS'] = False
    mail.init_app(app)

    from app.controller import (
        admin, user, auth
    )

    app.register_blueprint(admin.admin)
    app.register_blueprint(user.user)
    app.register_blueprint(auth.auth)

    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///settings.sqlite3'

    with app.app_context():
        db.init_app(app)  # Initialize SQLAlchemy with this app
        db.create_all()

    return app
