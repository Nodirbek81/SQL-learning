CREATE DATABASE SchoolDB;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
select *from Students;

INSERT INTO Students (StudentID, Name, Age)
VALUES
(1, 'Roy', 98),
(2, 'Nick', 56),
(3, 'Dave', 24);
