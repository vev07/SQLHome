-- summary 2606
drop database ytub;
create database youtube;
use youtube;
drop table videos;
create table users (
user_id integer primary key auto_increment,
created_at timestamp default current_timestamp,
username varchar(64) not null,
country varchar(64) not null,
is_blocked bool default false);

create table if not exists videos(
    video_id int primary key auto_increment,
		created_at timestamp default current_timestamp,
		author_id integer,
		title varchar(256) not null,
		duration_secs int,
		FOREIGN KEY (author_id) REFERENCES users(user_id)
);

create table if not exists reactions(
    reaction_id integer primary key auto_increment,
    created_at timestamp default current_timestamp,
		author_id integer,
    `value` integer check(value between 1 and 5),
    video_id integer,
    FOREIGN KEY (author_id) REFERENCES users(user_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

create table donations (
donation_id integer,
created_at timestamp,
amount decimal(8.2),
donator_id integer,
video_id integer);

select * from videos;
select * from users;

select 
t1.title, 
t1.duration_secs, 
t2.username from videos t1 right join
users t2 
on t1.author_id = t2.user_id order by duration_secs desc limit 1;


INSERT INTO users(country, username)
VALUES
		('USA', 'h4acker'),
    ('Germany', 'Ivan Ivanov'),
    ('China', 'Petr Petrov');


INSERT INTO videos(author_id, title, duration_secs)
VALUES 
		(1, 'About 2023', 3600),
		(2, 'About me', 180),
    (3, 'About Germany', 1200);

