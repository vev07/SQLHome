-- Найти количество сотрудников в каждом департаменте. Вывести departmentid и employeescnt
select department_id, count(*) as employeescnt from hr.employees group by department_id;

-- Найти количество сотрудников в каждом департаменте. Вывести departmentname и employeescnt
select t1.department_name, t2.employee from departments t1 join
 (select count(*) as employee, department_id from hr.employees group by department_id) t2 on t1.department_id = t2.department_id;
 
 -- Найти количество сотрудников у каждого менеджера. Вывести managerid и employeescnt
 select  manager_id, count(*) as employeescnt from employees where manager_id is not null group by manager_id;
 
 -- Найти количество сотрудников у каждого менеджера. Вывести firstname,  lastname и employees_cnt
select  t1.first_name, t1.last_name, t2.employeescnt from employees t1 join
 (select count(*) as employeescnt, manager_id from employees group by manager_id) t2 on t1.employee_id = t2.manager_id;
 
 -- Найти максимальную зарплату в каждом департаменте. Вывести departmentid и maxsalary
select department_id, max(salary) as maxsalary from employees group by department_id;

-- Найти сотрудников, у которых наибольшая зарплата в их департаменте
select first_name, last_name from employees t1 join (select department_id, max(salary) as maxsalary from employees group by department_id) t2
 on t1.department_id = t2.department_id and t1.salary = t2.maxsalary;
 
