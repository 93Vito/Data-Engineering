/* Создаю таблицу с исходными данными */
create table mysql.products1 (
id int unsigned not null primary key auto_increment,
name varchar(255) null,
count int null,
price int null);
insert mysql.products1 (id, name, count, price) values
(1, 'Стиральная машина', 5, 10000),
(2, 'Холодильник', 0, 10000),
(3, 'Микроволновка', 3, 4000),
(4, 'Пылесос', 2, 4500),
(5, 'Вентилятор', 0, 700),
(6, 'Телевизор', 7, 31740),
(7, 'IMAC', 3, 109990),
(8, 'iPhone 7', 1, 59990),
(9, 'iPhone 8', 3, 64990),
(10, 'iPhone X', 2, 79900);

/* В таблицу products внесли данные с ошибкой, вместо iMac в наименовании написали IMAC. Исправьте ошибку */
Update mysql.products1 set name='iMac' where name='IMAC';
select * from mysql.products1;

/* Увеличьте цену 5 самых дешевых товаров на 5% */
Update mysql.products1 set price=price*1.05 order by price ASC  limit 5;
select * from mysql.products1;

/* Уменьшите цену 5 самых дорогих товаров на 5000 рублей */
update mysql.products1 set price = price -5000 order by price desc limit 5;
select * from mysql.products1;

/* Создаю таблицу с исходными данными */
create table mysql.orders1 (
id int unsigned not null primary key auto_increment,
user_id int null,
products_count int null,
sum int null,
status varchar(20) null,
amount int null);
insert into mysql.orders1 (id, user_id, products_count, sum, status, amount) values
(1, 1, 2, 1300, 'new', 2600),
(2, 18, 1, 10000, 'cancelled', 0),
(3, 11, 1, 2140, 'in_progress', null),
(4, 145, 5, 6800, 'new', 34000),
(5, 23, 1, 999, 'new', 999),
(6, 1, 2, 7690, 'cancelled', null),
(7, 17, 1, 1600, 'new', 0),
(8, 5, 4, 400, 'delivery', null),
(9, 2355, 1, 1450, 'new', 1450),
(10, 13, 7, 13000, 'cancelled', 91000);

/* В поле amount в таблице orders должно стоять число, которое равно произведению цены (sum) на количество (products_count).
 Но из-за сбоя в системе некоторые значения суммы получили 0 или NULL.
 Обновите таблицу, чтобы в поле amount были правильные значения */
update mysql.orders1 set amount=products_count*sum where amount is null or amount=0;
select * from mysql.orders1;

/* Измените статус (status) заказа под номером (id) 8 с delivery на success */
update mysql.orders1 set status='success' where id=8;
select * from mysql.orders1;

/* Создаю таблицу с исходными данными */
create table mysql.users1 (
id int unsigned not null primary key auto_increment,
first_name varchar(50) null,
last_name varchar(50) null,
birthday date null,
salary int null);
insert into mysql.users1 (id, first_name, last_name, birthday, salary) values
(1, 'Дмитрий', 'Петров', '2000-03-14', 17000),
(2, 'Ольга', 'Антонова', '1999-12-01', 20000),
(3, 'Сергей', 'Васильев', '2002-02-20', 15000),
(4, 'Константин', 'Степаниденко', NULL, 35000),
(5, 'Алена', 'Шикова', '1999-08-17', 40000),
(6, 'Василина', 'Парамонова', '2000-10-10', 18500),
(7, 'Александр', 'Пузаков', '2002-02-20', 21000),
(8, 'Алина', 'Антонова', '2002-01-01', 55000),
(9, 'Антон', 'Пепеляев', '1992-07-12', 60000);

/* Увеличьте в таблице users сотрудникам, у которых зарплата менее 20 000 рублей, зарплату (salary) на 10% */
update mysql.users1 set salary=salary*1.1 where salary <20000;
select * from mysql.users1;

/* Создаю таблицу с исходными данными */
create table mysql.orders2 (
id int unsigned not null primary key auto_increment,
user_id int null,
products_count int null,
sum integer null,
status varchar(20) null);
insert into mysql.orders2 (id, user_id, products_count, sum, status) values
(1, 1, 2, 1300, 'new'),
(2, 18, 1, 10000, 'cancelled'),
(3, 11, 1, 2140, 'in_progress'),
(4, 145, 5, 6800, null),
(5, 23, 1, 999, 'new'),
(6, 1, 2, 7690, 'cancelled'),
(7, 17, 1, 1600, null),
(8, 5, 4, 400, 'delivery'),
(9, 2355, 1, 1450, null),
(10, 13, 7, 13000, 'cancelled');

/* Проставьте всем заказам без статуса (status равен NULL) статус "new" */
update mysql.orders2 set status='new' where status is null;
select * from mysql.orders2;

/* Создаю таблицу с исходрными данными */
create table mysql.products2 (
id int unsigned not null primary key auto_increment,
name varchar(255) null,
count integer null);
insert into mysql.products2 (id, name, count) values
(1, 'баунти', 50),
(2, 'твикс', 33),
(3, 'сникерс', 4),
(4, 'пикник', 25),
(5, 'марс', 2),
(6, 'милка', 18),
(7, 'альпен голд', 13),
(8, 'дав', 31),
(9, 'кит-кат', 38),
(10, 'зебра', 11);

/* В поле count содержится текущее количество товаров на полках и на складе. В магазин привезли 2 упаковки Сникерса и 2 упаковки Марса.
В каждой упаковке по 20 шоколадок. Обновите данные так, чтобы они отражали количество шоколадок с учетом нового привоза */
update mysql.products2 set count=count+2*20 where id in (3,5);
select * from mysql.products2;