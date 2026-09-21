DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Enrollments;

-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Create Instructors Table 
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Credits INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    BirthDate DATE NOT NULL,
    EnrollmentDate DATE NOT NULL
);

-- Create Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert Departments Data
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Data Science');

-- Insert Instructors Data 
INSERT INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2),
(3, 'Charlie', 'Davis', 'charlie.davis@univ.com', 1),
(4, 'Diana', 'Prince', 'diana.prince@univ.com', 2),
(5, 'Edward', 'Norton', 'edward.norton@univ.com', 3);

-- Insert Courses Data
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 1, 4),
(103, 'Linear Algebra', 2, 3),
(104, 'Calculus I', 2, 4),
(105, 'Discrete Mathematics', 2, 3),
(106, 'Probability & Statistics', 2, 3),
(107, 'Differential Equations', 2, 4);

-- Insert Students Data
INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2020-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
(3, 'Michael', 'Brown', 'michael.b@email.com', '2001-03-12', '2023-01-10'),
(4, 'Emily', 'Clark', 'emily.c@email.com', '2002-07-22', '2023-08-15'),
(5, 'David', 'Miller', 'david.m@email.com', '2001-11-05', '2024-01-20'),
(6, 'Sarah', 'Wilson', 'sarah.w@email.com', '2000-09-18', '2022-09-01'),
(7, 'James', 'Taylor', 'james.t@email.com', '2003-02-14', '2023-08-20'),
(8, 'Emma', 'Anderson', 'emma.a@email.com', '2002-12-01', '2023-09-01'),
(9, 'Daniel', 'Thomas', 'daniel.t@email.com', '2001-04-30', '2024-02-01'),
(10, 'Olivia', 'Jackson', 'olivia.j@email.com', '2002-06-19', '2023-08-15'),
(11, 'Sophia', 'Martin', 'sophia.m@email.com', '2003-05-11', '2024-01-10'),
(12, 'Lucas', 'White', 'lucas.w@email.com', '2002-11-20', '2024-03-01');

-- Insert Enrollments Data
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 101, '2022-08-05'),
(3, 3, 101, '2023-01-15'),
(4, 4, 101, '2023-08-20'),
(5, 5, 101, '2024-01-25'),
(6, 6, 101, '2022-09-10'),
(7, 7, 101, '2023-08-25'),
(8, 8, 101, '2023-09-05'),
(9, 9, 101, '2024-02-05'),
(10, 10, 101, '2023-08-15'),
(11, 11, 101, '2024-01-10'),
(12, 1, 102, '2022-08-15'),
(13, 2, 102, '2021-08-01'),
(14, 3, 103, '2023-01-18');


-- Query 1: CRUD Operations on all 5 tables

-- 1.1 CRUD Operation on Departments
INSERT INTO Departments (DepartmentID, DepartmentName) 
VALUES (5, 'Information Technology');

SELECT * FROM Departments; 

UPDATE Departments 
SET DepartmentName = 'Computer Engineering' 
WHERE DepartmentID = 5;

DELETE FROM Departments WHERE DepartmentID = 5;
-- 1.2 CRUD Operation on Instructors
INSERT INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID) 
VALUES (6, 'Hanee', 'Patel', 'hanee.patel@univ.com', 1);

SELECT * FROM Instructors;

UPDATE Instructors 
SET Email = 'hanee.official@univ.com' 
WHERE InstructorID = 6;

DELETE FROM Instructors WHERE InstructorID = 6;

-- 1.3 CRUD Operation on Courses
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) 
VALUES (108, 'Artificial Intelligence', 1, 4);

SELECT * FROM Courses; 

UPDATE Courses 
SET Credits = 3 
WHERE CourseID = 108;

DELETE FROM Courses WHERE CourseID = 108;

-- 1.4 CRUD Operation on Students
INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) 
VALUES (13, 'Aarav', 'Sharma', 'aarav.sharma@email.com', '2002-04-18', '2024-08-01');

SELECT * FROM Students; 

UPDATE Students 
SET Email = 'aarav.s2024@email.com' 
WHERE StudentID = 13;

DELETE FROM Students WHERE StudentID = 13;

-- 1.5 CRUD Operation on Enrollments
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) 
VALUES (15, 4, 102, '2024-08-05');

SELECT * FROM Enrollments; 

UPDATE Enrollments 
SET EnrollmentDate = '2024-08-10' 
WHERE EnrollmentID = 15;

DELETE FROM Enrollments WHERE EnrollmentID = 15;

-- Query 2: Students enrolled after 2022
SELECT * 
FROM Students 
WHERE EnrollmentDate > '2022-12-31';

-- Query 3: Mathematics courses with limit of 5
SELECT c.CourseID, c.CourseName, c.Credits
FROM Courses c
JOIN Departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;

-- Query 4: Courses with more than 5 students enrolled
SELECT CourseID, COUNT(StudentID) AS StudentCount
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(StudentID) > 5;

-- Query 5: Students enrolled in both Introduction to SQL and Data Structures
SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;

-- Query 6: Students enrolled in either Introduction to SQL or Data Structures
SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');

-- Query 7: Average number of credits across all courses
SELECT ROUND(AVG(Credits), 2) AS AverageCredits 
FROM Courses;


-- Query 8: Add Salary column, update salary for 5 instructors, and find maximum salary in Computer Science department
ALTER TABLE Instructors ADD COLUMN Salary NUMERIC(10, 2);

UPDATE Instructors SET Salary = 75000.00 WHERE InstructorID = 1;
UPDATE Instructors SET Salary = 68000.00 WHERE InstructorID = 2;
UPDATE Instructors SET Salary = 82000.00 WHERE InstructorID = 3;
UPDATE Instructors SET Salary = 71000.00 WHERE InstructorID = 4;
UPDATE Instructors SET Salary = 65000.00 WHERE InstructorID = 5;

SELECT MAX(i.Salary) AS MaxSalary_CS
FROM Instructors i
JOIN Departments d ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';


-- Query 9: Count of students enrolled per department
SELECT d.DepartmentName, COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
JOIN Courses c ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName;

-- Query 10: INNER JOIN students and their corresponding courses
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

-- Query 11: LEFT JOIN all students and their courses
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;

-- Query 12: Students in courses with more than 10 students
SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID IN (
    SELECT CourseID
    FROM Enrollments
    GROUP BY CourseID
    HAVING COUNT(StudentID) > 10
);

-- Query 13: Extract year from EnrollmentDate
SELECT StudentID, FirstName, LastName, EXTRACT(YEAR FROM EnrollmentDate) AS EnrollmentYear
FROM Students;

-- Query 14: Concatenate instructor first and last name
SELECT InstructorID, CONCAT(FirstName, ' ', LastName) AS FullName, Email, Salary
FROM Instructors;

-- Query 15: Running total of enrolled students
SELECT EnrollmentID, CourseID, StudentID, EnrollmentDate,
       COUNT(StudentID) OVER (ORDER BY EnrollmentDate, EnrollmentID) AS RunningTotal
FROM Enrollments;

-- Query 16: Classify students as Senior or Junior based on 4-year enrollment
SELECT StudentID, FirstName, LastName, EnrollmentDate,
       CASE 
           WHEN EnrollmentDate <= CURRENT_DATE - INTERVAL '4 years' THEN 'Senior'
           ELSE 'Junior'
       END AS StudentCategory
FROM Students;
SELECT * from departments;
SELECT * from students;
SELECT * from courses;
SELECT * from instructors;
SELECT * from enrollments;