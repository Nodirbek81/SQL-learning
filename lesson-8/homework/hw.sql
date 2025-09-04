SELECT category, 
count(*) as total_products
from Products
group by category;


SELECT avg(price) as average_price
FROM Products
WHERE category = 'Electronics';

 SELECT *
FROM Customers1
WHERE city LIKE 'L%';

select * from products
where ProductName like ('%er');

select * from Customers1
where UPPER(country) like '%A';

select max(price) as max_price
from products;  

select ProductName,
case when stockquantity < 30 then 'Low Stock'
else 'Sufficient' end as stockquantity_category
from products;

select country,
count(customerid) as total_customers
from Customers1
group by country;

select min(quantity) as min_quantity,
max(quantity) as max_quantity
from orders;

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

SELECT DISTINCT o.CustomerID
FROM Orders o
WHERE o.OrderDate BETWEEN '2023-01-01' AND '2023-01-31'
  AND o.CustomerID NOT IN (
      SELECT DISTINCT CustomerID
      FROM Invoices
      WHERE InvoiceDate BETWEEN '2023-01-01' AND '2023-01-31'
  );

  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;

SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;      12


select year(OrderDate) as Order_Year,
avg(TotalAmount) as Avg_Amount
from Orders
group by year(OrderDate);     13

select productname,
case when price < 100 then 'low'
when price between 100 and 500 then 'mid'
else 'high' end as price_group
 from products;                            

 SELECT District_Name,
       SUM(CASE WHEN Year = 2012 THEN Population ELSE 0 END) AS [2012],
       SUM(CASE WHEN Year = 2013 THEN Population ELSE 0 END) AS [2013]
INTO Population_Each_Year1
FROM City_Population
GROUP BY District_Name;                

select * from Population_Each_Year1

select ProductID,
sum(SaleAmount) as Total_Sales
from Sales
group by ProductID;                           16

SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';                 17


SELECT Year,
       SUM(CASE WHEN District_Name = 'Bektemir' THEN Population ELSE 0 END) AS Bektemir,
       SUM(CASE WHEN District_Name = 'Chilonzor' THEN Population ELSE 0 END) AS Chilonzor,
       SUM(CASE WHEN District_Name = 'Yakkasaroy' THEN Population ELSE 0 END) AS Yakkasaroy
INTO Population_Each_City
FROM City_Population                               18
GROUP BY Year;

select * from Population_Each_City


select top 3 employeeid, salary
from employees
order by salary desc;

select * from employees                  19

SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(o.OrderID) > 5;

SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM Employees1 e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;


select District_Name, year, Population
FROM Population_Each_Year
unpivot
(
    population for year in ([2012], [2013])
) as population_return;

SELECT Products.ProductName, COUNT(Sales.SaleID) AS TimesSold
FROM Products
LEFT JOIN Sales ON Products.ProductID = Sales.ProductID
GROUP BY Products.ProductName;

select year, District_Name, Population
from Population_Each_City
unpivot
(
Population for District_Name in ([Bektemir], [Chilonzor], [Yakkasaroy])
) as rotate;
