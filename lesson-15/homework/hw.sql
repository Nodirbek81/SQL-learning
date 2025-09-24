1.
select * from employees
where salary = (select min(salary)
from Employees);

2.
select * from products
where price > (select avg(price)
from products);

3.
select e.*
from employees e
join  departments d on e.department_id = d.id
where d.department_name = 'Sales';

4.
select c.*
from customers c
where c.customer_id not in(select o.order_id from orders1 o);

5.
select p.*
from products p
where p.price = (select max(p2.price) 
from products p2
where p2.category_id = p.category_id);

6.
select e.*
from employees e
join departments1 d on e.id = d.id
where salary > = (select avg(e.salary) from employees e);

7.
select e.* from employees e
where e.salary > (select avg(e1.salary) from employees e1
where e1.department_id = e.department_id)
order by e.department_id;

8.
select s.name, g.course_id, g.grade
from students s
join grades g on s.student_id = g.student_id
where g.grade = (select max(g1.grade) from grades g1 
where g1.course_id = g.course_id);

9.
select p.* from products p
where 2 = (select count (distinct p1.price)
from products p1
where p1.category_id = p.category_id and p1.price > p.price);

10.
select e.* 
from employees e
where e.salary > (select avg(e.salary) from employees e) 
and e.salary < (select max(e1.salary)
from Employees e1
where e1.department_id = e.department_id);
