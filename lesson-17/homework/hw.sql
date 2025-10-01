1.
with regions as (
    SELECT DISTINCT region FROM #RegionSales),
	distributor as (
select distinct distributor from #RegionSales)
select r.region, d.distributor, isnull(sum(s.sales), 0) as sales
from regions r
cross join distributor d
left join #RegionSales s on s.region = r.region and s.Distributor = d.Distributor
group by r.Region, d.Distributor
order by r.Region, d.Distributor;

2.
select e.name
from Employee e
inner join Employee m on e.id = m.managerId
group by e.id, e.name
having count(m.id) >= 5;

3.
select p.product_name, sum(o.unit) as totalamount
from Products p
join Orders o on p.Product_ID = o.product_id
where p.product_category in ('book', 'T-shirt')
and o.order_date >= '2020-02-01' and o.order_date < '2020-03-01' 
group by p.Product_Name
having sum(o.unit) >= 100;

4.
select DISTINCT o.CustomerID, v.Vendor
from Orders1 o
cross apply ( select top 1 Vendor
    from Orders1 o2
    where o2.CustomerID = o.CustomerID
    group by Vendor
    order by SUM([Count]) desc) v;

5.
logic qiyin ekan

6.
select Device_id, count(DISTINCT d.Locations) as no_of_location,
    (select TOP 1 Locations
        from Device d2
        where d2.Device_id = d.Device_id
        group by d2.Locations
        order by count(*) desc
    ) as max_signal_location,
    count(*) as no_of_signals
from Device d
group by d.Device_id;

7.
select e.EmpID, e.empname, e.salary
from Employee e
inner join (
select deptid, avg(salary) as avg_salary
from Employee
group by deptid) p on e.DeptID = p.DeptID
where e.salary > p.avg_salary;

8.
WITH TicketStats AS (
    SELECT 
        t.TicketID,
        COUNT(DISTINCT t.Number) AS total_picked,           
        COUNT(DISTINCT n.Number) AS matched_numbers        
    FROM Tickets t
    LEFT JOIN Numbers n ON t.Number = n.Number
    GROUP BY t.TicketID
),
Prize AS (
    SELECT
        TicketID,
        CASE 
            WHEN matched_numbers = (SELECT COUNT(*) FROM Numbers) THEN 100   
            WHEN matched_numbers > 0 THEN 10                                
            ELSE 0                                                         
        END AS prize
    FROM TicketStats
)
SELECT SUM(prize) AS total_winnings
FROM Prize;
logic biroz qiyin ekan

9.
WITH RECURSIVE Expand as 
(
    select Product, 1 AS qty, Quantity
    from Grouped
    union all
    select Product, qty + 1, Quantity
    from Expand
    where qty < Quantity)
	select  Product, 1 AS Quantity
    from Expand
	order by Product;
