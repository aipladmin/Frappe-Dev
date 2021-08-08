"""Data models."""
from app import db


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
        nullable=False
    )
    charges = db.Column(
        db.Integer(),
        index=True,
        unique=False,
        nullable=False
    )
    timestamp = db.Column(
        db.DateTime,
        index=False,
        unique=False,
        nullable=False
    )

    def __repr__(self):
        return '<User {}>'.format(self.id)
