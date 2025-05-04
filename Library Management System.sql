-- Creating the database for Library Management System
CREATE DATABASE IF NOT EXISTS library_management;
USE library_management;

-- Creating table for Books
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100) NOT NULL,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    publication_year INT,
    total_copies INT NOT NULL DEFAULT 1,
    available_copies INT NOT NULL DEFAULT 1,
    CHECK (available_copies <= total_copies)
);

-- Creating table for Members
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    join_date DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Creating table for Categories
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

-- Creating junction table for Book-Category (Many-to-Many relationship)
CREATE TABLE Book_Categories (
    book_id INT,
    category_id INT,
    PRIMARY KEY (book_id, category_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE
);

-- Creating table for Loans (1-M relationship between Members and Loans, Books and Loans)
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    loan_date DATE NOT NULL DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    return_date DATE,
    fine_amount DECIMAL(5,2) DEFAULT 0.00,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE RESTRICT,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE RESTRICT
);

-- Inserting sample data into Books
INSERT INTO Books (title, author, isbn, publication_year, total_copies, available_copies) VALUES
('To Kill a Mockingbird', 'Harper Lee', '9780446310789', 1960, 5, 3),
('1984', 'George Orwell', '9780451524935', 1949, 3, 2),
('Pride and Prejudice', 'Jane Austen', '9780141439518', 1813, 4, 4);

-- Inserting sample data into Members
INSERT INTO Members (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@email.com', '555-0101'),
('Jane', 'Smith', 'jane.smith@email.com', '555-0102'),
('Alice', 'Johnson', 'alice.j@email.com', '555-0103');

-- Inserting sample data into Categories
INSERT INTO Categories (category_name) VALUES
('Fiction'),
('Classic'),
('Dystopian');

-- Inserting sample data into Book_Categories
INSERT INTO Book_Categories (book_id, category_id) VALUES
(1, 1), (1, 2),
(2, 1), (2, 3),
(3, 1), (3, 2);

-- Inserting sample data into Loans
INSERT INTO Loans (book_id, member_id, loan_date, due_date, return_date, fine_amount) VALUES
(1, 1, '2025-04-01', '2025-04-15', '2025-04-10', 0.00),
(2, 2, '2025-04-02', '2025-04-16', NULL, 0.00);
