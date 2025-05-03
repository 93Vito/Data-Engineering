
-- Создаю таблицу с исходными данными --
create table orders (
id serial primary key not null,
user_id integer,
products_count integer,
sum integer,
status varchar(30));
insert into orders (id, user_id, products_count, sum, status) values
(1, 1, 2, 1300, 'new'),
(2, 18, 1, 200, 'cancelled'),
(3, 11, 1, 2140, 'in_progress'),
(4, 145, 5, 6800, 'new'),
(5, 23, 1, 999, 'new'),
(6, 1, 2, 7690, 'cancelled'),
(7, 17, 1, 1600, 'new'),
(8, 5, 4, 400, 'delivery'),
(9, 2355, 1, 1450, 'new'),
(10, 13, 7, 13000, 'new');

-- Обновляем исходные данные таблицы --
update orders
set status ='returned'
where id=10;
 
update orders
set sum=10000
where id = 2;

-- Добавляем столбец с датой
alter table orders
add column data date;
update orders
set data = case 
when id = 1 then to_date('2017-01-02', 'yyyy-mm-dd')
when id = 2 then to_date('2017-01-02', 'yyyy-mm-dd')
when id = 3 then to_date('2017-01-03', 'yyyy-mm-dd')
when id = 4 then to_date('2017-01-06', 'yyyy-mm-dd')
when id = 5 then to_date('2017-01-09', 'yyyy-mm-dd')
when id = 6 then to_date('2017-01-16', 'yyyy-mm-dd')
when id = 7 then to_date('2017-01-27', 'yyyy-mm-dd')
when id = 8 then to_date('2017-02-01', 'yyyy-mm-dd')
when id = 9 then to_date('2017-02-02', 'yyyy-mm-dd')
when id = 10 then to_date('2017-02-02', 'yyyy-mm-dd')
end
where id between 1 and 10;

select * from orders;

/* Выберите из таблицы orders три последних заказа (по дате date)
 стоимостью от 3000 рублей и выше.
 Данные отсортируйте по дате в обратном порядке */
select * from orders
where sum >= 3000
order by data desc limit 3;

/*Выберите из таблицы orders 5 самых дорогих заказов за всё время.
Данные нужно отсортировать в порядке убывания цены.
Отмененные заказы не учитывайте */
select * from orders
where status !='cancelled'
order by sum desc limit 5;

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

/* Выберите из таблицы products название
 и цены трех самых дешевых товаров, которые есть на складе */
select name, price from products
where count !=0
order by price asc limit 3;

-- Добавляю товары --
insert into products (id, name, count, price)  values
(9, 'Активные колонки', 1, 2900),
(10, 'Ноутбук', 4, 36990),
(11, 'Посудомоечная машина', 0, 17800),
(12, 'Видеорегистратор', 23, 4000),
(13, 'Смартфон', 8, 12300),
(14, 'Флешка', 4, 1400),
(15, 'Блендер', 0, 5500),
(16, 'Газовая плита', 5, 11900),
(17, 'Клавиатура', 3, 1800);

/*Сайт выводит товары по 5 штук. Выберите из таблицы products товары,
которые пользователи увидят на 3 странице каталога
при сортировке в порядке возрастания цены (price) */
select * from products
order by price asc
limit 5 offset 10;


/*В таблице products 17 записей. Сайт выводит название (name)
и цену (price) товаров в алфавитном порядке, по 6 записей на страницу.
Напишите SQL запрос для получения списка товаров для формирования последней страницы каталога.
Товары, которых нет на складе, выводить не надо (таких товаров 3) */

update products
set count = 2
where id=11; /*привёл к условию, что трех товаров нет на складе */

select name, price from products
where count!=0
order by name limit 5 offset 12;
