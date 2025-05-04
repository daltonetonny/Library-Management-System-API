Library Management System API
Project Description
This project implements a Library Management System with a MySQL database and a CRUD API built using Python and FastAPI. The system manages books, members, categories, and loans, with a focus on book-related CRUD operations in the API.
Features

MySQL database with tables for Books, Members, Categories, Book_Categories, and Loans
RESTful API for CRUD operations on Books
Input validation using Pydantic models
Proper error handling for database operations

Setup Instructions
Prerequisites

Python 3.8+
MySQL Server
Git

Installation

Clone the repository:

git clone https://github.com/yourusername/library-management-api.git
cd library-management-api


Create a virtual environment and install dependencies:

python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install fastapi uvicorn mysql-connector-python


Set up the MySQL database:


Create a MySQL database named library_management
Import the SQL script:

mysql -u your_username -p library_management < library_management.sql


Update the database configuration in main.py with your MySQL credentials


Run the application:

uvicorn main:app --reload


Access the API at http://localhost:8000
API documentation available at http://localhost:8000/docs

Database Schema (ERD)
Note: Create an ERD using tools like MySQL Workbench or draw.io and save as erd.png
Project Structure
library-management-api/
├── main.py               # FastAPI application
├── library_management.sql # Database schema and sample data
├── README.md            # Project documentation
└── requirements.txt     # Project dependencies

API Endpoints

POST /books/ - Create a new book
GET /books/ - List all books
GET /books/{book_id} - Get a specific book
PUT /books/{book_id} - Update a book
DELETE /books/{book_id} - Delete a book

