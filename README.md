# Library Management System

This is a simple library management system built using MySQL to manage books, members, categories, and loans. The system allows the addition of categories, books, members, and records of book loans, while ensuring referential integrity between the tables.

## Database Schema

The following tables are created:

### `categories` table
Stores categories of books.

| Column        | Type            | Description                                    |
|---------------|-----------------|------------------------------------------------|
| category_id   | INT             | Auto-incremented primary key                   |
| category_name | VARCHAR(100)     | Name of the category (e.g., Fiction, Science)  |

### `books` table
Stores details of the books available in the library.

| Column       | Type            | Description                                      |
|--------------|-----------------|--------------------------------------------------|
| book_id      | INT             | Auto-incremented primary key                     |
| title        | VARCHAR(255)     | Title of the book                                |
| author       | VARCHAR(255)     | Author of the book                               |
| isbn         | VARCHAR(13)      | ISBN of the book (unique)                        |
| category_id  | INT             | Foreign key to the `categories` table            |

### `members` table
Stores information about library members.

| Column     | Type            | Description                                    |
|------------|-----------------|------------------------------------------------|
| member_id  | INT             | Auto-incremented primary key                   |
| name       | VARCHAR(255)     | Name of the member                             |
| email      | VARCHAR(255)     | Email of the member (unique)                   |

### `loans` table
Stores the records of books being loaned to members.

| Column       | Type        | Description                                         |
|--------------|-------------|-----------------------------------------------------|
| loan_id      | INT         | Auto-incremented primary key                        |
| member_id    | INT         | Foreign key to the `members` table                  |
| book_id      | INT         | Foreign key to the `books` table                    |
| loan_date    | DATE        | Date when the book was loaned                       |
| return_date  | DATE        | Date when the book is due to be returned (nullable) |

## Sample Data

Some sample data has been added to the database:

### Categories
- Fiction
- Non-Fiction
- Science
- History

### Books
- **To Kill a Mockingbird** by Harper Lee (ISBN: 9780060935467)
- **Sapiens** by Yuval Noah Harari (ISBN: 9780062316110)
- **A Brief History of Time** by Stephen Hawking (ISBN: 9780553380163)
- **The History of the Ancient World** by Susan Wise Bauer (ISBN: 9780393059748)

### Members
- John Doe (Email: johndoe@example.com)
- Jane Smith (Email: janesmith@example.com)

### Loans
- John Doe has loaned "To Kill a Mockingbird" (loaned on 2025-05-01, return due 2025-05-15)
- Jane Smith has loaned "Sapiens" (loaned on 2025-05-05, return due 2025-05-20)

## Setup Instructions

1. **Create the Database:**

   ```sql
   CREATE DATABASE IF NOT EXISTS library_management;

  
  
    

    

Use the Database:

sql
Copy
Edit
USE library_management;

  
  
    

    

Run the SQL Schema:

Execute the SQL commands in the schema to create tables and insert sample data.

Modify the Schema (Optional):

You can add, remove, or modify columns, tables, or relationships based on your system's needs.

Queries
Here are some example SQL queries you can run on the system:

List all books
sql
Copy
Edit
SELECT * FROM books;

  
  
    

    

List all books in a specific category (e.g., Fiction)
sql
Copy
Edit
SELECT * FROM books WHERE category_id = (SELECT category_id FROM categories WHERE category_name = 'Fiction');

  
  
    

    

List all loans for a specific member (e.g., John Doe)
sql
Copy
Edit
SELECT * FROM loans WHERE member_id = (SELECT member_id FROM members WHERE name = 'John Doe');

  
  
    

    

License
This project is open-source and available under the MIT License.

vbnet
Copy
Edit

Feel free to modify it as needed!

  
  
