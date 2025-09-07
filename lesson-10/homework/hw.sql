1
select Employees.EmployeeID, Employees.salary, Departments.Departmentname
from Employees
join Departments on Employees.Departmentid = Departments.Departmentid
where Employees.salary > 50000
order by Employees.salary desc

2
select Customers.FirstName, Customers.lastName, Orders.OrderDate
from Customers
join Orders on Customers.customerid = Orders.customerid
WHERE Orders.OrderDate BETWEEN '2023-01-01' AND '2023-12-31'

3
select Employees.name, departments.DepartmentName
from Employees
left join departments on Employees.Departmentid = Departments.Departmentid

4
select Suppliers.SupplierName, Products.ProductName
from Suppliers
left join Products on Suppliers.Supplierid = Products.Supplierid 

5
select orders.OrderID, Orders.OrderDate, Payments.PaymentDate, Payments.Amount
from Orders
full outer join Payments on Orders.OrderID = Payments.orderid

6
select e.name as employeename,
m.name as managername
from employees e
left join Employees m on e.managerid = m.employeeid

7
select students.name as studentname, courses.CourseName
from students
join Enrollments on Enrollments.studentid = students.studentid
join courses on courses.courseid = Enrollments.courseid 
WHERE courses.CourseName = 'Math 101'

8
select Customers.FirstName,Customers.lastName, Orders.Quantity
from Customers
join Orders on Customers.customerid = orders.CustomerID
where Orders.Quantity > 3

9
select Employees.name as Employeename, Departments.DepartmentName
from Employees
join Departments on Employees.departmentid = Departments.DepartmentID
where Departments.DepartmentName = 'Human Resources'

10
select Departments.DepartmentName, count(Employees.employeeid) as Employeename 
from Employees
join Departments on Employees.departmentid = Departments.DepartmentID
group by Departments.DepartmentName
having count(Employees.employeeid) > 5

11
select Products.ProductID, Products.ProductName
from Products
left join Sales on Products.ProductID = sales.ProductID
where sales.SaleID is null

12
select c.firstname, c.lastname, count(o.quantity) as TotalOrders
from Customers c
join Orders o on c.CustomerID = o.CustomerID
group by c.FirstName, c.LastName
having count(o.quantity) >= 1

13
select e.name as EmployeeName, d.departmentname
from Employees e
inner join Departments d on e.departmentid = d.DepartmentID

14
select e1.name as employee1,
e2.name as employee2,
e1.managerid
from Employees e1
join Employees e2 on e1.managerid = e2.managerid and e1.employeeid < e2.employeeid
where e1.managerid is not null;

15
select o.OrderID, o.orderdate, c.firstname, c.lastname
from orders o
join Customers1 c on o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 2022;

16
select e.name as employeename, e.salary, d.departmentname
from Employees e
join Departments d on e.departmentid = d.DepartmentID
where d.DepartmentName = 'sales' and e.salary > 6000

17
select o.orderid, o.orderdate, p.paymentid, p.amount
from orders o
inner join Payments p on o.OrderID = p.orderid

18
select p.ProductID, p.ProductName
from Products p
left join Orders o on p.ProductID = o.ProductID
where o.ProductID is null

19
select e.name as employeename, e.salary 
from Employees e
where e.salary > (select avg(salary) as avgsalary 
from employees);

20
select o.OrderID, o.OrderDate
from orders o
left join Payments p on o.OrderID = p.orderid
where o.orderdate < '2020.01.01' and p.paymentid is null;

21
SELECT p.ProductID,
       p.ProductName
FROM Products p
LEFT JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryID IS NULL;

22
SELECT e1.Name AS Employee1,
       e2.Name AS Employee2,
       e1.ManagerID,
       e1.Salary
FROM Employees e1
JOIN Employees e2 
     ON e1.ManagerID = e2.ManagerID
    AND e1.EmployeeID < e2.EmployeeID
WHERE e1.ManagerID IS NOT NULL
  AND e1.Salary > 60000
  AND e2.Salary > 60000;

  23
  SELECT e.Name AS EmployeeName,
       d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName LIKE 'M%';

24
SELECT s.SaleID,
       p.ProductName,
       s.Amount AS SaleAmount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE s.Amount > 500;

25
SELECT s.StudentID,
       s.Name AS StudentName
FROM Students s
WHERE s.StudentID NOT IN (
    SELECT e.StudentID
    FROM Enrollments e
    JOIN Courses c ON e.CourseID = c.CourseID
    WHERE c.CourseName = 'Math 101'
);

26
SELECT o.OrderID,
       o.OrderDate,
       p.PaymentID
FROM Orders o
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;

27
SELECT p.ProductID,
       p.ProductName,
       c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');
