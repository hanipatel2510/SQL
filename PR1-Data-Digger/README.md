# Data Digger Project

"Data Digger" is a practical SQL project developed using PostgreSQL. It demonstrates database design, table relationships using Primary and Foreign Keys, CRUD operations, aggregate functions, and date filtering.

---

## Database Schema & Tables

The project consists of four interconnected relational tables:

- **Customers:** CustomerID (PK), Name, Email, Address
- **Orders:** OrderID (PK), CustomerID (FK), OrderDate, TotalAmount
- **Products:** ProductID (PK), ProductName, Price, Stock
- **OrderDetails:** OrderDetailID (PK), OrderID (FK), ProductID (FK), Quantity, SubTotal

**Relationships:**
- `Customers.CustomerID` → `Orders.CustomerID`
- `Orders.OrderID` → `OrderDetails.OrderID`
- `Products.ProductID` → `OrderDetails.ProductID`

---

## Execution & Output Screenshots

### 1. Customers Table
* **Insert Customers Data:**
  ![Customers Insert](screenshots/customers_insert.png)

* **Final Table State (`SELECT * FROM Customers;`):**
  ![Customers Output](screenshots/customers_output.png)

---

### 2. Orders Table
* **Insert Orders Data:**
  ![Orders Insert](screenshots/orders_insert.png)

* **Final Table State (`SELECT * FROM Orders;`):**
  ![Orders Output](screenshots/orders_output.png)

---

### 3. Products Table
* **Insert Products Data:**
  ![Products Insert](screenshots/products_insert.png)

* **Final Table State (`SELECT * FROM Products;`):**
  ![Products Output](screenshots/products_output.png)

---

### 4. OrderDetails Table
* **Insert OrderDetails Data:**
  ![OrderDetails Insert](screenshots/orderdetails_insert.png)

* **Final Table State (`SELECT * FROM OrderDetails;`):**
  ![OrderDetails Output](screenshots/orderdetails_output.png)

---

## SQL Concepts Applied

- **DDL:** `CREATE TABLE`, `PRIMARY KEY`, `FOREIGN KEY`
- **DML:** `INSERT`, `UPDATE`, `DELETE`
- **DQL & Clauses:** `SELECT`, `WHERE`, `ORDER BY`, `BETWEEN`, `LIMIT`
- **Date Handling:** `CURRENT_DATE - INTERVAL '30 days'`
- **Aggregate Functions:** `MAX()`, `MIN()`, `AVG()`, `ROUND()`, `SUM()`, `COUNT()`, `GROUP BY`

---

## How to Run

1. Open **PostgreSQL** in **pgAdmin** or Query Tool.
2. Open and run the complete `data_digger.sql` file.
3. Check the individual verification queries to view updated data.

---

## Project Structure

```text
PR1-Data-Digger/
│
├── screenshots/
│   ├── customers_insert.png
│   ├── customers_output.png
│   ├── orders_insert.png
│   ├── orders_output.png
│   ├── products_insert.png
│   ├── products_output.png
│   ├── orderdetails_insert.png
│   └── orderdetails_output.png
├── data_digger.sql
└── README.md
