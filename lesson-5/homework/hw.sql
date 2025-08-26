EXEC sp_rename 'Products3.ProductName', 'Name', 'COLUMN';

SELECT ProductName FROM Products3
UNION
SELECT ProductName FROM Products_Discounted1;

SELECT ProductName FROM Products3
INTERSECT
SELECT ProductName FROM Products_Discounted1;

select distinct FirstName, LastName, Country
from Customers2;

select Price,
case when Price > 1000 then 'HIGH'
else 'LOW' end FROM Products3

select  StockQuantity,
iif (StockQuantity > 100, 'Yes', 'No') 
FROM Products3

SELECT ProductName FROM Products3
UNION
SELECT ProductName FROM Products_Discounted1;


SELECT ProductName FROM Products3
EXCEPT
SELECT ProductName FROM Products_Discounted1;

select  Price,
iif (Price > 100, 'Expensive', 'Affordable') 
FROM Products3

SELECT FirstName, LastName, Age, Salary
FROM Employees4
WHERE Age < 25 OR Salary > 60000;

UPDATE Employees4
SET Salary = Salary * 1.10
WHERE DepartmentName = 'HR' OR EmployeeID = 5;

select *from Employees4
select *from Sales1
SELECT CustomerID, SaleAmount,
      iif (SaleAmount > 500, 'Top Tier', IIF (SaleAmount between 200 and 500, 'Mid Tier', 'Low Tier'))
FROM Sales1

SELECT CustomerID FROM Orders2
EXCEPT
SELECT CustomerID FROM Sales1;


SELECT CustomerID, Quantity,
IIF(Quantity = 1, '3%', IIF(Quantity BETWEEN 2 AND 3, '5%', '7%')) 
FROM Orders2;
