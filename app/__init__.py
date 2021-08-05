from flask import Flask
from flaskext.mysql import MySQL
import decimal
import logging
import flask.json
from flask_sqlalchemy import SQLAlchemy
from .config import Config
import sentry_sdk
from sentry_sdk.integrations.flask import FlaskIntegration

sentry_sdk.init(
    dsn="https://17484623a4d4464f8ce92018281972d9@o416140.ingest.sentry.io/5802801",
    integrations=[FlaskIntegration()],

    traces_sample_rate=1.0
)


class MyJSONEncoder(flask.json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, decimal.Decimal):
            # Convert decimal instances to strings.
            return str(obj)
        return super(MyJSONEncoder, self).default(obj)


mysql = MySQL()


def create_app():
    app = Flask(
        __name__,
        instance_relative_config=True,
        static_url_path='')

    app.config.from_object(Config)
    app.json_encoder = MyJSONEncoder

    # app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///db.sqlite3'
    # app.config['SESSION_TYPE'] = 'sqlalchemy'
    # app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False  # quiet warning message

    # db = SQLAlchemy(app)

    # app.config['SESSION_SQLALCHEMY']=db
    # sess = Session(app)
    # db.init_app(app)
    # db.create_all()

    mysql.init_app(app)

    from app.controller import (
        admin, user
    )

    app.register_blueprint(admin.admin)
    app.register_blueprint(user.user)

    return app
