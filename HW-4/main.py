import psycopg2


def create_db(conn):
    with conn.cursor() as cur:
        cur.execute("""
            DROP TABLE IF EXISTS phone_number;
            DROP TABLE IF EXISTS client;
        """)

        cur.execute("""
            CREATE TABLE IF NOT EXISTS client (
            id_client SERIAL PRIMARY KEY,
            first_name VARCHAR(30) NOT NULL,
            last_name VARCHAR(30) NOT NULL,
            email VARCHAR(60));
        """)

        cur.execute("""
            CREATE TABLE IF NOT EXISTS phone_number (
            id_phone_number SERIAL PRIMARY KEY,
            phone_number VARCHAR(12),
            id_client INT NOT NULL REFERENCES client(id_client));
        """)
        conn.commit()


def add_client(conn, first_name, last_name, email, phones=None):
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO client (first_name, last_name, email) 
            VALUES (%s, %s, %s) 
            RETURNING id_client;""", (first_name, last_name, email))
        id = cur.fetchone()[0]
        if phones:
            cur.execute("""
            INSERT INTO phone_number (phone_number, id_client)
            VALUES (%s, %s);""", (phones, id))
        conn.commit()


def add_phone(conn, id_client, phone):
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO phone_number (id_client, phone_number)
            VALUES (%s, %s);""", (id_client, phone))
    conn.commit()


def change_client(conn, id_client, first_name=None, last_name=None, email=None, phones=None):
    with conn.cursor() as cur:
        if first_name:
            cur.execute("""
                UPDATE client 
                SET first_name = %s
                WHERE id_client = %s;""", (first_name, id_client))
        if last_name:
            cur.execute("""
                UPDATE client 
                SET last_name = %s
                WHERE id_client = %s;""", (last_name, id_client))
        if email:
            cur.execute("""
                UPDATE client 
                SET email = %s
                WHERE id_client = %s;""", (email, id_client))
        if phones:
            add_phone(conn, id_client, phones)
    conn.commit()


def delete_phone(conn, id_client, phone):
    with conn.cursor() as cur:
        cur.execute("""
            DELETE FROM phone_number
            WHERE id_client = %s AND phone_number = %s;""", (id_client, phone))
    conn.commit()


def delete_client(conn, id_client):
    with conn.cursor() as cur:
        cur.execute("""
            DELETE FROM phone_number
            WHERE id_client = %s;""", (id_client,))
        cur.execute("""
            DELETE FROM client
            WHERE id_client = %s;""", (id_client,))
        conn.commit()


def find_client(conn, first_name=None, last_name=None, email=None, phone=None):
    with conn.cursor() as cur:
        if first_name:
            cur.execute("""
                SELECT c.first_name, c.last_name, c.email, pn.phone_number 
                FROM client c JOIN phone_number pn 
                ON pn.id_client = c.id_client 
                WHERE c.first_name = %s""", (first_name,))
            print(cur.fetchall())
        elif last_name:
            cur.execute("""
                SELECT c.first_name, c.last_name, c.email, pn.phone_number 
                FROM client c JOIN phone_number pn 
                ON pn.id_client = c.id_client 
                WHERE c.last_name = %s""", (last_name,))
            print(cur.fetchall())
        elif email:
            cur.execute("""
                select c.first_name, c.last_name, c.email, pn.phone_number 
                FROM client c JOIN phone_number pn 
                ON pn.id_client = c.id_client 
                WHERE c.email = %s""", (email,))
            print(cur.fetchall())
        elif phone:
            cur.execute("""
                select c.first_name, c.last_name, c.email, pn.phone_number 
                FROM client c JOIN phone_number pn 
                ON pn.id_client = c.id_client 
                WHERE pn.phone_number = %s""", (phone,))
            print(cur.fetchall())


if __name__ == '__main__':
    conn = psycopg2.connect(database='NetologyHW', user='postgres', password='postgres')

    # create_db(conn)
    # add_client(conn, 'Surikat', 'Tambovskoy', 'surtambo@boo.com')
    # add_phone(conn, 2, 7895292892)
    # change_client(conn, 2, first_name='Surikato', email='Tambov')
    # delete_phone(conn, 2, '7895292892')
    # delete_client(conn, 8)
    # find_client(conn, first_name='Surikat')
    conn.close()
