DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS employees CASCADE;

CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    RegistrationDate DATE NOT NULL
);
 
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_orders_customer FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

CREATE TABLE employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);

INSERT INTO customers (CustomerID, FirstName, LastName, Email, RegistrationDate) VALUES
(1, 'John', 'Doe', ' john.doe@email.com ', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
(3, 'Michael', 'Brown', 'michael.brown@email.com', '2023-01-20'),
(4, 'Emily', 'Davis', 'emily.davis@email.com', '2024-02-10'),
(5, 'Robert', 'Wilson', 'robert.wilson@email.com', '2024-06-18');

INSERT INTO orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-08-10', 750.00),
(104, 3, '2023-09-15', 1200.00),
(105, 2, '2024-01-12', 550.00),
(106, 4, '2024-03-05', 1500.00),
(107, 3, '2024-05-21', 800.00),
(108, 5, '2024-07-11', 1100.00);

INSERT INTO employees (EmployeeID, FirstName, LastName, Department, HireDate, Salary) VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
(3, 'David', 'Miller', 'IT', '2019-06-10', 70000.00),
(4, 'Emma', 'Taylor', 'Finance', '2022-09-01', 62000.00),
(5, 'Daniel', 'Anderson', 'IT', '2018-11-25', 90000.00);

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM employees;
-- Q1. INNER JOIN
SELECT o.OrderID,o.OrderDate, o.TotalAmount, c.CustomerID,c.FirstName, c.LastName,c.Email
FROM orders o
INNER JOIN customers c
ON o.CustomerID = c.CustomerID
ORDER BY o.OrderID;

-- Q2. LEFT JOIN
SELECT c.CustomerID,c.FirstName,c.LastName,o.OrderID,o.OrderDate,o.TotalAmount
FROM customers c
LEFT JOIN orders o
ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID, o.OrderID;

-- Q3. RIGHT JOIN
SELECT o.OrderID,o.OrderDate,o.TotalAmount,c.CustomerID,c.FirstName,c.LastName
FROM customers c
RIGHT JOIN orders o
ON c.CustomerID = o.CustomerID
ORDER BY o.OrderID;

-- Q4. FULL OUTER JOIN
SELECT c.CustomerID,c.FirstName,c.LastName,o.OrderID,o.OrderDate,o.TotalAmount
FROM customers c
FULL OUTER JOIN orders o
ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID NULLS LAST, o.OrderID;

-- Q5. Subquery: customers with an order above the average order amount
SELECT DISTINCT c.CustomerID,c.FirstName,c.LastName
FROM customers c
INNER JOIN orders o
ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (SELECT AVG(TotalAmount) FROM orders)
ORDER BY c.CustomerID;

-- Q6. Subquery: employees with salary above average salary
SELECT EmployeeID,FirstName,LastName,Department,Salary
FROM employees
WHERE Salary > (SELECT AVG(Salary)FROM employees)
ORDER BY Salary DESC;

-- Q7. Extract year and month from OrderDate
SELECT OrderID,OrderDate,
    EXTRACT(YEAR FROM OrderDate) AS OrderYear,
    EXTRACT(MONTH FROM OrderDate) AS OrderMonth
FROM orders
ORDER BY OrderID;

-- Q8. Difference in days between OrderDate and current date
SELECT OrderID,OrderDate,
    CURRENT_DATE AS CurrentDate,
    (CURRENT_DATE - OrderDate) AS DaysDifference
FROM orders
ORDER BY OrderID;

-- Q9. Format OrderDate as DD-Mon-YYYY
SELECT OrderID,OrderDate,
    TO_CHAR(OrderDate, 'DD-Mon-YYYY') AS FormattedOrderDate
FROM orders
ORDER BY OrderID;

-- Q10. Concatenate FirstName and LastName
SELECT CustomerID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM customers
ORDER BY CustomerID;

-- Q11. Replace 'John' with 'Jonathan'
SELECT CustomerID,
    REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedFirstName
FROM customers
ORDER BY CustomerID;

-- Q12. FirstName uppercase and LastName lowercase
SELECT CustomerID,
    UPPER(FirstName) AS FirstNameUpper,
    LOWER(LastName) AS LastNameLower
FROM customers
ORDER BY CustomerID;

-- Q13. Trim extra spaces from Email
SELECT CustomerID,
    Email AS OriginalEmail,
    TRIM(Email) AS CleanEmail
FROM customers
ORDER BY CustomerID;

-- Q14. Running total of TotalAmount
SELECT OrderID,OrderDate,TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate, OrderID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal
FROM orders
ORDER BY OrderDate, OrderID;

-- Q15. Rank orders by TotalAmount
SELECT OrderID,totalAmount,
    RANK() OVER (ORDER BY TotalAmount DESC) AS AmountRank
FROM orders
ORDER BY AmountRank, OrderID;

-- Q16. Assign discount based on TotalAmount
SELECT OrderID, TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN '10% Off'
        WHEN TotalAmount > 500 THEN '5% Off'
        ELSE 'No Discount'
    END AS Discount
FROM orders
ORDER BY OrderID;

-- Q17. Categorize employee salaries
-- Assumption: High >= 60000, Medium >= 50000, Low < 50000
SELECT EmployeeID,FirstName,LastName,Salary,
    CASE
        WHEN Salary >= 60000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM employees
ORDER BY Salary DESC;
