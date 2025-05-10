-- Create the database
CREATE DATABASE IF NOT EXISTS library_management;

-- Use the database
USE library_management;

-- Create the Categories table
CREATE TABLE IF NOT EXISTS categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Create the Books table
CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) NOT NULL UNIQUE,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL
);

-- Create the Members table
CREATE TABLE IF NOT EXISTS members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Create the Loans table (many-to-many relationship between Books and Members)
CREATE TABLE IF NOT EXISTS loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE
);

-- Sample data insertion (optional)
-- Categories
INSERT INTO categories (category_name) VALUES ('Fiction'), ('Non-Fiction'), ('Science'), ('History');

-- Books (using category_ids from the categories table)
INSERT INTO books (title, author, isbn, category_id) 
VALUES 
('To Kill a Mockingbird', 'Harper Lee', '9780060935467', 1),
('Sapiens', 'Yuval Noah Harari', '9780062316110', 2),
('A Brief History of Time', 'Stephen Hawking', '9780553380163', 3),
('The History of the Ancient World', 'Susan Wise Bauer', '9780393059748', 4);

-- Members
INSERT INTO members (name, email) 
VALUES 
('John Doe', 'johndoe@example.com'),
('Jane Smith', 'janesmith@example.com');

-- Loans (Assuming member_ids 1 and 2, book_ids 1 and 2)
INSERT INTO loans (member_id, book_id, loan_date, return_date) 
VALUES 
(1, 1, '2025-05-01', '2025-05-15'),
(2, 2, '2025-05-05', '2025-05-20');
