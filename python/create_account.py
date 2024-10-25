from flask import Flask, request, jsonify
import psycopg2
from argon2 import PasswordHasher
from argon2.exceptions import VerifyMismatchError

app = Flask(__name__)

# Database connection parameters
DB_HOST = 'localhost'
DB_NAME = 'your_db_name'
DB_USER = 'your_user'
DB_PASSWORD = 'your_password'

# Initialize Argon2 Password Hasher
ph = PasswordHasher()

def get_db_connection():
    return psycopg2.connect(
        host=DB_HOST,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )

@app.route('/api/users', methods=['POST'])
def create_user():
    data = request.get_json()

    fname = data.get('fname')
    lname = data.get('lname')
    email = data.get('email')
    password = data.get('password')

    # Input validation
    if not all([fname, lname, email, password]):
        return jsonify({"error": "All fields are required!"}), 400

    # Hash the password
    hashed_password = ph.hash(password)

    try:
        conn = get_db_connection()
        cur = conn.cursor()

        # Insert user into the database
        cur.execute(
            """
            INSERT INTO marketplace.users (fname, lname, email, password)
            VALUES (%s, %s, %s, %s)
            """,
            (fname, lname, email, hashed_password)
        )

        conn.commit()
        cur.close()
        conn.close()

        return jsonify({"message": "User created successfully!"}), 201

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
