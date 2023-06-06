create table Student(
id integer primary key auto_increment,
name varchar(128) check(name != null),
age integer check(age > 0));
create table Teachers(
id integer primary key auto_increment,
name varchar(128) check(name != null),
age integer check(age > 0));
create table Competencies(
id integer primary key auto_increment,
title varchar(128) not null);
create table Teachers2Competencies(
teacher_id  integer primary key auto_increment,
competencies_id  integer);
create table Courses(
id integer primary key auto_increment,
teacher_id  integer,
title varchar(128) not null,
headman_id   integer);
create table Students2Courses(
id integer primary key auto_increment,
student_id  integer,
course_id   integer);
insert into Student(name,age) values
('Анатолий', 29),
('Олег', 25),
('Семен', 27),
('Олеся', 28),
('Ольга', 31),
('Иван', 22);
insert into Teachers(name,age) values
('Петр', 39),
('Максим', 35),
('Антон', 37),
('Всеволод', 38),
('Егор', 41),
('Светлана', 32);
insert into Competencies(title) values
('Математика' ),
('Информатика'),
('Программирование'),
('Графика');
insert into Teachers2Competencies(competencies_id) values (1),(1),(3),(2),(1),(3);
insert into Courses(teacher_id, title, headman_id) values
(1,'Алгебра логики', 2),
(2,' Математическая статистика', 3),
(4,'Высшая математика', 5),
(5,'Javascript', 1),
(5,'Базовый Python', 1);
insert into Students2Courses(student_id,course_id) values 
(1, 1),
(2, 1),
(3, 2),
(3, 3),
(4,5);
select*from student;
select*from students2courses;
select*from univer.teachers;
select*from univer.competencies;
select*from univer.courses;
select*from univer.teachers2competencies;

select*from student where not id in (select id from students2courses);
select teachers.name, competencies.title from teachers left join competencies on teachers.id = competencies.id;
select teachers.name, competencies.title from teachers left join competencies on teachers.id = competencies.id where title is null;
select name from student left join students2courses on student.id = students2courses.id 
where students2courses.course_id is null;
select competencies.title, teachers2competencies.teacher_id from univer.competencies left join 
teachers2competencies on competencies.id = teachers2competencies.competencies_id where teachers2competencies.teacher_id is null;
select courses.title, student.name from courses left join student on courses.headman_id = student.id;
select courses.title, student.name from courses left join student on courses.headman_id = student.id;
select*from students2courses left join student on students2courses.id = student.id left join courses on students2courses.id = courses.headman_id;
