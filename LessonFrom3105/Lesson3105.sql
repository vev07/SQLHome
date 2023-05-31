SELECT * FROM tmp.employee where lastname like 'Gon%';
SELECT * FROM tmp.tasks;
create table employee(
    id integer primary key,
    name varchar(128) not null,
    lastname varchar(128) not null,
    salary integer check(salary >= 0) default 0,
    manager_id integer
);

create table tasks(
    id integer,
    title varchar(128),
    employee_id integer,
    done_flg integer
);
select distinct
t1.name,
t1.lastname,
t2.title
from tmp.employee t1 left join tmp.tasks t2 on t1.id = t1.id and t2.done_flg = 0 order by t1.lastname;
select database();


select employee_id from tmp.tasks where done_flg = 0;

select
name,
lastname
from tmp.employee where id  not in (select employee_id from tmp.tasks where  done_flg = 0);





