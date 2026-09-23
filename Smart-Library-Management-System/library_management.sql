DROP TABLE IF EXISTS Transactions CASCADE;
DROP TABLE IF EXISTS Books CASCADE;
DROP TABLE IF EXISTS Members CASCADE;
DROP TABLE IF EXISTS Authors CASCADE;

CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    category VARCHAR(50),
    isbn VARCHAR(20),
    published_date DATE,
    price DECIMAL(10,2),
    available_copies INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    membership_date DATE
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    fine_amount DECIMAL(10,2),
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Authors VALUES
(1, 'J.K. Rowling', 'jk@example.com'),
(2, 'George Orwell', 'george@example.com'),
(3, 'Yuval Noah Harari', 'yuval@example.com'),
(4, 'Robert Martin', NULL),
(5, 'Paulo Coelho', 'paulo@example.com');

INSERT INTO Books VALUES
(101, 'Harry Potter', 1, 'Fantasy', 'ISBN101', '2005-07-16', 450, 4),
(102, '1984', 2, 'Fiction', 'ISBN102', '2018-01-10', 350, 3),
(103, 'Sapiens', 3, 'Science', 'ISBN103', '2015-06-01', 480, 2),
(104, 'Clean Code', 4, 'Technology', 'ISBN104', '2008-08-01', 750, 5),
(105, 'The Alchemist', 5, 'Fiction', 'ISBN105', '2010-05-10', 300, 4),
(106, 'AI Future', 3, 'Science', 'ISBN106', '2021-03-15', 650, 2),
(107, 'Python Basics', 4, 'Technology', 'ISBN107', '2023-06-20', 550, 3),
(108, 'New World', 2, 'History', 'ISBN108', '1998-04-10', 400, 6);

INSERT INTO Members VALUES
(1, 'Rahul Patel', 'rahul@example.com', '9876543210', '2021-05-10'),
(2, 'Priya Shah', 'priya@example.com', '9876543211', '2022-08-15'),
(3, 'Amit Mehta', 'amit@example.com', '9876543212', '2023-02-20'),
(4, 'Neha Patel', NULL, '9876543213', '2024-01-12'),
(5, 'Riya Shah', 'riya@example.com', '9876543214', '2025-03-10'),
(6, 'Karan Patel', 'karan@example.com', '9876543215', '2026-01-15');

INSERT INTO Transactions VALUES
(1, 1, 101, '2026-01-05', '2026-01-15', 10),
(2, 1, 103, '2026-02-10', '2026-02-20', 0),
(3, 1, 105, '2026-03-05', '2026-03-25', 60),
(4, 2, 104, '2025-12-10', '2025-12-20', 0),
(5, 2, 101, '2026-01-15', '2026-02-05', 70),
(6, 3, 106, '2026-04-10', NULL, 0),
(7, 3, 107, '2026-05-15', '2026-05-25', 0),
(8, 4, 102, '2024-05-10', '2024-05-20', 0),
(9, 5, 105, '2025-10-10', '2025-10-30', 60),
(10, 6, 103, '2026-08-01', '2026-08-10', 0);

SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Transactions;

INSERT INTO Authors VALUES 
(6, 'Dan Brown', 'dan@example.com');

INSERT INTO Books VALUES  
(109, 'Inferno', 6, 'Thriller', 'ISBN109', '2013-05-14', 600, 3);

INSERT INTO Members VALUES 
(7, 'Anjali Shah', 'anjali@example.com', '9876543216', '2026-02-10');

UPDATE Books
SET available_copies = available_copies + 1
WHERE book_id = 101;

SELECT * FROM Books
WHERE available_copies > 0;

SELECT * FROM Books
WHERE published_date > '2015-12-31';

SELECT * FROM Books
ORDER BY price DESC
LIMIT 5;

SELECT * FROM Members
WHERE membership_date < '2022-01-01';

SELECT * FROM Books
WHERE category = 'Science'
AND price < 500;

SELECT * FROM Books
WHERE available_copies = 0;

SELECT m.member_id, m.name
FROM Members m
LEFT JOIN Transactions t
ON m.member_id = t.member_id
GROUP BY m.member_id, m.name, m.membership_date
HAVING m.membership_date > '2020-12-31'
OR COUNT(t.transaction_id) > 3;

SELECT * FROM Books
ORDER BY title ASC;

SELECT member_id, COUNT(*) AS total_books 
FROM Transactions
GROUP BY member_id;

SELECT category, COUNT(*) AS total_books 
FROM Books
GROUP BY category;

SELECT SUM(available_copies) AS total_books FROM Books;

SELECT AVG(price) AS average_price FROM Books;

SELECT book_id, COUNT(*) AS borrow_count
FROM Transactions
GROUP BY book_id
ORDER BY borrow_count DESC
LIMIT 1;

SELECT SUM(fine_amount) AS total_fine FROM Transactions;

SELECT b.title, a.name AS author_name
FROM Books b
INNER JOIN Authors a
ON b.author_id = a.author_id;

SELECT m.name, t.book_id
FROM Members m
LEFT JOIN Transactions t
ON m.member_id = t.member_id;

SELECT b.title
FROM Transactions t
RIGHT JOIN Books b
ON t.book_id = b.book_id
WHERE t.transaction_id IS NULL;

SELECT m.member_id, m.name, t.transaction_id
FROM Members m
FULL OUTER JOIN Transactions t
ON m.member_id = t.member_id;

SELECT title
FROM Books
WHERE book_id IN (
    SELECT book_id 
    FROM Transactions 
    WHERE member_id IN (
        SELECT member_id
        FROM Members
        WHERE membership_date > '2022-12-31'
    )
);

SELECT title FROM Books
WHERE book_id = (
    SELECT book_id 
    FROM Transactions 
    GROUP BY book_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

SELECT name
FROM Members
WHERE member_id NOT IN (
    SELECT member_id FROM Transactions WHERE member_id IS NOT NULL
);

SELECT title, EXTRACT(YEAR FROM published_date)::INT AS publication_year
FROM Books;

SELECT transaction_id, (return_date - borrow_date) AS days_taken
FROM Transactions
WHERE return_date IS NOT NULL;

SELECT transaction_id,
CASE
    WHEN (return_date - borrow_date) > 14
    THEN ((return_date - borrow_date) - 14) * 10
    ELSE 0
END AS late_fine
FROM Transactions
WHERE return_date IS NOT NULL;

SELECT transaction_id,
TO_CHAR(borrow_date, 'DD-MM-YYYY') AS borrow_date
FROM Transactions;

SELECT UPPER(title) AS title
FROM Books;

SELECT TRIM(name) AS author_name
FROM Authors;

SELECT name,
COALESCE(email, 'Not Provided') AS email
FROM Members;

SELECT b.title,
COUNT(t.transaction_id) AS borrow_count,
RANK() OVER (
    ORDER BY COUNT(t.transaction_id) DESC
) AS book_rank
FROM Books b
LEFT JOIN Transactions t
ON b.book_id = t.book_id
GROUP BY b.book_id, b.title;

SELECT member_id,
borrow_date,
COUNT(*) OVER (
    PARTITION BY member_id
    ORDER BY borrow_date
) AS cumulative_books
FROM Transactions;

SELECT month, total_books, AVG(total_books) OVER (
    ORDER BY month
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS moving_average
FROM (
    SELECT TO_CHAR(borrow_date, 'YYYY-MM') AS month,
    COUNT(*) AS total_books
    FROM Transactions
    GROUP BY TO_CHAR(borrow_date, 'YYYY-MM')
) AS x;

SELECT m.name,
CASE
    WHEN MAX(t.borrow_date) >= CURRENT_DATE - INTERVAL '6 month'
    THEN 'Active'
    ELSE 'Inactive'
END AS Membership_Status
FROM Members m
LEFT JOIN Transactions t
ON m.member_id = t.member_id
GROUP BY m.member_id, m.name;

SELECT title,
CASE
    WHEN published_date > '2020-12-31' THEN 'New Arrival'
    WHEN published_date < '2000-01-01' THEN 'Classic'
    ELSE 'Regular'
END AS book_type
FROM Books;
