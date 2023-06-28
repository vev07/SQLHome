-- Lesson 21.06
-- найти кол-во локаций для каждой страны  вывести country_id и cnt
select country_id,count(*) from hr.locations group by country_id;

select 
t1.country_name, 
t2.cnt 
from hr.countries t1 join (
select 
country_id, 
count(*) as cnt  from hr.locations group by country_id) t2
on t1.country_id = t2.country_id;


select
  department_id,
  avg(salary) as avg_salary 
from hr.employees
  group by department_id 
  having avg_salary > avg((
select 
  avg(salary) as avg 
from hr.employees));
  
  select 
  avg(salary) as avg_salary 
from hr.employees; 

-- вывести название департамента и среднюю зп в нем
select
  t1.department_name,
  t2.avg_salary from hr.departments t1 join (
select
  department_id,
  avg(salary) as avg_salary 
from hr.employees group by department_id) t2 
on t1.department_id = t2.department_id;

-- написать запрос, который выводит названия департаментов, в которых 
-- от 5 до 10 человек
select
 t1.department_name,
 t2.count_emploee
from hr.departments t1 join (
select
 department_id,
 count(*) as count_emploee 
from hr.employees group by department_id) t2 
 on t1.department_id = t2.department_id 
having count_emploee between 5 and 10;

select
 department_name
from hr.departments where department_id in (
select
 department_id
from hr.employees group by department_id having count(*) between 5 and 10);

-- найти кол-во сужчин и женщин среди покупателей
-- в выборке должны быть поля gender, cnt
select
 gender,
 count(*) as cnt 
from tmp_1.customers group by gender;


-- найти кол-во заказов, сделаных мужчинами и женщинами
-- в итоговой выборке должны быть поля gender и cnt
select
t1.gender,
count(*) as cnt
from tmp_1.customers t1 join tmp_1.orders t2
 on t1.id = t2.customer_id
 group by t1.gender;
 
 -- найти кол-во заказов, сделаных online и direct 
-- в итоговой выборке должны быть поля order_type и cnt
 select order_type, count(*) as cnt from tmp_1.orders group by order_type;
 
 -- найти кол-во заказаных единиц товара для каждого типа заказа (online, direct) 
 select
 order_type,
 sum(product_count) as sum_total 
 from tmp_1.orders group by order_type;
 
 -- найти общую сумму онлайн и прямых заказов
-- в итоговой выборке должны быть поля order_type и order_total
select
 t1.order_type,
 sum(t1.product_count * t2.price) as sum_price
 from tmp_1.orders t1 join  tmp_1.products t2 
on t1.product_id = t2.id group by t1.order_type;


-- найти общую сумму заказов у каждого пола (отдельно мужчины и отдельно женщины)
-- в итоговой выборке должны быть поля gender и order_total

select * from tmp_1.customers;
select * from tmp_1.orders;
select * from tmp_1.products;

select
 t1.gender,
 sum(t2.product_count * t3.price) as sum_price  
from tmp_1.customers t1 join tmp_1.orders t2 
on t1.id = t2.customer_id join tmp_1.products t3
on t2.product_id = t3.id;






