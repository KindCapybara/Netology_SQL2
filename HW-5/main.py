import os
import sqlalchemy
from sqlalchemy.orm import sessionmaker
import json
from models import Publisher, Book, Shop, Stock, Sale, create_tables


def find_publisher_name(session, publisher_input=None):
    if publisher_input.isdigit():
        subq = session.query(Sale).join(Stock).join(Shop).join(Book).join(Publisher).filter(Publisher.id == publisher_input)
        return subq
    else:
        subq = session.query(Sale).join(Stock).join(Shop).join(Book).join(Publisher).filter(Publisher.name.ilike(f'%{publisher_input}%'))
        return subq


def insert_data(session):
    with open('test_data.json', 'r') as f:
        data = json.load(f)

    for record in data:
        model = {
            'publisher': Publisher,
            'shop': Shop,
            'book': Book,
            'stock': Stock,
            'sale': Sale,
        }[record.get('model')]
        session.add(model(id=record.get('pk'), **record.get('fields')))
    session.commit()


if __name__ == '__main__':
    db_user = os.getenv("db_user")
    db_pass = os.getenv("db_pass")
    db_name = os.getenv("db_name")
    DSN = f"postgresql://{db_user}:{db_pass}@localhost:5432/{db_name}"

    publisher_input = input('Input a publisher: ')

    engine = sqlalchemy.create_engine(DSN)
    Session = sessionmaker(bind=engine)
    session = Session()
    create_tables(engine)
    insert_data(session)
    for sale in find_publisher_name(session, publisher_input):
        print(f'{sale.stock.book.title}| {sale.stock.shop.name} | {sale.price} | {sale.date_sale}')
