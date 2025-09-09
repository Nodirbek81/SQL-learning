1
select p.productname, s.suppliername
from products p
cross join Suppliers s

2
select d.departmentname, e.name
from Departments d
cross join Employees e

3
select p.productname, s.suppliername
from Products p
join Suppliers s on p.ProductID = s.SupplierID

4
select  c.firstname + '' + c.lastname as customername, o.orderid
from orders o
join Customers1 c on o.CustomerID = c.CustomerID

5
select s.name as studentname, c.coursename
from students s
cross join courses c

6
select p.productname, o.orderid
from Products p
join orders o on p.ProductID = o.ProductID

7
select e.name as employeename, d.departmentname
from Employees e
join Departments d on e.employeeid = d.DepartmentID

8
select s.name as studentname, e.CourseID
from Enrollments e
join Students s on e.StudentID = s.StudentID

9
select o.orderid, p.amount
from orders o
join payments p on o.OrderID = p.OrderID

10
select o.orderid, p.productname, p.price 
from orders o
join Products p on o.ProductID = p.ProductID
where p.price > 100

11
select e.name as employeename, d.departmentname 
from Employees e
join Departments d on e.departmentid != d.DepartmentID

12
select o.orderid, o.productid, o.quantity as orderquantity, p.stockquantity
from orders o
join Products p on o.ProductID = p.ProductID
where o.quantity > p.stockquantity

13
select c.firstname +'' + c.lastname as customername, s.productid 
from customers c
join sales s on c.CustomerID = s.CustomerID
where s.saleamount >= 500


14
select s.name as studentname, c.coursename
from Enrollments e
join Students s on e.StudentID = s.StudentID
join Courses c on e.CourseID = c.CourseID

15
select p.productname as product, s.suppliername
from Products p
join Suppliers s on p.SupplierID = s.SupplierID
where s.SupplierName like '%Tech%'

16
select o.OrderID, o.totalamount, p.amount as paymentamount 
from orders o
join Payments p on o.OrderID = p.OrderID
where p.amount < o.TotalAmount

17
select e.name as employeename, d.departmentname
from Employees e
join Departments d on e.departmentid = d.DepartmentID

18
select p.productname, c.categoryname
from Products1 p
join Categories c on p.ProductID = c.CategoryID
where c.CategoryName in ('Electronics', 'Furniture')

19
select c.firstname +''+lastname as customers, c.country, s.saleid
from Customers c
join Sales s on c.CustomerID = s.CustomerID
where c.country like ('USA')

20
select o.orderid, o.totalamount as ordertotal, c.firstname +''+lastname as customers, c.country
from Orders o
join Customers1 c on o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany' and o.totalamount > 100

21
SELECT e1.Name AS Employee1, e2.Name AS Employee2,
       e1.DepartmentID AS Dept1, e2.DepartmentID AS Dept2
FROM Employees e1
JOIN Employees e2 
     ON e1.EmployeeID < e2.EmployeeID 
    AND e1.DepartmentID <> e2.DepartmentID;

22
SELECT p.PaymentID, p.OrderID, p.Amount AS PaidAmount, 
       o.Quantity, pr.Price, (o.Quantity * pr.Price) AS ExpectedAmount
FROM Payments p
JOIN Orders o ON p.OrderID = o.OrderID
JOIN Products pr ON o.ProductID = pr.ProductID
WHERE p.Amount <> (o.Quantity * pr.Price);

23
SELECT s.StudentID, s.Name
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.EnrollmentID IS NULL;

24
SELECT m.EmployeeID AS ManagerID, m.Name AS ManagerName, m.Salary AS ManagerSalary,
       e.EmployeeID AS EmployeeID, e.Name AS EmployeeName, e.Salary AS EmployeeSalary
FROM Employees e
JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE m.Salary <= e.Salary;

25
SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.OrderID IS NULL;
