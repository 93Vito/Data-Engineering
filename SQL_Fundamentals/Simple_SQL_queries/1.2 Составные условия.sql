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

/* Выберите из таблицы orders все заказы кроме отмененных.
 У отмененных заказов status равен "cancelled" */
select * from orders
where status !='cancelled';

/* Выберите из таблицы orders все заказы,
 содержащие более 3 товаров (products_count).
Вывести нужно только номер (id) и сумму (sum) заказа */
select id, sum from orders
where products_count > 3;

/* Выберите из таблицы orders все отмененные заказы.
 У отмененных заказов status равен "cancelled" */
select * from orders
where status ='cancelled';

-- Обновляем исходные данные таблицы --
update orders
set status ='returned'
where id=10;

/*Выберите из таблицы orders все заказы, у которых сумма (sum) больше 3000
 или количество товаров (products_count) от 3 и больше */
select * from orders
where sum > 3000 or products_count >= 3;

/* Выберите из таблицы orders все заказы, у которых сумма (sum) от 3000 и выше,
 а количество товаров (products_count) меньше 3 */
select * from orders
where sum >= 3000 and products_count < 3;

/*Выберите из таблицы orders все отмененные (cancelled)
 и возвращенные (returned) товары. Используйте in */
select * from orders
where status in ('cancelled', 'returned');

/*Выберите из таблицы orders все отмененные заказы,
 исключая заказы стоимостью от 3000 до 10000 рублей включительно */
select * from orders
where status = 'cancelled' and sum not between 3000 and 10000;

/*Выберите из таблицы orders все отмененные заказы стоимостью
 от 3000 до 10000 рублей включительно. Используйте between */
select * from orders
where status = 'cancelled' and sum between 3000 and 10000;