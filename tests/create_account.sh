curl -X POST http://127.0.0.1:5000/api/users \
-H "Content-Type: application/json" \
-d '{"fname": "John", "lname": "Doe", "email": "john@example.com", "password": "securepassword"}'