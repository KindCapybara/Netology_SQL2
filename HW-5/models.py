import sqlalchemy as sql
from sqlalchemy.orm import declarative_base, relationship

Base = declarative_base()


class Publisher(Base):
    __tablename__ = "publisher"

    id = sql.Column(sql.Integer, primary_key=True)
    name = sql.Column(sql.String(length=60), unique=True)

    def __str__(self):
        return f'Publisher {self.id}: {self.name}'


class Book(Base):
    __tablename__ = "book"

    id = sql.Column(sql.Integer, primary_key=True)
    title = sql.Column(sql.String(length=60))
    id_publisher = sql.Column(sql.Integer, sql.ForeignKey("publisher.id"), nullable=False)

    publisher = relationship(Publisher, backref="book")

    def __str__(self):
        return f'Book {self.id}: {self.title}, {self.id_publisher}'


class Shop(Base):
    __tablename__ = "shop"

    id = sql.Column(sql.Integer, primary_key=True)
    name = sql.Column(sql.String(length=60), unique=True)

    def __str__(self):
        return f'Shop {self.id}: {self.name}'


class Stock(Base):
    __tablename__ = "stock"

    id = sql.Column(sql.Integer, primary_key=True)
    id_book = sql.Column(sql.Integer, sql.ForeignKey("book.id"), nullable=False)
    id_shop = sql.Column(sql.Integer, sql.ForeignKey("shop.id"), nullable=False)
    count = sql.Column(sql.Float)

    book = relationship(Book, backref="book")
    shop = relationship(Shop, backref="shop")

    def __str__(self):
        return f'Stock {self.id}: {self.id_book}, {self.id_shop}, {self.count}'


class Sale(Base):
    __tablename__ = "sale"

    id = sql.Column(sql.Integer, primary_key=True)
    price = sql.Column(sql.String, nullable=False)
    date_sale = sql.Column(sql.DateTime, nullable=False)
    id_stock = sql.Column(sql.Integer, sql.ForeignKey("stock.id"), nullable=False)
    count = sql.Column(sql.Integer, nullable=False)

    stock = relationship(Stock, backref="stock")

    def __str__(self):
        return f'Publisher {self.id}: {self.price}, {self.date_sale}, {self.date_sale}, {self.id_stock}, {self.count}'


def create_tables(engine):
    Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)
