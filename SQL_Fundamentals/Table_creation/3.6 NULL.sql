/* Выберите из таблицы products название, количество и цены 
всех товаров, у которых нет категории. Данные отсортируйте по цене */
CREATE TABLE mysql.products5 (
     id INT UNSIGNED NOT NULL,
     category_id INT UNSIGNED NULL,
     name VARCHAR(20) NULL,
     count INT UNSIGNED NULL,
     price INT UNSIGNED  NULL
);
INSERT INTO mysql.products5 (id, category_id, name, count, price)
VALUES (1, 7, 'Стиральная машина', 5, 10000),
       (2, 12, 'Холодильник', 0, 10000),
       (3, 12, 'Микроволновка', 3, 4000),
       (4, 8, 'Пылесос', 2, 4500),
       (5, NULL, 'Вентилятор', 0, 700),
       (6, 9, 'Телевизор', 7, 31740),
       (7, 12, 'Тостер', 2, 2500),
       (8, NULL, 'Принтер', 4, 3000),
       (9, NULL, 'Активные колонки', 1, 2900);
SELECT name, count , price FROM mysql.products5
WHERE category_id IS NULL
ORDER BY price;

/* Создайте таблицу products со следующими полями:
id — номер товара, целое положительное, не может принимать NULL.
name — название товара до 120 символов, не может принимать NULL.
category_id — категория товара, целое положительное, может принимать NULL.
price — цена, денежный тип из 10 знаков, из них два после запятой. Не может принимать NULL */
CREATE TABLE mysql.products6 (
     id INT UNSIGNED NOT NULL,
     name VARCHAR(120) NOT NULL,
     category_id INT UNSIGNED NULL,
     price DECIMAL(10,2)
);
INSERT INTO mysql.products6 (id, name, category_id, price)
VALUES (1, 'Подгузники (12 шт)', 3, 700.00),
       (2, 'Подгузники (24 шт', 3, 1250.00),
       (3, 'Спиннер', NULL, 250.40),
       (4, 'Пюре слива', 4, 47.50);
SELECT * FROM mysql.products6;

/* Создайте таблицу users с двумя полями:
id — целое положительное, не может принимать NULL.
email — строка для хранения электронных адресов пользователей длиной до 100 символов,
не может принимать NULL */
CREATE TABLE mysql.users5 (
     id INT UNSIGNED NOT NULL,
     email VARCHAR(100) NOT NULL
);
INSERT INTO mysql.users5 (id, email)
VALUES (1, 'user1@domain.com'),
       (2, 'user2@domain.com'),
       (3, 'user3@domain.com'),
       (4, 'user4@domain.com');
SELECT * FROM mysql.users5;