select
max(salary) as max_ZP,
min(salary) as min_ZP,
avg(salary) as avg_ZP,
count(salary) as count_ZP from employees;

-- найти максимальную и минимальную зп у сотрудников
SELECT first_name, last_name, salary FROM hr.employees union select null, null, max(salary) from hr.employees;
SELECT * FROM hr.employees order by salary desc limit 1;
select
max(salary) as max_ZP from hr.employees;
SELECT * FROM hr.employees where salary = (select
max(salary) from employees);

SELECT * FROM hr.employees where salary < (select
avg(salary) from employees);
select * from tasks;
select * from employee;
select max(salary) as max_ZP, min(salary) as min_ZP from employee;

-- найти разницу между максимальной и минимальной зп
select max(salary) - min(salary) as difference_ZP from employee;

-- Напишите запрос, 
-- который выводит одно поле (done_cnt) с колличеством сделаных задач.
-- done_flg = 1
select count(done_flg) as done_cnt from tasks where done_flg = 1;

-- quantity all discription
select count(*) from employees;

-- quantity is not null
select count(commission_pct) from employees;

-- quantity unique meaning
select count(distinct commission_pct) from employees;

-- Найдите колличество сотрудников, у которых есть хотя бы одна невыполненая задача. 
-- Выборка должна содержать поле busy_count
select count(distinct employee_id) as busy_count from tasks where done_flg = 0;

-- Найдите общую стоимость невыполненых задач. 
-- Результат выведите в поле total_payment.
select sum(payment) as total_payment from tasks  where done_flg = 0;

-- Найдите общую стоимость невыполненых задач по группам.
select done_flg,sum(payment) as total_payment from tasks  group by done_flg;

-- найти среднюю сумму зарплаты у сотрудников каждого менеджера
-- в итоговой выборке вывести manager_id, avg_salary
select manager_id, sum(salary) from employee where manager_id is not null group by manager_id;


-- вывести имя и фамилию сотрудников, которые являются менеджерами и 
-- среднюю зп у их подичненных
select t1.name, t1.lastname,t2.avg_salary
from employee t1 inner join ( SELECT  manager_id,   AVG(salary) AS avg_salary FROM employee
 where manager_id is not null GROUP BY manager_id) t2 on t1.id = t2.manager_id;

select*from employees
-- 1) найти максимальную зп для каждого департамента
-- в итоговой выборке должны быть поля department_id, max_salary
select department_id, max(salary) as salary from employees where department_id is not null group by department_id;

-- 2) вывести имя и фамилию сотрудников, у которых max большая зп 
-- в департаменте
select  t1.first_name, t1.last_name from employees t1 inner join (
 select 
  department_id,   max(salary) as max_salary  from employees 
 where department_id is not null  group by department_id) t2 
on t1.department_id = t2.department_id
and t1.salary = t2.max_salary;



