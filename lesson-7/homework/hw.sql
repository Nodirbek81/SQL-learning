select min (price) as min_price
from products

select max (salary) as max_salary
from employees

SELECT COUNT(*) AS total_customers
FROM Customers;

SELECT COUNT(DISTINCT Category) AS unique_categories
FROM Products;

select sum(price * stockquantity) as total_sales_amount
from products
where productid = 7

select AVG (age) as aversge_age
from employees

SELECT Departmentname, COUNT(*) AS total_employees
FROM Employees
GROUP BY Departmentname;

select category,
max(price) as max_price,
min(price) as min_price
from products
group by category;


SELECT CustomerID,
       SUM(productid * saleamount) AS total_sales
FROM Sales
GROUP BY CustomerID;


SELECT departmentname,
       COUNT(*) AS total_employees
FROM Employees
GROUP BY departmentname
HAVING COUNT(*) > 5;

select customerid,
sum(productid*saleamount) as total_sales,
avg(productid*saleamount) as average_sales
from sales 
group by customerid;


select count(*) as total_employees
from employees
where departmentname = 'HR';


select departmentname,
max(salary) as max_salary,
min(salary) as min_salary
from employees
group by departmentname;


select departmentname,
avg(Salary) as average_salary
from Employees
group by departmentname;

select departmentname,
avg(salary) as average_salary,
count(*) as employee_total
from employees
group by departmentname;


select category,
avg(price) as average_price
from products
group by category
having avg(price) > 400;

SELECT YEAR(SaleDate) AS sale_year,
       SUM(SaleAmount) AS total_sales
FROM Sales
GROUP BY YEAR(SaleDate)
ORDER BY sale_year;


SELECT CustomerID,
      COUNT(productid) AS total_orders
FROM sales
GROUP BY CustomerID
HAVING COUNT(productid) >= 3;

select departmentname,
avg(salary) as average_salary
from employees
group by departmentname
having AVG(salary) > 60000;

SELECT Category,
       AVG(Price) AS Average_Price
FROM Products
GROUP BY Category
HAVING AVG(Price) > 150;

SELECT Customers.CustomerID,
       Customers.FirstName,
       Customers.LastName,
       SUM(Orders.TotalAmount) AS TotalSales
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
HAVING SUM(Orders.TotalAmount) > 1500;

SELECT DepartmentName,
       SUM(Salary) AS TotalSalary,
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 65000;

SELECT Orders.CustomerID,
       SUM(Orders.TotalAmount) AS TotalAmountOver50,
       MIN(Orders.TotalAmount) AS LeastPurchase
FROM Orders
WHERE Orders.TotalAmount > 50
GROUP BY Orders.CustomerID;

SELECT YEAR(OrderDate) AS Order_Year,
       MONTH(OrderDate) AS Order_Month,
       SUM(TotalAmount) AS Total_Sales,
       COUNT(DISTINCT ProductID) AS UniqueProducts
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING COUNT(DISTINCT ProductID) >= 2;

SELECT YEAR(OrderDate) AS Order_Year,
       MIN(Quantity) AS Min_Quantity,
       MAX(Quantity) AS Max_Quantity
FROM Orders
GROUP BY YEAR(OrderDate);
