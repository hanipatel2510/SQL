# 🎓 University Course Management System – SQL Final Project

## 📌 Project Overview

**University Course Management System** is a PostgreSQL-based SQL project created to manage university data related to students, courses, instructors, enrollments, and departments.

The project demonstrates relational database design, CRUD operations, data analysis, joins, aggregation, subqueries, and advanced SQL functions.

---

## 🎯 Objective

The main objective of this project is to:

- Design a relational university database.
- Create and connect five related tables.
- Perform CRUD operations on all tables.
- Retrieve and analyze data using SQL queries.
- Apply joins, aggregation, subqueries, and SQL functions.
- Implement conditional logic and running totals.

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| PostgreSQL | Database and SQL operations |
| pgAdmin 4 | Query execution and result verification |
| SQL | Data creation, analysis, and transformation |
| GitHub | Project submission and version control |

---

## 🗃️ Database Design

### 1. Students Table

| Column | Data Type | Constraint |
|---|---|---|
| StudentID | INT | Primary Key |
| FirstName | VARCHAR(50) | NOT NULL |
| LastName | VARCHAR(50) | NOT NULL |
| Email | VARCHAR(100) | UNIQUE, NOT NULL |
| BirthDate | DATE | NOT NULL |
| EnrollmentDate | DATE | NOT NULL |

### 2. Courses Table

| Column | Data Type | Constraint |
|---|---|---|
| CourseID | INT | Primary Key |
| CourseName | VARCHAR(100) | NOT NULL |
| DepartmentID | INT | Foreign Key |
| Credits | INT | NOT NULL |

### 3. Instructors Table

| Column | Data Type | Constraint |
|---|---|---|
| InstructorID | INT | Primary Key |
| FirstName | VARCHAR(50) | NOT NULL |
| LastName | VARCHAR(50) | NOT NULL |
| Email | VARCHAR(100) | UNIQUE, NOT NULL |
| DepartmentID | INT | Foreign Key |
| Salary | NUMERIC(10,2) | Added using ALTER TABLE |

### 4. Enrollments Table

| Column | Data Type | Constraint |
|---|---|---|
| EnrollmentID | INT | Primary Key |
| StudentID | INT | Foreign Key |
| CourseID | INT | Foreign Key |
| EnrollmentDate | DATE | NOT NULL |

### 5. Departments Table

| Column | Data Type | Constraint |
|---|---|---|
| DepartmentID | INT | Primary Key |
| DepartmentName | VARCHAR(100) | NOT NULL |

---

## 🔗 Database Relationships

```text
                    Departments
                    /          \
                   /            \
                  ▼              ▼
           Instructors         Courses
                                  │
                                  ▼
                            Enrollments
                              ▲      │
                              │      │
                           Students  │
```

- **Departments → Instructors:** One-to-Many
- **Departments → Courses:** One-to-Many
- **Students → Enrollments:** One-to-Many
- **Courses → Enrollments:** One-to-Many
- **Students ↔ Courses:** Many-to-Many through **Enrollments**

**Foreign Key Connections:**

```text
Instructors.DepartmentID → Departments.DepartmentID
Courses.DepartmentID     → Departments.DepartmentID
Enrollments.StudentID    → Students.StudentID
Enrollments.CourseID     → Courses.CourseID
```

---

## 📸 Selected Query Results
### Students Table

![Students Table](screenshots/students_table.png)

### Courses Table

![Courses Table](screenshots/courses_table.png)

### Instructors Table

![Instructors Table](screenshots/instructors_table.png)

### Enrollments Table

![Enrollments Table](screenshots/enrollments_table.png)

### Departments Table

![Departments Table](screenshots/departments_table.png)

### Courses with More Than 5 Students

![Courses More Than 5 Students](screenshots/courses_more_than_5.png)

### Students and Their Courses

![Students and Courses](screenshots/student_course_inner_join.png)

### Running Total

![Running Total](screenshots/running_total.png)

---

## 🔍 SQL Work Performed

- CRUD operations on all five tables
- Filtering using `WHERE` and `LIMIT`
- `GROUP BY` and `HAVING`
- Aggregate functions: `COUNT()`, `AVG()`, `MAX()`
- `INNER JOIN` and `LEFT JOIN`
- Subquery for courses with more than 10 students
- `ALTER TABLE` to add Salary
- `EXTRACT()` for enrollment year
- `CONCAT()` for instructor full name
- Window function for running total
- `CASE` expression for Senior/Junior classification

---

## 📊 Calculations



## 📚 Key Learning

Through this project, I learned:

- Relational database and table design
- Primary Key and Foreign Key relationships
- CRUD operations
- Data filtering and aggregation
- INNER JOIN and LEFT JOIN
- Subqueries
- Date and string functions
- Window functions and running totals
- CASE expressions and conditional logic

---

## 📁 Project Structure

```text
University-Course-Management-SQL/
│
├── README.md
├── university_course_management.sql
│
└── screenshots/
    ├── students_table.png
    ├── courses_table.png
    ├── instructors_table.png
    ├── enrollments_table.png
    ├── departments_table.png
    ├── courses_more_than_5.png
    ├── student_course_inner_join.png
    └── running_total.png
```

---

## 🎓 Conclusion

The **University Course Management System** demonstrates practical SQL skills by combining relational database design, CRUD operations, data analysis, joins, aggregation, subqueries, and advanced SQL functions in PostgreSQL.
