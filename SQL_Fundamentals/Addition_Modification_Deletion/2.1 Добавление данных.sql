/*Создаю таблицу с исходными данными */
create table mysql.orders (
id int unsigned not null primary key,
products int null,
sum int null);
insert into mysql.orders (id, products, sum) values
(1, 2, 1300),
(2, 1, 10000),
(3, 1, 2140),
(4, 5, 6800),
(5, 1, 999);

/*Добавьте в таблицу orders данные о новом заказе стоимостью 3000 рублей. В заказе 3 товара (products) */
insert into mysql.orders (id, products, sum) values
(6, 3, 3000);
select * from mysql.orders;

/*Создаю таблицу с исходными данными */
create table mysql.products (
id int unsigned not null primary key,
name varchar(255) null,
count int null,
price int null);
insert into mysql.products (id, name, count, price) values
(1, 'Стиральная машина', 5, 10000),
(2, 'Холодильник', 0, 10000),
(3, 'Микроволновка', 3, 4000),
(4, 'Пылесос', 2, 4500),
(5, 'Вентилятор', 0, 700),
(6, 'Телевизор', 7, 31740);

/* Добавьте в таблицу products новый товар — «Xbox», стоимостью 30000 рублей в количестве (count) трех штук */
insert into mysql.products (id, name, count, price) values
(7, 'Xbox', 3, 30000);

/*Добавьте в таблицу products новый товар — «iMac 21», стоимостью 100100 рублей.
Товар пока не завезли на склад */
insert into mysql.products (id, name, count, price) values
(8, 'iMac', 0, 100100);

/* Добавьте одним SQL запросом в таблицу products следующие товары:
iPhone 7, цена 59990, 1 шт.
iPhone 8, цена 64990, 3 шт.
iPhone X, цена 79900, 2 шт */
insert into mysql.products (id, name, count, price) values
(9, 'iPhone 7', 1, 59990),
(10, 'iPhone 8', 3, 64990),
(11, 'iPhone X', 2, 79990);

/*Создаю таблицу с исходными данными */
create table mysql.users (
id int,
first_name varchar(50) null,
last_name varchar(50) null,
birthday date null);
insert into mysql.users (id, first_name, last_name, birthday) values
(1, 'Дмитрий', 'Петров', '2000-03-14'), 
(2, 'Ольга', 'Антонова', '1999-12-01'),
(3, 'Сергей', 'Васильев', '2002-02-20'),
(4, 'Константин', 'Степаниденко', '2004-03-07'),
(5, 'Алена', 'Шикова', '1999-08-17'),
(6, 'Василина', 'Парамонова', '2000-10-10'),
(7, 'Александр', 'Пузаков', '2002-02-20'),
(8, 'Алина', 'Антонова', '2002-01-01');

/* Добавьте в таблицу users нового пользователя
Антона Пепеляева с датой рождения 12 июля 1992 года */
insert into mysql.users (id, first_name, last_name, birthday) values
(9, 'Антон', 'Пепеляев', '1992-07-12');

/* Добавьте в таблицу users нового пользователя Никиту Петрова.
 *Дату рождения не указывайте. Используйте ключевое слово SET */
insert into mysql.users set
id=10, first_name='Никита', last_name='Петров';

