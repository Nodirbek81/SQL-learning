1.
select concat (Employee_ID, first_name + ' ' + last_name) as EmlployeeInfo
from employees
where EMPLOYEE_ID = 100;

2.
update Employees
set phone_number = replace (phone_number, '124', '999');

3.
select first_name as name, len(first_name) as lenghtname
from Employees
where first_name like 'A%'
or first_name like 'J%'
or first_name like 'M%'
order by first_name;

4.
select manager_id, sum(salary) as totalsalary
from Employees
group by manager_id;

5.
select Year1, greatest(max1, max2, max3) as maxvalue
from TestMax;

6.
select id, description
from cinema
where id % 2 = 1 and description != 'boring';

7.
  select *
  from SingleOrder
  order by case when id = 0 then 1 else 0 end, id;

8.
  select COALESCE(id, ssn, passportid, itin) as notnull
from Person;

9.
SELECT 
    StudentID,
    FullName,
    PARSENAME(REPLACE(FullName, ' ', '.'), 3) AS FirstName,
    CASE 
        WHEN LEN(FullName) - LEN(REPLACE(FullName, ' ', '')) = 2 
             THEN PARSENAME(REPLACE(FullName, ' ', '.'), 2) 
        ELSE NULL 
    END AS MiddleName,
    PARSENAME(REPLACE(FullName, ' ', '.'), 1) AS LastName
FROM Students1;

10.
select distinct o1.CustomerID, o2.OrderID, o2.DeliveryState
from Orders o1
join Orders o2 
    on o1.CustomerID = o2.CustomerID
where o1.DeliveryState = 'CA'
  and o2.DeliveryState = 'TX';

11.
select STRING_AGG (string, ', ') as bundedvalues
FROM DMLTable;

12.
SELECT *
FROM Employees
WHERE LEN(CONCAT(First_Name, Last_Name)) 
    - LEN(REPLACE(LOWER(CONCAT(First_Name, Last_Name)), 'a', '')) >= 3;

13.
SELECT Department_ID,
       COUNT(*) AS TotalEmployees,
       100.0 * SUM(CASE WHEN DATEDIFF(YEAR, Hire_Date, GETDATE()) > 3 THEN 1 ELSE 0 END) 
             / COUNT(*) AS PercentOver3Years
FROM Employees
GROUP BY Department_ID;

14.
SELECT StudentID,
       Grade,
       SUM(Grade) OVER (ORDER BY StudentID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM Students;

15.
select s1.studentName, s1.Birthday
from Student s1
join Student s2 on s1.Birthday = s2.Birthday and s1.StudentName <> s2.StudentName
order by s1.Birthday;

16.
SELECT LEAST(PlayerA, PlayerB) AS Player1,
       GREATEST(PlayerA, PlayerB) AS Player2,
       SUM(Score) AS TotalScore
FROM PlayerScores
GROUP BY LEAST(PlayerA, PlayerB), GREATEST(PlayerA, PlayerB);

17.
тушунмадим
