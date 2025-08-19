CREATE TABLE Employees1 (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees1 (EmpID, Name, Salary)
VALUES (1, 'Ali', 5000.00);

INSERT INTO Employees1
VALUES (2, 'Bobur', 6000.00);

INSERT INTO Employees1 (EmpID, Name, Salary)
VALUES
    (3, 'Charos', 5500.00),
    (4, 'Donyor', 6500.00);

UPDATE Employees1
SET Salary = 7000
WHERE EmpID = 1;

DELETE FROM Employees1
WHERE EmpID = 2;

5. Give a brief definition for difference between DELETE, TRUNCATE, and DROP
DELETE jadvalni yo'q qilmagan holda unga yozilgan ma'lumotlarni uchirish uchun ishlatiladi;
TRUNCATE jadvalni ustunlarini saqlagan holda barcha ma'lumotlarni uchiradi;
DROP jadvalni butunlay uchiradi.

ALTER TABLE Employees1
ALTER COLUMN Name VARCHAR(100);

ALTER TABLE Employees1
ADD Department VARCHAR(50);

ALTER TABLE Employees1
ALTER COLUMN Salary FLOAT;

CREATE TABLE Departments1 (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

TRUNCATE TABLE Employees1;

SELECT *from Employees1

SELECT *from Departments1

INSERT INTO Departments1 (DepartmentID, DepartmentName)
SELECT 1, 'HR' UNION ALL
SELECT 2, 'Finance' UNION ALL
SELECT 3, 'IT' UNION ALL
SELECT 4, 'Marketing' UNION ALL
SELECT 5, 'Sales';

UPDATE Employees1
SET Department = 'Management'
WHERE Salary > 5000;

13. Write a query that removes all employees but keeps the table structure intact.
bu holatlarda TRUNCATE yoki DELETE buyruqlaridan foydalaniladi.

TRUNCATE TABLE Employees;

ALTER TABLE Employees
DROP COLUMN Department;

DROP TABLE Departments;

DROP TABLE Products;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2) CHECK (Price > 0), 
    Description VARCHAR(255)                
);

ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';



INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES
    (1, 'Laptop', 'Electronics', 1200.00, '15-inch display'),
    (2, 'Smartphone', 'Electronics', 800.00, 'Latest model'),
    (3, 'Desk Chair', 'Furniture', 150.00, 'Ergonomic chair'),
    (4, 'Notebook', 'Stationery', 3.50, 'A4 size, 100 pages'),
    (5, 'Backpack', 'Accessories', 45.00, 'Waterproof material');

drop table Products_Backup;

SELECT *
INTO Products_Backup
FROM Products;


EXEC sp_rename 'Products', 'Inventory';


ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000,5);

select *from Inventory 
select *from Products 
