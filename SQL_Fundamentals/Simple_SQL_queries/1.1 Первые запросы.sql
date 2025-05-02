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

-- Получите всю информацию о товарах из таблицы products --
select * from products

/* Получите название (name)
  и цену (price) всех товаров из таблицы products */
select name, price from products

-- Добавляю товары --
insert into products (id, name, count, price)  values
(7, 'Тостер', 2, 2500),
(8, 'Принтер', 4, 3000);

/* Выберите из таблицы products все записи,
  в которых цена (price) меньше 3000 */
select * from products
where price < 3000;

/*Выберите из таблицы products имена (name)
  и цены (price) всех товаров, стоимостью от 10 000 и выше */
select name, price from products
where price >= 10000;

/* Получите из таблицы products имена (name) товаров,
  которые закончились */
select name from products
where count = 0;

/* Выберите из таблицы products название (name)
 и цены (price) товаров, стоимостью до 4000 включительно */
select name, price from products 
where price <= 4000;