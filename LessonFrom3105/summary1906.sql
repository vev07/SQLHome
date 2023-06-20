-- summary 1906
use w3chools;
select * from w3schools.customers;
select Country, count(*) as customers from w3schools.customers group by Country having customers >= 10;
select * from w3schools.customers;
select count(OrderID) as orderID, t2.Country from w3schools.orders t1 inner join 
w3schools.customers  t2 on t1.CustomerID = t2.CustomerID group by t2.Country having OrderID >= 3;
select * from w3schools.products where Price >  (select avg(Price) as AVG_Price from w3schools.products);
select avg(Price) as AVG_Price from w3schools.products;
select * from w3schools.employees where EmployeeID not in(select distinct EmployeeID from w3schools.orders);
select * from w3schools.products where ProductID not in(select distinct ProductID from w3schools.order_details group by ProductID);
select * from w3schools.customers;
select ShipperID from w3schools.shippers where ShipperName = 'Speedy Express';
select * from w3schools.orders;
select count(*) as CustomerAll from w3schools.customers t1 where Country = 'Brazil';
select count(*) as total_shipped_to_Brazil from orders;
