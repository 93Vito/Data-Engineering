-- Создаю таблицу с исходными данными --
create table products (
 id serial primary key not null,
 name varchar(30),
 count int,
 price int);
insert into products (id, name, count, price)  values
(1, 'Стиральная машина', 5, 10000),
(2, 'Холодильник', 0, 10000),
(3, 'Микроволновка', 3, 4000),
(4, 'Пылесос', 2, 4500),
(5, 'Вентилятор', 0, 700),
(6, 'телевизор', 7, 31740);

-- Добавляю товары --
insert into products (id, name, count, price)  values
(7, 'Тостер', 2, 2500),
(8, 'Принтер', 4, 3000);

/* Выберите из таблицы products все товары
 в порядке возрастания цены (price) */
select * from products
order by price ASC;

/* Выберите из таблицы products все товары в порядке убывания цены.
Выведите только имена (name) и цены (price) */
select name, price from  products
order by price desc;

/* Выберите из таблицы products все товары стоимостью 5000 и выше в порядке убывания цены (price) */
select * from products
where price >= 5000
order by price desc;

/* Выберите из таблицы products все товары стоимостью до 3000 рублей отсортированные в алфавитном порядке.
 Вывести нужно только имя (name), количество (count) и цену (price) */
select name, count, price from products
where price <= 3000
order by name;


-- Создаю таблицу с исходными данным --
create table users (
id serial primary key,
first_name varchar(50),
last_name varchar(50),
birthday date,
salary integer,
job varchar(50));
insert into users (id, first_name, last_name, birthday, salary, job) values
(1, 'Дмитрий', 'Петров', '2000-03-14', 25000, 'офис-менеджер'),
(2, 'Ольга', 'Антонова', '1999-12-01', 41000, 'дизайнер'),
(3, 'Сергей', 'Васильев', '2002-02-20', 40000, 'младший программист'),
(4, 'Констанин', 'Степаниденко', '2004-03-07', 30000, 'водитель'),
(5, 'Алена', 'Шикова', '1999-08-17', 0, 'фотограф'),
(6, 'Василина', 'Парамнова', '2000-02-10', 28000, 'секретарь'),
(7, 'Александр', 'Пузаков', '2002-02-20', 120000, 'ведущий программист'),
(8, 'Алина', 'Антонова', '2002-01-01', 40000, 'верстальщик');

/*Выберите сотрудников из таблицы users с зарплатой (salary) меньше 30 000 рублей
 и отсортируйте данные по дате рождения (birthday).
 Cотрудников с нулевой зарплатой выбирать не нужно*/
select * from users
where salary < 30000 and salary !=0
order by birthday;

/* Выберите из таблицы users всех пользователей с зарплатой от 40 000 рублей и выше.
 Данные нужно сначала отсортировать по убыванию зарплаты (salary),
 а затем в алфавитном порядке по имени (first_name) */
select * from users
where salary >=40000
order by salary desc, first_name;

/* Выберите из таблицы users фамилии (last_name) и имена (first_name) всех пользователей.
Данные должны быть отсортированы сначала по фамилии, а затем по имени */
select last_name, first_name from users
order by last_name, first_name;

