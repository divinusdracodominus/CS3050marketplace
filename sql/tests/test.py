import os
import uuid
import psycopg2
from psycopg2 import sql
from argon2 import PasswordHasher

def get_connection():
    """Establish a connection to the PostgreSQL database."""
    try:
        return psycopg2.connect(
            database=os.getenv("DB_NAME", "cardinal"),
            user=os.getenv("DB_USER", "cardinal"),
            password=os.getenv("DB_PASSWORD", "password"),
            host=os.getenv("DB_HOST", "127.0.0.1"),
            port=os.getenv("DB_PORT", 5432),
        )
    except psycopg2.Error as e:
        raise Exception(f"Database connection error: {e}")

def create_user(cursor):
    """Create a new user and return the user's ID."""
    user_id = uuid.uuid4()
    password = "Password"
    hasher = PasswordHasher()
    hashed_password = hasher.hash(password)

    cursor.execute(
        "INSERT INTO marketplace.users (id, email, password) VALUES (%s, %s, %s)",
        (str(user_id), "email@gmail.com", hashed_password)
    )
    return user_id

def create_item(cursor, user_id):
    """Create a new item and return the item's ID."""
    item_id = uuid.uuid4()
    cursor.execute(
        "INSERT INTO marketplace.items (id, name, quantity, description, seller) VALUES (%s, %s, %s, %s, %s)",
        (str(item_id), "Intro to Rust Programming", 4, "A book about how to program in the Rust programming language", str(user_id))
    )
    return item_id

def create_address(cursor):
    """Create a new address and return the address ID."""
    addr_id = uuid.uuid4()
    cursor.execute(
        "INSERT INTO marketplace.addresses (id, street, city, state, country, zip_code) VALUES (%s, %s, %s, %s, %s, %s)",
        (str(addr_id), "926 Main St", "Worcester", "Massachusetts", "US", 1610)
    )
    return addr_id

def create_purchase(cursor, user_id):
    """Create a new purchase and return the purchase ID."""
    purchase_id = uuid.uuid4()
    cursor.execute(
        "INSERT INTO marketplace.purchases (id, purchaser) VALUES (%s, %s)",
        (str(purchase_id), str(user_id))
    )
    return purchase_id

def link_purchase(cursor, purchase_id, item_id):
    """Link a purchase to an item."""
    cursor.execute(
        "INSERT INTO marketplace.purchaserel (purchase, item) VALUES (%s, %s)",
        (str(purchase_id), str(item_id))
    )

def cleanup_test_data(cursor, user_id, item_id, addr_id, purchase_id):
    """Cleanup test data."""
    cursor.execute("DELETE FROM marketplace.purchaserel WHERE purchase = %s AND item = %s", (str(purchase_id), str(item_id)))
    cursor.execute("DELETE FROM marketplace.purchases WHERE id = %s", (str(purchase_id),))
    cursor.execute("DELETE FROM marketplace.items WHERE id = %s", (str(item_id),))
    cursor.execute("DELETE FROM marketplace.addresses WHERE id = %s", (str(addr_id),))
    cursor.execute("DELETE FROM marketplace.users WHERE id = %s", (str(user_id),))

if __name__ == "__main__":
    try:
        with get_connection() as conn:
            with conn.cursor() as cursor:
                user_id = create_user(cursor)
                item_id = create_item(cursor, user_id)
                addr_id = create_address(cursor)
                purchase_id = create_purchase(cursor, user_id)
                link_purchase(cursor, purchase_id, item_id)
                conn.commit()  # Commit all changes

                # Cleanup test data after operations
                cleanup_test_data(cursor, user_id, item_id, addr_id, purchase_id)
                conn.commit()
    except Exception as e:
        print(e)