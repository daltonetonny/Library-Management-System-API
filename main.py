from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import mysql.connector
from mysql.connector import Error
from typing import List
from datetime import date

app = FastAPI(title="Library Management API")

# Database connection configuration
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'your_password',
    'database': 'library_management'
}

# Pydantic models
class Book(BaseModel):
    book_id: int | None = None
    title: str
    author: str
    isbn: str
    publication_year: int | None = None
    total_copies: int
    available_copies: int

class BookCreate(BaseModel):
    title: str
    author: str
    isbn: str
    publication_year: int | None = None
    total_copies: int
    available_copies: int

# Database connection
def get_db_connection():
    try:
        connection = mysql.connector.connect(**db_config)
        return connection
    except Error as e:
        raise HTTPException(status_code=500, detail=f"Database connection failed: {str(e)}")

# CRUD Operations for Books
@app.post("/books/", response_model=Book)
def create_book(book: BookCreate):
    connection = get_db_connection()
    cursor = connection.cursor()
    try:
        query = """INSERT INTO Books (title, author, isbn, publication_year, total_copies, available_copies)
                   VALUES (%s, %s, %s, %s, %s, %s)"""
        values = (book.title, book.author, book.isbn, book.publication_year, book.total_copies, book.available_copies)
        cursor.execute(query, values)
        connection.commit()
        book_id = cursor.lastrowid
        return {**book.dict(), "book_id": book_id}
    except Error as e:
        raise HTTPException(status_code=400, detail=str(e))
    finally:
        cursor.close()
        connection.close()

@app.get("/books/", response_model=List[Book])
def read_books():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    try:
        cursor.execute("SELECT * FROM Books")
        books = cursor.fetchall()
        return books
    except Error as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        connection.close()

@app.get("/books/{book_id}", response_model=Book)
def read_book(book_id: int):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    try:
        cursor.execute("SELECT * FROM Books WHERE book_id = %s", (book_id,))
        book = cursor.fetchone()
        if book is None:
            raise HTTPException(status_code=404, detail="Book not found")
        return book
    except Error as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        connection.close()

@app.put("/books/{book_id}", response_model=Book)
def update_book(book_id: int, book: BookCreate):
    connection = get_db_connection()
    cursor = connection.cursor()
    try:
        query = """UPDATE Books SET title = %s, author = %s, isbn = %s, publication_year = %s,
                   total_copies = %s, available_copies = %s WHERE book_id = %s"""
        values = (book.title, book.author, book.isbn, book.publication_year, book.total_copies,
                  book.available_copies, book_id)
        cursor.execute(query, values)
        if cursor.rowcount == 0:
            raise HTTPException(status_code=404, detail="Book not found")
        connection.commit()
        return {**book.dict(), "book_id": book_id}
    except Error as e:
        raise HTTPException(status_code=400, detail=str(e))
    finally:
        cursor.close()
        connection.close()

@app.delete("/books/{book_id}")
def delete_book(book_id: int):
    connection = get_db_connection()
    cursor = connection.cursor()
    try:
        cursor.execute("DELETE FROM Books WHERE book_id = %s", (book_id,))
        if cursor.rowcount == 0:
            raise HTTPException(status_code=404, detail="Book not found")
        connection.commit()
        return {"message": "Book deleted successfully"}
    except Error as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        cursor.close()
        connection.close()
