
--нужная база отсутствовала, выпонил задание в той базе, которая была. Спасибо за понимание!

SELECT * FROM airport.fly2;
select * FROM airport.fly2 where model_name = 'Airbus A320-200' and range_=14200 and country not like 'USA';
set sql_safe_updates=0;
update airport.fly2 set id = id * 10;
update airport.fly2 set model_name = 'USA fly' where model_name = 'Boeing 777-300';
update airport.fly2 set production_year = production_year * 10 where production_year < 2002;

