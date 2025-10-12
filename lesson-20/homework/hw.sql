1.
select DISTINCT s1.CustomerName
from #Sales s1
where exist (select 1
from #Sales s2
where s2.CustomerName = s1.CustomerName and MONTH(s2.SaleDate) = 3 and YEAR(s2.SaleDate) = 2024);

2.
seelct Product
from #Sales
group by Product
having SUM(Quantity * Price) = (select MAX(SUM(Quantity * Price))
from #Sales
group by Product);

3.
select MAX(TotalAmount) as highsnext
FROM (select SUM(Quantity * Price) as TotalAmount
from #Sales
group by SaleID) t
where TotalAmount < (
select MAX(SUM(Quantity * Price))
from #Sales
group by SaleID);

4.
select MONTH(SaleDate) as Numeral,
(select SUM(s2.Quantity)
 from #Sales s2
 where MONTH(s2.SaleDate) = MONTH(s1.SaleDate)) as TotalQuantity
FROM #Sales s1
group by MONTH(SaleDate);

5.
where EXISTS (select 1
from #Sales s2
where s1.CustomerName <> s2.CustomerName
and s1.Product = s2.Product);

6.
select Name,
 SUM(case when fruit = 'Apple' then 1 else 0 end) as Apple,
 SUM(case when fruit = 'Orange' then 1 else 0 end) as Orange,
 SUM(case when fruit = 'Banana' then 1 else 0 end) as Banana
from Fruits
group by Name;

7.
with RecursiveCTE as (select ParentID, ChildID from Family
union all
select f.ParentID, c.ChildID
from Family f
join RecursiveCTE c on f.ChildID = c.ParentID);

8.
select o2.*
from #Orders o2
where o2.DeliveryState = 'TX'
  and exists (select 1 from #Orders o1
 where o1.CustomerID = o2.CustomerID and o1.DeliveryState = 'CA');

 9.
 update #residents
set fullname = SUBSTRING(address, CHARINDEX('name=', address) + 5, CHARINDEX(' age', address) - CHARINDEX('name=', address) - 5)
where fullname IS NULL OR fullname NOT IN (address);

10.
select 'Tashkent - Samarkand - Khorezm' as direction, 100 + 400 as fullcost
union all
select 'Tashkent - Jizzakh - Samarkand - Bukhoro - Khorezm', 100 + 50 + 200 + 300;

11.
select ID, Vals, DENSE_RANK() over (order by 
сase when Vals='Product' then ID end) as ProductRank
from #RankingPuzzle;

12.
select e.*
from #EmployeeSales e
where e.SalesAmount > (select AVG(SalesAmount) from #EmployeeSales
where Department = e.Department);

13.
select e.*
from #EmployeeSales e
where EXISTS (select 1 from #EmployeeSales s where s.SalesMonth = e.SalesMonth and s.SalesYear = e.SalesYear
group by s.SalesMonth, s.SalesYear
having MAX(s.SalesAmount) = e.SalesAmount);

14.
select DISTINCT e1.EmployeeName
from #EmployeeSales e1
where not EXISTS (select DISTINCT SalesMonth
from #EmployeeSales e2
where NOT EXISTS (
select 1
from #EmployeeSales e3
where e3.EmployeeName = e1.EmployeeName and e3.SalesMonth = e2.SalesMonth));

15.
select *from Products
where Price > (select AVG(Price) from Products);

16.
select *from  Products
where Stock < (select MAX(Stock) from Products);

17.
select * from Products
where Category = (select Category from Products where Name='Laptop');

18.
select * from Products
where Price > (select MIN(Price) from Products
where Category='Electronics');

19.
select p.Name
from Products p
where Price > (select AVG(p2.Price) from Products p2
where p2.Category = p.Category);

20.
select DISTINCT p.Name
from Products p
where EXISTS (select 1 from Orders o
where o.ProductID = p.ProductID);

21.
select p.Name
from Products p
join Orders o on p.ProductID = o.ProductID
group by p.Name
having SUM(o.Quantity) > (select AVG(TotalQty) from (select SUM(Quantity) as Quantitysum
 from Orders
group by ProductID) t);

22.
select p.Name
from Products p
where NOT EXISTS (select 1 from Orders o where o.ProductID = p.ProductID);

23.
select top 1 p.Name, SUM(o.Quantity) as sumorder
from Products p
join Orders o ON p.ProductID = o.ProductID
group by p.Name
order by sumorder desc;
