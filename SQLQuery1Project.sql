-- Create the University database
CREATE DATABASE University_3;

-- Use the University database
USE University_3;

-- Create tables for different aspects of the university

-- Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Insert data into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'Computer Science'),
    (2, 'MCA'),
    (3, 'BCA'),
    (4, 'BTech');
SELECT * FROM Departments;

-- Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

-- Insert data into the Students table
INSERT INTO Students(StudentID, FirstName, LastName, DateOfBirth, Gender, Address, Email, PhoneNumber)
VALUES
    (1, 'Sujata', 'Dharpure', '2001-08-07', 'Female', 'Wardha', 'sujatadharpure2017@gmail.com', '+919503413915'),
    (2, 'Piyush', 'Dhole', '1996-08-07', 'Male', 'Nagpur', 'piyushddhole@gmail.com', '+917020073580'),
    (3, 'Sanu', 'Dhole', '1999-06-26', 'Female', 'Karanja', 'sdhole1996@gmail.com', '+918805123056');

SELECT * FROM Students;


-- Instructors table
CREATE TABLE Instructor(
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Email VARCHAR(100),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert data into the Instructors table
INSERT INTO Instructor (InstructorID, FirstName, LastName, DepartmentID, Email)
VALUES
    (1, 'Professor', 'Dharpure', 1, 'sujatadharpure2017@gmail.com'),
    (2, 'Professor', 'Dhole', 2, 'piyushddhole@gmail.com'),
    (3, 'Professor', 'Dhole', 3, 'sdhole1996@gmail.com');

SELECT * FROM Instructor;

-- Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseCode VARCHAR(20),
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert data into the Courses table
INSERT INTO Courses (CourseID, CourseCode, CourseName, DepartmentID, Credits)
VALUES
    (101, 'IKT101', 'Introduction to Kotlin', 3, 3),
    (102, 'JV101', 'Java', 2, 4),
    (103, 'IPTN101', 'Introduction to Python', 3, 3);
	SELECT * FROM Courses;

-- Enrollments table to track student enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert data into the Enrollments table
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
    (1, 1, 101, '2023-09-01'),
    (2, 1, 102, '2023-09-02'),
    (3, 2, 101, '2023-09-03'),
    (4, 3, 103, '2023-09-04');

SELECT * FROM Enrollments;

-- Assignments table to track course assignments
CREATE TABLE Assignment (
    AssignmentID INT PRIMARY KEY,
    CourseID INT,
    AssignmentName VARCHAR(100),
    DueDate DATE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert data into the Assignments table
INSERT INTO Assignment (AssignmentID, CourseID, AssignmentName, DueDate)
VALUES
    (1, 101, 'Kotlin Assignment 1', '2023-09-15'),
    (2, 101, 'Kotlin Assignment 2', '2023-10-01'),
    (3, 102, 'Python Quiz 1', '2023-09-20');

SELECT * FROM Assignment;

-- Grades table to record student grades for assignments
CREATE TABLE Grades (
    GradeID INT PRIMARY KEY,
    EnrollmentID INT,
    AssignmentID INT,
    Grade DECIMAL(5, 2)
);

-- Insert data into the Grades table
INSERT INTO Grades (GradeID, EnrollmentID, AssignmentID, Grade)
VALUES
    (1, 1, 1, 90),
    (2, 1, 2, 85),
    (3, 2, 1, 88),
    (4, 2, 2, 92),
    (5, 3, 3, 75);

SELECT * FROM Grades;

-- Drop the tables and the database (clean up)
DROP TABLE Grades;
DROP TABLE Assignment;
DROP TABLE Enrollments;
DROP TABLE Instructor;
DROP TABLE Courses;
DROP TABLE Students;
DROP TABLE Departments;
DROP DATABASE University_3;