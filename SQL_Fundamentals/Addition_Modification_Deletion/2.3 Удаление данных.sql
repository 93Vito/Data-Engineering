/*Создаю таблицу с исходными данными */
create table mysql.visits (
id int unsigned not null primary key auto_increment,
user_id int null,
date datetime null);
insert into mysql.visits (id, user_id, date) values
(1, 1, '2017-01-02 12:23:03'),
(2, 18, '2017-01-02 14:23:24'),
(3, 11, '2017-01-03 12:17:50'),
(4, 145, '2017-01-06 18:37:01'),
(5, 1, '2017-01-07 12:12:08'),
(6, 4, '2017-01-07 12:12:14');

/*Удалите из таблицы visits все данные с помощью конструкции DELETE */
delete from mysql.visits;
select * from mysql.visits;

/*Создаю таблицу с исходными данными */
create table mysql.products3 (
id int unsigned not null primary key auto_increment,
name varchar(255) null,
count int null);
insert into mysql.products3 (id, name, count) values
(1, 'баунти', 50),
(2, 'твикс', 33),
(3, 'сникерс', 0),
(4, 'пикник', 25),
(5, 'марс', 0),
(6, 'милка', 18),
(7, 'альпен голд', 13),
(8, 'дав', 0),
(9, 'кит-кат', 38),
(10, 'зебра', 11);

/* Удалите из таблицы products все товары, которых нет на складе */
delete from mysql.products3 where count=0;
select * from mysql.products3;

/*Создаю таблицу с исходными данными */
create table mysql.cars (
id int unsigned not null primary key auto_increment,
name varchar(255) null,
year int null);
insert into mysql.cars (id, name, year) values
(1, 'toyota camry', 2012),
(2, 'mazda demio', 2004),
(3, 'ваз 2110', 2010),
(4, 'nissan almera', 2016),
(5, 'nissan juke', 2016),
(6, 'reno logan', 2009),
(7, 'lada priora', 2017),
(8, 'reno duster', 2011),
(9, 'hyundai solaris', 2010),
(10, 'nissan patrol', 2014);

/* Удалите из таблицы cars все автомобили начиная с 2010 года и старше */
delete from mysql.cars where year<=2010;
select * from mysql.cars;

/*Создаю таблицу с исходными данными */ 
create table mysql.cars1 (
id int unsigned not null primary key auto_increment,
name varchar(255) null,
year int null,
country varchar(2) null,
power int null);
insert into mysql.cars1 (id, name, year, country, power) values
(1, 'toyota camry', 2012, 'jp', 139),
(2, 'mazda demio', 2004, 'jp', 113),
(3, 'ваз 2110', 2010, 'ru', 79),
(4, 'nissan almera', 2016, 'jp', 130),
(5, 'nissan juke', 2016, 'jp', 120),
(6, 'reno logan', 2009, 'fr', 87),
(7, 'lada priora', 2017, 'ru', 78),
(8, 'reno duster', 2011, 'fr', 143),
(9, 'hyundai solaris', 2010, 'kr', 98),
(10, 'nissan patrol', 2014, 'jp', 200);

/* Удалите из таблицы cars все корейские (country = "kr") автомобили, а также все автомобили мощностью (power) меньше 80 лс.
Используйте один SQL-запрос */
delete from mysql.cars1 where country='kr' or power < 80;
select * from mysql.cars1;

/* Удалите из таблицы все японские автомобили мощностью менее 100 и более 130 лс. (включая крайние значения) */
delete from mysql.cars1 where country='jp'and (power not between 100 and 130);
select * from mysql.cars1;

/*Удалите из таблицы cars все данные с помощью инструкции TRUNCATE */
truncate table mysql.cars1;
select * from mysql.cars1;