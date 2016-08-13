import os

from contextlib import contextmanager

from sqlalchemy import Column, Integer, String, create_engine, ForeignKey
from sqlalchemy.orm import relationship, sessionmaker
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
engine = None
session_factory = None


class Config(Base):
    __tablename__ = 'system_config'
    name = Column(String, primary_key=True)
    value = Column(String, nullable=False)


def connect():
    global engine, session_factory
    engine = create_engine(os.environ['DB_URL'])
    session_factory = sessionmaker(bind=engine)


@contextmanager
def session():
    session = session_factory()
    try:
        yield session
        session.commit()
    except:
        session.rollback()
        raise
    finally:
        session.close()
