# PR 2 – Data Transformer

## 📌 Project Overview

**Data Transformer** is a PostgreSQL-based SQL project created to practice data transformation, analysis, and advanced SQL operations in a corporate data environment.

The project works with three main tables:

- **Customers** – customer registration and contact information
- **Orders** – customer orders, order dates, and transaction amounts
- **Employees** – employee department, hiring date, and salary information

---

## 🎯 Objective

The main objective of this project is to develop practical SQL skills required for:

- Data reporting
- Data transformation
- Data cleaning
- Relational data analysis
- Date and string manipulation
- Analytical calculations
- Business-rule implementation

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| PostgreSQL | Database and SQL operations |
| pgAdmin 4 | Query execution and result verification |
| SQL | Data creation, transformation, and analysis |
| GitHub | Project submission and version control |

---

## 🗃️ Database Design

### 1. Customers Table

| Column | Data Type | Constraint |
|---|---|---|
| CustomerID | INT | Primary Key |
| FirstName | VARCHAR(50) | NOT NULL |
| LastName | VARCHAR(50) | NOT NULL |
| Email | VARCHAR(100) | NOT NULL |
| RegistrationDate | DATE | NOT NULL |

### 2. Orders Table

| Column | Data Type | Constraint |
|---|---|---|
| OrderID | INT | Primary Key |
| CustomerID | INT | Foreign Key |
| OrderDate | DATE | NOT NULL |
| TotalAmount | DECIMAL(10,2) | NOT NULL |

**Relationship:** `Orders.CustomerID → Customers.CustomerID`

### 3. Employees Table

| Column | Data Type | Constraint |
|---|---|---|
| EmployeeID | INT | Primary Key |
| FirstName | VARCHAR(50) | NOT NULL |
| LastName | VARCHAR(50) | NOT NULL |
| Department | VARCHAR(50) | NOT NULL |
| HireDate | DATE | NOT NULL |
| Salary | DECIMAL(10,2) | NOT NULL |

---

## 📸 Database Tables

### Customers Table

<img width="982" height="232" alt="image" src="https://github.com/user-attachments/assets/cccc8531-4472-4154-a323-ac966569404c" />

### Orders Table 

<img width="590" height="337" alt="image" src="https://github.com/user-attachments/assets/16c6fe55-a79c-4215-b032-4935a5ac4503" />

### Employees Table

<img width="1107" height="231" alt="image" src="https://github.com/user-attachments/assets/854846ba-63e3-4b04-a6f5-445674493039" />

### FULL OUTER JOIN 

<img width="972" height="342" alt="image" src="https://github.com/user-attachments/assets/649b6ea1-ead7-46c5-a346-c169be958578" />

### Running Total using Window Function

<img width="595" height="337" alt="image" src="https://github.com/user-attachments/assets/a2e6a33c-d091-4216-8fc6-5e923802abc2" />

### Discount Classification using CASE
<img width="467" height="342" alt="image" src="https://github.com/user-attachments/assets/86d84f11-2101-4cd0-b1b8-fab966bcea51" />

---

## 🔍 SQL Work Performed

### 🔗 JOIN Operations

- **INNER JOIN** – retrieves matching customer and order records.
- **LEFT JOIN** – retrieves all customers and their matching orders.
- **RIGHT JOIN** – retrieves all orders and their corresponding customers.
- **FULL OUTER JOIN** – retrieves all customers and all orders, including unmatched records.

### 🔎 Subqueries

- Find customers who placed orders above the average order amount.
- Find employees whose salary is above the average salary.

### 📅 Date Operations

- Extract year from `OrderDate`
- Extract month from `OrderDate`
- Calculate the difference between `OrderDate` and the current date
- Format dates into `DD-Mon-YYYY`

Functions used: `EXTRACT()` · `CURRENT_DATE` · `TO_CHAR()`

### 🔤 String Operations

- `CONCAT()` to create a full name
- `REPLACE()` to replace part of a string
- `UPPER()` to convert text to uppercase
- `LOWER()` to convert text to lowercase
- `TRIM()` to remove extra spaces from email data

### 📊 Window Functions

- `SUM() OVER()` for a running total of order amounts
- `RANK() OVER()` for ranking orders by `TotalAmount`

### 🧠 CASE Expressions

Business rules are implemented using `CASE`, `WHEN`, `THEN`, `ELSE`, and `END`.

**Order Discount**

| Condition | Discount |
|---|---|
| TotalAmount > 1000 | 10% Off |
| TotalAmount > 500 | 5% Off |
| TotalAmount <= 500 | No Discount |

**Employee Salary Category**

| Salary | Category |
|---|---|
| >= 60000 | High |
| >= 50000 | Medium |
| < 50000 | Low |

> **Assumption:** The salary category limits were selected because the assignment does not specify exact thresholds.

---

## 📚 SQL Concepts Practiced

| Area | Concepts |
|---|---|
| Joins | INNER, LEFT, RIGHT, FULL OUTER |
| Subqueries | AVG with nested SELECT |
| Date Functions | EXTRACT, CURRENT_DATE, TO_CHAR |
| String Functions | CONCAT, REPLACE, UPPER, LOWER, TRIM |
| Window Functions | SUM() OVER(), RANK() OVER() |
| Conditional Logic | CASE, WHEN, THEN, ELSE, END |
| Database Design | Primary Key, Foreign Key, Constraints |
| Data Analysis | Running total, ranking, average comparison |

---

## ▶️ How to Run

1. Open **pgAdmin 4**.
2. Create or select a PostgreSQL database.
3. Open **Query Tool**.
4. Open `Data_Transformer.sql`.
5. Run the complete SQL script.
6. Verify the three tables:

```sql
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM employees;
```

7. Execute the required queries individually to verify the results.
8. Save the three table screenshots in the `screenshots` folder.
9. Upload the SQL file, README, and screenshots to GitHub.

---

## 📁 Project Structure

```text
PR2-Data-Transformer/
│
├── Data_Transformer.sql
├── README.md

```

---

## 💼 Practical Use Cases

- Customer and order reporting
- Identifying high-value orders
- Comparing employee salaries
- Cleaning customer contact information
- Date-based reporting
- Cumulative sales analysis
- Transaction ranking
- Applying discounts using business rules
- Employee salary classification

---

## ✅ Project Highlights

- Designed three relational tables
- Applied Primary Key and Foreign Key constraints
- Performed multiple JOIN operations
- Used subqueries for average-based analysis
- Applied date and string transformation functions
- Used window functions for analytical calculations
- Implemented business logic using `CASE`
- Documented assumptions clearly
- Organized the project for GitHub submission

---

## 🎓 Key Learning Outcomes

Through this project, I practiced:

* Designing relational tables using **Primary Key and Foreign Key constraints**
* Working with multiple types of **SQL JOINs**
* Using **subqueries** for comparative analysis
* Performing **date and string transformations**
* Cleaning text data using SQL functions
* Applying **window functions** for analytical calculations
* Implementing business rules using **CASE expressions**
* Organizing SQL queries into a structured and reusable project
* Documenting assumptions and analytical logic

---

## 📌 Conclusion

The **Data Transformer** project provides practical experience with PostgreSQL and advanced SQL techniques used in data analysis and reporting.

It demonstrates how relational data can be joined, transformed, cleaned, analyzed, and categorized using SQL.

---

