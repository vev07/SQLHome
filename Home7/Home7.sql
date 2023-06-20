-- Home 7
-- 1) вывести название продукта, который чаще всего встречается в заказах
select t1.title
 from home7.products t1 join 
 (select 
 * 
 from home7.orders having 
 productcount = (
 select 
 max(productcount) as max_count 
 from home7.orders)) t2 
 on t1.id = t2.id;
 
 -- 2) вывести название продукта, который покупают чаще всего (нужно посчетать общее количество купленных единиц)
 select 
 t1.title
 from home7.products t1 join 
 (select 
 productid, 
 count(productid) as count_productid 
 from home7.orders 
 group by productid limit 1) t2 
 on t1.id = t2.productid;
 
 -- 3) вывести общую выручку магазина. Сумма всех купленных единиц товара.
select
t1.customerid, 
sum(t1.productcount * t2.price) as total_price 
from home7.orders t1 join (
select 
    id, 
    price 
from home7.products) t2 on
 t1.productid = t2.id 
 group by t1.customerid;
 
 -- 4) определить сумму выручки за онлайн продажи (online) и за продажи в магазине (direct)
 select
 t1.ordertype, 
  sum(t1.productcount * t2.price) as total_price
 from home7.orders t1 join (
 select
 id, 
 price 
 from home7.products) t2 on 
 t1.productid = t2.id 
 group by t1.ordertype;

 

 


 
 





