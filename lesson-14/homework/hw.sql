1.
SELECT Id, PARSENAME(REPLACE(Name, ',', '.'), 2) as FirstName,
    PARSENAME(REPLACE(Name, ',', '.'), 1) as Surname
from TestMultipleColumns;

2.
select * from TestPercent
where strs LIKE '%[%]%';

3.
SELECT id,
 PARSENAME(vals, 2) as dotname1,
 PARSENAME(vals, 1) as dotname2
from Splitter;

4.
 select * from testDots
where Vals like '%.%.%.%';

5.
select texts, len(texts) - len(replace(texts, ' ', '')) as totalcount
from CountSpaces;

6.
select e.name as employeename, e.salary as empsalary, m.name as managername,  m.salary as mansalary
from Employee e
join Employee m on e.id = m.managerid
where e.Salary > m.Salary

7.
select Employee_ID, CONCAT(First_Name, ' ' ,Last_Name) as employeename, Hire_Date, 
datediff(year, Hire_Date, GETDATE()) as serviceyears
from Employees
WHERE DATEDIFF(year, Hire_Date, GETDATE()) between 10 and 15;

8.
select w.*
from weather w
inner join weather p on w.RecordDate = dateadd(day, 1, p.RecordDate)
where w.Temperature > p.Temperature

9.
select player_id, MIN(event_date) as initialLog
from Activity
group by player_id;

10.
select parsename(replace(fruit_list, ',', '.'), 2) AS ThirdFruit
FROM fruits;

11.
select Employee_id, concat(first_name, ' ' , last_name) as employee_name, hire_date,
case 
when datediff(year, hire_date, getdate()) < 1 then 'New Hire'
when datediff(year, hire_date, getdate()) between 1 and 5 then 'Junior'
when datediff(year, hire_date, getdate()) between 5 and 10 then 'Mid-Level'
when datediff(year, hire_date, getdate()) between 10 and 20 then 'Senior'
else 'Veteran'
end as Employment_Stage
from Employees
order by Employee_id;

12.
select Id, cast(LEFT(Vals, PATINDEX('%[^0-9]%', VALS + 'P') - 1) as int) as Fullnumber
from GetIntegers
where vals is not NULL;

13.
WITH SplitVals AS (
    SELECT 
        Id,
        value,
        ROW_NUMBER() OVER (PARTITION BY Id ORDER BY (SELECT NULL)) AS rn
    FROM MultipleVals
    CROSS APPLY STRING_SPLIT(Vals, ',')
)
SELECT 
    Id,
    STRING_AGG(
        CASE WHEN rn = 1 
             THEN RIGHT(value,1) + LEFT(value,1)
             ELSE value
        END, ','
    ) AS SwappedVals
FROM SplitVals
GROUP BY Id;

14.
DECLARE @str VARCHAR(100) = 'sdgfhsdgfhs@121313131';

WITH cte AS (
    SELECT 1 AS pos, SUBSTRING(@str, 1, 1) AS ch
    UNION ALL
    SELECT pos + 1, SUBSTRING(@str, pos + 1, 1)
    FROM cte
    WHERE pos < LEN(@str)
)
SELECT ch
FROM cte
OPTION (MAXRECURSION 1000);

15.
select * from Activity 
select a.player_id, a.device_id, a.event_date
FROM Activity a
JOIN 
(
select player_id, MIN(event_date) as first_login
from Activity
group by player_id) t on a.player_id = t.player_id AND a.event_date = t.first_login;

16.
DECLARE @str VARCHAR(100) = 'rtcfvty34redt';
WITH Numbers AS (
    SELECT 1 AS n, SUBSTRING(@str, 1, 1) AS ch
    UNION ALL
    SELECT n + 1, SUBSTRING(@str, n + 1, 1)
    FROM Numbers
    WHERE n < LEN(@str)
)
SELECT
    STRING_AGG(CASE WHEN ch LIKE '[0-9]' THEN ch END, '') AS Numbers,
    STRING_AGG(CASE WHEN ch LIKE '[^0-9]' THEN ch END, '') AS Letters
FROM Numbers
OPTION (MAXRECURSION 0);
