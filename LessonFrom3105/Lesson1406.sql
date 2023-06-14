-- 14.06.2023
-- найти кол-во сотрудников с job_id IT_PROG
select count(*) from employees where job_id = 'IT_PROG';

-- найти кол-во сотрудников у каждого job_id
-- в итоговой выборке должны быть job_id и кол-во сотрудников
select job_id, count(*) as cnt  from employees group by job_id;

-- найти среднюю зп у каждого job_id
select job_id, avg(salary) as avg_salary  from employees group by job_id;

-- вывести имя и фамилию сотрудников, которых в их job_id зп 
-- меньше средней
select t1.first_name, t1.last_name from employees t1 inner join 
 (select job_id, avg(salary) as avg_salary  from employees group by job_id) t2 on t1.job_id = t2.job_id where t1.salary < t2.avg_salary;

-- сформировать выборку, котоаря выводит название департамента (departments)
-- и кол-во сотрудников в этом департаменте (employees)
select 
 t1.department_id,
 t1.department_name,
 t2.cnt from departments t1 inner join
(select department_id, count(*) as cnt from employees group by department_id) t2 
on t1.department_id =  t2.department_id; 

-- найти название департамента с максимальным кол-вом сотрудников
select 
t2.department_id
from (
select
department_id,
count(*) as cnt
 from employees 
 group by department_id
 ) t2
where t2.cnt =(
select 
max(cnt) as max_cnt
 from (
 select
 count(*) as cnt 
from employees
group by department_id) t1 
);


select
department_name
from departments
where department_id =(
select
 department_id
 from employees
 group by department_id
 having count(*) = (
 select
 max(cnt) as max_cnt
 from (select
 count(*) as cnt
  from employees
  group by department_id
  ) t1
  )
  );
select * from tmp_1.customers;
select * from tmp_1.orders;
select * from tmp_1.products;

-- вывести имя и фамилию покупателей, у которых есть order_type online
select distinct *, customer_id from customers t1 join (
select customer_id from tmp_1.orders where order_type = 'online') t2 on t1.id = t2.customer_id;

-- написать запрос, который выводит имя и фамилию покупателя и 
-- наименование товаро, которые они заказывали
select t1.name, t1.lastname,t3.title from customers t1 left join
(select customer_id, product_id from orders) t2 on t1.id = t2.customer_id left join ( 
select id, title from tmp_1.products) t3 on t2.product_id = t3.id;

-- написать запрос, который выводит имя и фамилию всех покупателей и 
-- общую сумму его заказов
select 
 t1.name,
 t1.lastname,
 t2.order_total
from customers t1 
left join (
 select 
  t1.customer_id,
  sum(t1.product_count * t2.price) as order_total
 from orders t1
 inner join products t2 
 on t1.product_id = t2.id
 group by t1.customer_id
) t2 
on t1.id = t2.customer_id;





