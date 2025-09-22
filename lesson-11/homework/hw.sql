1.
select o.OrderID,c.FirstName + ' ' + LastName AS CustomerName, o.OrderDate
from orders o
join customers c on o.customerid = c.customerid
where year(OrderDate) > 2022
order by orderdate asc;

2.
select e.name as employeeName, d.departmentName
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName in ('Sales', 'Marketing');

3.
select d.departmentName, max(e.salary) as maxsalary
from Departments d
join Employees e on d.DepartmentID = e.DepartmentID
group by d.DepartmentName; 

4.
select c.FirstName + ' ' + c.LastName AS CustomerName, o.OrderId, o.OrderDate
from Customers c
inner join Orders o on c.CustomerID = o.CustomerID
where c.country = 'USA' and year(o.orderdate) = 2023;  

5.
select concat(c.FirstName, ' ' , c.LastName) as CustomerName,
count(o.orderid) as TotalOrders
from Customers1 c
left join Orders o on c.customerid = o.customerid
group by c.FirstName, c.LastName;

6.
select p.ProductName, s.SupplierName
from Products p
join Suppliers s on p.supplierid = s.SupplierID
where s.SupplierName in ('Gadget Supplies', 'Clothing Mart');

7.
select CONCAT (c.firstname, '' ,c.lastname) as Customername, 
		max(o.orderdate) as MostRecentOrderDate
		from Customers c
left join Orders o on c.CustomerID = o.CustomerID
group by c.FirstName, c.LastName;

8.
select CONCAT(c.firstname, ' ' ,c.lastname) as CustomerName, o.totalamount as ordertotal
from customers c
left join Orders o on c.CustomerID = o.CustomerID
where o.totalamount > 500;

9.
select p.productname, s.saledate, s.saleamount
from Sales s 
join Products p on s.ProductID = p.ProductID
where year(s.SaleDate) = 2022 or s.SaleAmount > 400;

10.
select p.ProductName, SUM(S.SaleAmount) AS TotalSalesAmount
from Sales s
JOIN Products p ON s.ProductID = p.ProductID
group by p.ProductName;

11.
select e.Name as EmployeeName, d.DepartmentName, e.Salary
FROM employees e
join departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'HR' and e.Salary > 60000;

12.
select p.ProductName, s.SaleDate, p.StockQuantity
from Sales s
JOIN Products p on s.ProductID = p.ProductID
where YEAR(S.SaleDate) = 2023 and P.StockQuantity > 100;

13.
select e.Name as EmployeeName, d.DepartmentName, e.HireDate
FROM Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Sales' or year(e.HireDate) > 2020;

14.
select concat(c.FirstName, ' ', c.LastName) as CustomerName, o.OrderID, c.Address, o.OrderDate
from Customers c
join Orders o on c.CustomerID = o.CustomerID
WHERE c.Country = 'USA' and c.Address LIKE '[0-9][0-9][0-9][0-9]%';


15.
select p.ProductName, p.Category, s.SaleAmount
from Sales s
join Products p on s.ProductID = p.ProductID
where p.ProductName = 'Electronics' or s.SaleAmount > 350;

16.
select c.CategoryName, count(p.ProductID) as ProductCount
FROM Categories c
left join Products p on c.CategoryID = p.Category
group by c.CategoryName;

17.
select concat(c.FirstName, ' ', c.LastName) as CustomerName, c.City, o.OrderID, o.TotalAmount as Amount
from Customers c
join Orders o on c.CustomerID = o.CustomerID
where c.City = 'Los Angeles' and o.TotalAmount > 300;

18.
select e.Name as EmployeeName, d.DepartmentName
from Employees e
join Departments d ON e.DepartmentID = d.DepartmentID
where d.DepartmentName in ('HR', 'Finance') or (
       (CASE WHEN E.Name LIKE '%a%' THEN 1 ELSE 0 END) +
       (CASE WHEN E.Name LIKE '%e%' THEN 1 ELSE 0 END) +
       (CASE WHEN E.Name LIKE '%i%' THEN 1 ELSE 0 END) +
       (CASE WHEN E.Name LIKE '%o%' THEN 1 ELSE 0 END) +
       (CASE WHEN E.Name LIKE '%u%' THEN 1 ELSE 0 END)
   ) >= 4;
   бу мисолни ҳеч чиқмовди кўчирдим, аммо мантиғини тушундим 

   19.
select e.Name as EmployeeName, d.DepartmentName, e.Salary
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName in ('Sales', 'Marketing') and e.Salary > 60000;
