"""Data models."""
from app import db
from datetime import datetime
from sqlalchemy.orm import relationship
from sqlalchemy import ForeignKey


class Users(db.Model):
    __tablename__ = 'users'
    uid = db.Column(
        db.Integer,
        primary_key=True)
    email = db.Column(
        db.String(120),
        unique=True,
        nullable=False)
    timestamp = db.Column(
        db.DateTime,
        index=False,
        unique=False,
        nullable=False
    )
    children = relationship("Creds")


class Creds(db.Model):
    __tablename__ = 'creds'
    cid = db.Column(db.Integer, primary_key=True)
    uid = db.Column(db.Integer, ForeignKey('users.uid'))
    otp = db.Column(db.Integer, nullable=False, unique=True)
    timestamp = db.Column(
        db.DateTime,
        index=False,
        unique=False,
        nullable=False
    )


class Settings(db.Model):
    """Data model for Settings."""

    __tablename__ = 'settings'
    id = db.Column(
        db.Integer,
        primary_key=True
    )
    validity = db.Column(
        db.Integer(),
        index=False,
        unique=False,
        nullable=False,
        default=0
    )
    charges = db.Column(
        db.Integer(),
        index=True,
        unique=False,
        nullable=False,
        default=50
    )
    limit = db.Column(
        db.Integer(),
        index=False,
        unique=False,
        nullable=False,
        default=500
    )
    timestamp = db.Column(
        db.DateTime,
        index=False,
        unique=False,
        nullable=False,
        default=datetime.now()
    )

    def __repr__(self):
        return '<User {}>'.format(self.id)
