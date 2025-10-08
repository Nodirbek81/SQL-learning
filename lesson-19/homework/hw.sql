1.
CREATE PROCEDURE GetEmployeeBonus
as
begin
create table #EmployeeBonus (
        EmployeeID INT,
        FullName NVARCHAR(50),
        Department NVARCHAR(30),
        Salary DECIMAL(10,2),
        BonusAmount DECIMAL(10,2));
insert into #EmployeeBonus (EmployeeID, FullName, Department, Salary, BonusAmount)
select e.EmployeeID, e.FirstName + ' ' + e.LastName AS FullName, e.Department, e.Salary,
e.Salary * db.BonusPercentage / 100 AS BonusAmount
from Employees e
 join DepartmentBonus db on e.Department = db.Department;

2.
CREATE PROCEDURE UpdateDepartmentSalary
    @Department nvarchar(100),
    @IncreasePercent decimal(5,2)
as
begin
SET NOCOUNT ON;
UPDATE Employees
set Salary = Salary * (1 + @IncreasePercent / 100)
where Department = @Department;
select * from Employees
where Department = @Department;
end;



3.
MERGE into Products_Current as target
using Products_New as source
on target.ProductID = source.ProductID
when MATCHED then
update set target.ProductName = source.ProductName, target.Price = source.Price
when not MATCHED BY TARGET then insert (ProductID, ProductName, Price)
    values (source.ProductID, source.ProductName, source.Price)
when NOT MATCHED by SOURCE then delete;


4.
select t.id,
    case
        when t.p_id is null then 'Root'
        when t.id not in (select DISTINCT p_id from Tree wherep_id is not null) then 'Leaf'
        else 'Inner'
    end as NodeType
FROM Tree t
ORDER BY t.id;

5.
select s.user_id, round(COALESCE(SUM(case when c.action = 'confirmed' THEN 1 ELSE 0 END) * 1.0 /NULLIF(COUNT(c.action), 0), 0), 2) as confirmation_rate
from Signups s
LEFT JOIN Confirmations c on s.user_id = c.user_id
group by s.user_id;

6.
select * from employees
where salary = (select min(salary) from employees);

7.
create procedure GetProductSalesSummary
    @ProductID int
	as begin
    set nocount on;
select 
        p.ProductName,
        SUM(s.Quantity) as total_sold,
        SUM(s.Quantity * p.Price) as total_amount,
        MIN(s.SaleDate) as first_date,
        MAX(s.SaleDate) as last_Date
    FROM Products p
    LEFT JOIN Sales s on p.ProductID = s.ProductID
    where p.ProductID = @ProductID
    group by p.ProductName;
end;
