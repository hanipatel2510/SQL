--1. create table customer
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Address VARCHAR(200)
);

--  Insert Customers Data
INSERT INTO Customers (CustomerID, Name, Email, Address) VALUES
(1, 'Alice', 'alice@gmail.com', 'Ahmedabad'),
(2, 'Rahul', 'rahul@gmail.com', 'Vadodara'),
(3, 'Priya', 'priya@gmail.com', 'Surat'),
(4, 'Neha', 'neha@gmail.com', 'Rajkot'),
(5, 'Amit', 'amit@gmail.com', 'Gandhinagar'),
(6, 'Alice', 'alice6@gmail.com', 'Jaipur');

--  Retrieve all customer details
SELECT * from Customers;

--  Update a customer's address
UPDATE Customers 
SET Address = 'Gandhinagar'
WHERE CustomerID = 1; 

--  Delete a customer using their CustomerID
DELETE FROM Customers 
WHERE CustomerID = 6;

--  Display all customers whose name is 'Alice'
SELECT * FROM Customers
WHERE Name = 'Alice';
SELECT * FROM Customers;

-- 2. Create Table Order
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount NUMERIC(10,2),
    CONSTRAINT fk_orders_customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--  Insert Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, CURRENT_DATE - 5, 55000.00),
(102, 2, CURRENT_DATE - 10, 25000.00),
(103, 3, CURRENT_DATE - 45, 3000.00),
(104, 4, CURRENT_DATE - 20, 5000.00),
(105, 1, CURRENT_DATE - 2,  2700.00),
(106, 5, CURRENT_DATE - 2,  2700.00);

-- 1. Retrieve all orders made by a specific customer
SELECT * FROM Orders
WHERE CustomerID = 1;

-- 2. Update an order's total amount
UPDATE Orders
SET TotalAmount = 2800.00
WHERE OrderID = 105;

--3. Delete an order using its OrderID
DELETE FROM Orders
WHERE OrderID =  106;

-- 4. Retrieve orders placed in the last 30 days
SELECT * FROM Orders
WHERE OrderDate >= CURRENT_DATE - INTERVAL '30 days';

-- 5. Highest, lowest and average order amount
SELECT MAX(TotalAmount) AS Highest_Order,
MIN(TotalAmount) AS Lowest_Order,
ROUND(AVG(TotalAmount), 2) AS Average_Order
FROM Orders;

SELECT * FROM Orders;

--3. Create Table Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price NUMERIC(10,2),
    Stock INT
);

--  Insert Products
INSERT INTO Products (ProductID, ProductName, Price, Stock) VALUES
(201, 'Wireless Mouse', 450.00, 20),
(202, 'Mechanical Keyboard', 1500.00, 15),
(203, 'USB-C Hub', 850.00, 0),
(204, 'Gaming Headset', 2200.00, 8),
(205, 'Laptop Stand', 600.00, 25),
(206, 'Monitor 24-inch', 8500.00, 5);

-- 1. Retrieve all products sorted by price descending
SELECT * FROM Products
ORDER BY Price DESC;

-- 2. Update the price of a specific product
UPDATE Products
SET Price = 1600.00
WHERE ProductID = 202;

--3. Delete a product If it's out of stock
DELETE FROM Products
WHERE Stock = 0;

-- 4. Retrieve products with price between 500 and 2000
SELECT * FROM Products
WHERE Price BETWEEN 500.00 AND 2000.00;

-- 5. Most expensive and cheapest product using MAX() and MIN()
SELECT MAX(Price) AS Most_Expensive_Price,
MIN(Price) AS Cheapest_Price
FROM Products;

SELECT * FROM Products;

--4. Create Table OderDetails
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal NUMERIC(10,2),
    CONSTRAINT fk_orderdetails_order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT fk_orderdetails_product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 101, 201, 2, 900.00),
(2, 101, 202, 1, 1600.00),
(3, 102, 205, 2, 1200.00),
(4, 103, 204, 2, 4400.00),
(5, 101, 202, 1, 1600.00),
(6, 105, 205, 2, 1200.00);

-- 1. Retrieve all order details for a specific order
SELECT * from OrderDetails
WHERE OrderID = 101;

-- 2. Calculate total revenue generated from all orders using SUM()
SELECT SUM(SubTotal) AS Total_Revenue
FROM OrderDetails;

-- 3. Retrieve the top 3 most ordered products by total quantity
SELECT ProductID, 
SUM(Quantity) AS Total_Quantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY Total_Quantity DESC
LIMIT 3;

-- 4. Count how many times a specific product has been sold using COUNT()
SELECT ProductID,
COUNT(*) AS Times_Sold
FROM OrderDetails
WHERE ProductID = 202
GROUP BY ProductID;

SELECT * FROM OrderDetails;