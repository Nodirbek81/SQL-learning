1.
with Numbers as (select 1 as num 
union all 
select num + 1
from Numbers
where num < 1000)
select num from Numbers
OPTION (MAXRECURSION 1000);

2.
select e.firstname + '' + lastname as employeename, s.totalsale
from Employees e
join (select employeeID, sum(salesamount) as totalsale
from sales 
group by employeeID) s on e.EmployeeID = s.EmployeeID;

3.
with averagesalary as (
select firstname + '' + lastname as employeename, avg(salary) as avgsalary
from Employees 
group by FirstName, LastName)
select employeename, avgsalary
from averagesalary;

4.
select p.productname, s.maxsalesamount
from Products p
join (
select productID, max(salesamount) as maxsalesamount from sales
group by productid) s on p.productID = s.productID;

5.
with Numbers as (select 1 as num 
union all 
select num * 2
from Numbers
where num *2 < 1000000)
select num from Numbers
OPTION (MAXRECURSION 10000);

6.
with hihgsales as (
select EmployeeID, count(*) as allamount
from sales 
group by EmployeeID)
select e.firstname + '' + lastname as employeename, s.allamount
from Employees e 
join hihgsales s on e.EmployeeID = s.EmployeeID
where allamount > 5;

7.
with ProductSales as (
select productid, sum(salesamount) as Totalsales
from sales 
group by ProductID)
SELECT p.ProductName, ps.TotalSales
FROM Products p
JOIN ProductSales ps ON p.ProductID = ps.ProductID
WHERE ps.TotalSales > 500;

8.
with Highsalary as (
select avg(salary) as avgsalary 
from employees)
select e.firstname, e.lastname, e.salary
from employees e 
cross join Highsalary h
where e.salary > h.avgsalary;

9.
select top 5 e.firstname, e.lastname, s.ordertotal
from Employees e 
join (select Employeeid, count(*) as ordertotal
from sales 
group by EmployeeID) s on e.EmployeeID = s.EmployeeID
order by s.ordertotal desc;


10.
SELECT c.CategoryID, SUM(s.SalesAmount) AS TotalSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
JOIN (
    SELECT DISTINCT CategoryID
    FROM Products
) c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID;

11.
WITH Factorial AS (
    SELECT Number, CAST(Number AS BIGINT) AS Fact, 1 AS Step
    FROM Numbers1
    UNION ALL
    SELECT f.Number, f.Fact * (f.Step + 1), f.Step + 1
    FROM Factorial f
    WHERE f.Step + 1 <= f.Number
)
SELECT Number, MAX(Fact) AS Factorial
FROM Factorial
GROUP BY Number;

12.
WITH SplitCTE AS (
    SELECT Id, 1 AS pos, SUBSTRING([String],1,1) AS Ch, LEN([String]) AS L
    FROM Example
    UNION ALL
    SELECT Id, pos+1, SUBSTRING([String],pos+1,1), L
    FROM SplitCTE
    WHERE pos < L
)
SELECT Id, Ch
FROM SplitCTE
ORDER BY Id, pos
OPTION (MAXRECURSION 0);
 select * from example

 13.
 WITH MonthlySales as (
    select
        YEAR(SaleDate) AS Yeardate,
        MONTH(SaleDate) AS Monthdate,
        SUM(SalesAmount) AS TotalSales
    from Sales
    group by YEAR(SaleDate), MONTH(SaleDate)
),
Diff as (
    select Yeardate, Monthdate, TotalSales,
           lag(TotalSales) OVER (ORDER BY Yeardate, Monthdate) AS PrevSales
    from MonthlySales
)
select Yeardate, Monthdate, TotalSales, 
       (TotalSales - PrevSales) as DiffSales
from Diff;

14.
WITH QuarterlySales AS (
    SELECT 
        EmployeeID,
        DATEPART(QUARTER, SaleDate) AS Q,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
)
SELECT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
JOIN (
    SELECT EmployeeID
    FROM QuarterlySales
    GROUP BY EmployeeID
    HAVING MIN(TotalSales) > 45000
) q ON e.EmployeeID = q.EmployeeID;

15.
WITH Fibonacci AS (
    SELECT 1 AS n, 0 AS f, 1 AS nextf
    UNION ALL
    SELECT n + 1, nextf, f + nextf
    FROM Fibonacci
    WHERE n < 30  
)
SELECT n, f
FROM Fibonacci;

16.
SELECT *
FROM FindSameCharacters
WHERE Vals IS NOT NULL
  AND LEN(Vals) > 1
  AND LEN(REPLACE(Vals, LEFT(Vals,1), '')) = 0;

  17.
  DECLARE @n INT = 5;

WITH Numbers AS (
    SELECT 1 AS n, CAST('1' AS VARCHAR(50)) AS seq
    UNION ALL
    SELECT n+1, seq + CAST(n+1 AS VARCHAR(10))
    FROM Numbers
    WHERE n < @n
)
SELECT seq
FROM Numbers;

18.
WITH Last6Months AS (
    SELECT *
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
),
EmployeeSales AS (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Last6Months
    GROUP BY EmployeeID
)
SELECT TOP 1 e.EmployeeID, e.FirstName, e.LastName, es.TotalSales
FROM Employees e
JOIN EmployeeSales es ON e.EmployeeID = es.EmployeeID
ORDER BY es.TotalSales DESC;

19.
WITH Cleaned AS (
    SELECT 
        PawanName,
        Pawan_slug_name,
        LEFT(Pawan_slug_name, CHARINDEX('-', Pawan_slug_name)) 
        + STUFF(
            RIGHT(Pawan_slug_name, LEN(Pawan_slug_name) - CHARINDEX('-', Pawan_slug_name)),
            2,  -- начиная со 2 символа
            LEN(Pawan_slug_name), 
            ''  -- удаляем повторяющиеся цифры
        ) AS CleanName
    FROM RemoveDuplicateIntsFromNames
)
SELECT * FROM Cleaned;
