# Library Management System

A simple library management system that allows managing books, members, and loan records. The system uses a MySQL database to store the data and provides basic functionalities such as adding books, adding members, loaning books, returning books, and listing books and loans.

## Features

- **Books Management**: Add new books, list books, and manage book details.
- **Members Management**: Add new members and store member information.
- **Loans Management**: Loan books to members, return books, and list current loans.
- **Categories**: Categorize books into different genres.

## Database Schema

The system uses the following tables:

1. **categories**: Stores categories of books (e.g., Fiction, Non-Fiction).
2. **books**: Stores book details like title, author, ISBN, and category.
3. **members**: Stores member details (name, email).
4. **loans**: Stores information about book loans, linking books to members.

## Setup Instructions

### Prerequisites

- **MySQL Server**: Make sure MySQL is installed and running on your machine.
- **Python 3.8+**: The system uses Python for running the scripts (if you're planning to extend it).
- **MySQL Connector for Python**: Required to interact with the MySQL database.

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/library-management-system.git
   cd library-management-system

  
  
    

    

Set up MySQL Database:

Run the provided SQL script to create the database and tables:

sql
Copy
Edit
-- Create the library_management database
CREATE DATABASE IF NOT EXISTS library_management;

-- Switch to the library_management database
USE library_management;

-- Create the tables (Categories, Books, Members, Loans)
-- Run the provided SQL script here.

  
  
    

    

You can import the SQL file directly into MySQL using:

bash
Copy
Edit
mysql -u your_username -p library_management < library_management.sql

  
  
    

    

Set up Python Environment (optional for Python-based extensions):
If you want to extend the functionality using Python scripts, create a Python virtual environment and install dependencies:

bash
Copy
Edit
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install mysql-connector-python

  
  
    

    

Usage
Run the System:

Use the library_management_system.py script to interact with the system.

The script provides a simple CLI interface for managing books, members, and loans.

To run the system, use:

bash
Copy
Edit
python library_management_system.py

  
  
    

    

Available Commands:
The system will display a menu with the following options:

Add Book: Add a new book to the library.

List Books: View all books in the library.

Add Member: Add a new member to the system.

Loan Book: Loan a book to a member.

Return Book: Return a loaned book.

List Loans: View all current loans.

Exit: Exit the system.

Sample Data:
The system includes sample data for categories, books, members, and loans. You can modify or add more data using the provided interface.

License
This project is licensed under the MIT License - see the LICENSE file for details.

Contributing
Feel free to fork this project, create issues, or submit pull requests to improve the functionality. Contributions are welcome!
