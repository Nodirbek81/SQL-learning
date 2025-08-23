select top 5* from employees; 

SELECT DISTINCT Category FROM Products;

select * from products where price > 100;

select * from Customers WHERE FirstName >= 'A' AND FirstName < 'B';

SELECT * FROM Products ORDER BY Price ASC;

SELECT * FROM Employees WHERE Salary >= 60000   AND DepartmentName = 'HR';

SELECT EmployeeID, ISNULL(Email, 'dfsdgd@mail.ru') AS Email FROM Employees;

SELECT * FROM Products WHERE Price >= 50 AND Price <= 100;

SELECT DISTINCT Category, ProductName FROM Products;

SELECT DISTINCT Category, ProductName FROM Products ORDER BY ProductName DESC;

SELECT COUNT(*)  FROM Employees;

SELECT AVG(Salary) AS AvgSalary FROM Employees;

SELECT DepartmentName, SUM(Salary) AS TotalSalary FROM Employees GROUP BY DepartmentName;

SELECT DepartmentName, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentName
HAVING SUM(Salary) > 200000;

SELECT * FROM Employees WHERE Salary = (SELECT MAX(Salary) FROM Employees);

SELECT Category, COUNT(*) AS ProductCount
FROM Products
GROUP BY Category;

SELECT Category, AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category;


SELECT DISTINCT Customers.*
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT *
FROM Employees
WHERE HireDate > '2020-01-01';

SELECT *
FROM Employees
WHERE Email IS NULL;

SELECT TOP 1 DepartmentName, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName
ORDER BY AvgSalary DESC;

SELECT MAX(Salary) AS SecondHighestSalary
FROM Employees
WHERE Salary < (SELECT MAX(Salary) FROM Employees);

SELECT TOP 3 *
FROM Employees
ORDER BY Salary DESC;

SELECT *
FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders)

SELECT Customers.CustomerID, Customers.FirstName,
       COUNT(Orders.OrderID) AS TotalOrders,
       SUM(Orders.TotalAmount) AS TotalAmount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName;

SELECT *
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);

SELECT *
FROM Products
WHERE ProductID NOT IN (SELECT DISTINCT ProductID FROM OrderDetails);

SELECT Customers.CustomerID, Customers.FirstName,
       SUM(Orders.TotalAmount) AS TotalSpent
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName
HAVING SUM(Orders.TotalAmount) > 5000;


SELECT DepartmentName, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 5;

SELECT *
FROM Employees
ORDER BY Salary DESC, FirstName ASC;
