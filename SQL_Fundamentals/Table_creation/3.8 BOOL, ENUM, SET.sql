/* Создайте таблицу rooms для хранения номеров в отеле:
id — идентификатор, целое положительное. NULL запрещен.
number — номер комнаты, целое положительное. Всего в отеле 107 комнат. NULL запрещен.
beds — количество спальных мест. Выбор из 1+1, 2+1, 2+2. Можно выбрать только один вариант. NULL запрещен.
additional — дополнительные удобства в номере. Можно выбрать несколько вариантов из списка: conditioner, bar, fridge и wifi */
CREATE TABLE mysql.rooms (
     id INT UNSIGNED NOT NULL,
     number INT UNSIGNED CHECK (number <107) Not NULL,
     beds ENUM('1+1', '2+1','2+2') NOT NULL,
     additional SET('conditioner', 'bar', 'fridge', 'wifi')
);
INSERT INTO mysql.rooms (id, number, beds, additional)
VALUES (1, 10, '1+1', 'conditioner,bar,wifi'),
       (2, 12, '2+1', ''),
       (3, 24, '2+2', 'fridge,bar,wifi');
SELECT * FROM mysql.rooms;

/* Создайте таблицу articles для хранения данных о статьях.
В таблице должны быть следующие поля:
id — идентификатор, целое положительное, NULL запрещен
name — название статьи, строка до 80 символов.
text — текст статьи.
state — статус статьи. Поле из 3 вариантов: draft (черновик), correction (корректура), public (опубликована) */
CREATE TABLE mysql.articles (
     id INT UNSIGNED NOT NULL,
     name VARCHAR(80),
     text TEXT,
     state ENUM('draft', 'correction', 'public')
);
INSERT INTO mysql.articles (id, name, text, state)
VALUES (1, 'Новое в Pethon 3.6', '', 'draft'),
       (2, 'Оптимизация SQL запросов', 'При больших объёмах данных ...', 'correction'),
       (3, 'Транзакции в MySQL', 'По долгу службы мне приходится ...', 'public');
SELECT * FROM mysql.articles;

/* Создайте таблицу orders для хранения заказов в интернет-магазине:
id — идентификатор, целое положительное.
user_id — идентификатор пользователя, который оформил заказ. Целое положительное, NULL запрещен.
amount — стоимость заказа. DECIMAL из 10 цифр, 2 цифры после десятичной точки.
created — дата и время создания заказа. NULL запрещен.
state — статус заказа. Выбор из new, cancelled, in_progress, delivered, completed. Можно выбрать только один вариант.
options — дополнительные опции заказа. Можно выбрать несколько вариантов из списка: pack, fitting, call и intercom */
CREATE TABLE mysql.orders5 (
     id INT UNSIGNED NOT NULL,
     user_id INT UNSIGNED NOT NULL,
     amount DECIMAL(10,2),
     created DATETIME NOT NULL,
     state ENUM('new', 'cancelled', 'in_progress', 'delivered', 'completed'),
     options SET('pack', 'fitting', 'call', 'intercom')
);
INSERT INTO mysql.orders5 (id, user_id, amount, created, state, options)
VALUES (456, 763, 14299.00, '2018-02-01 17:45:59', 'completed', 'pack,call'),
       (457, 1987, 249.50, '2018-02-01 18:23:04', 'delivered', 'pack,intercom'),
       (459, 78, 2300.12, '2018-02-01 22:12:09', 'in_progress', '');
SELECT * FROM mysql.orders5;

/* Получите id, имена, фамилии и дни рождения
всех пользователей у которых статус обработки персональных данных (pers_info)
не установлен или установлен в False. Данные отсортируйте по дате рождения */
CREATE TABLE mysql.users6 (
     id INT UNSIGNED NOT NULL,
     first_name VARCHAR(50) NULL,
     last_name VARCHAR(50) NULL,
     birthday DATE NULL,
     pers_info BOOL NULL
);
INSERT INTO mysql.users6 (id, first_name, last_name, birthday, pers_info)
VALUES (1, 'Дмитрий', 'Петров', '2000-03-14', TRUE),
       (2, 'Ольга', 'Антонова', '1999-12-01', FALSE),
       (3, 'Сергей', 'Васильев', '2002-02-20', NULL),
       (4, 'Констанин', 'Степаниденко', '2004-03-07', TRUE),
       (5, 'Алена', 'Шикова', '1999-08-17', TRUE),
       (6, 'Василина', 'Парамонова', '2000-10-10', FALSE),
       (7, 'Александр', 'Пузаков', '2002-02-22', NULL),
       (8, 'Алина', 'Антонова', '2002-01-01', FALSE);
SELECT id, first_name, last_name, birthday FROM mysql.users6
WHERE pers_info=0 OR pers_info IS NULL
ORDER BY birthday;

/*Получите из таблицы cars информацию обо всех японских автомобилях марки Nissan с 2010 по 2016 годы включительно.
Выбирайте только непроданные автомобили дилеров. Отметка об успешной продаже находится в поле sold,
а информация о дилерах в поле dealer_id. Выведите только марку, модель, год и мощность автомобиля. Данные отсортируйте по мощности */
CREATE TABLE mysql.cars6 (
    id INT UNSIGNED NOT NULL,
    dealer_id INT UNSIGNED NULL,
    mark VARCHAR(30) NULL,
    model VARCHAR(30) NULL,
    year INT NULL,
    country VARCHAR(2) NULL,
    power INT NULL,
    sold BOOL
);
INSERT INTO mysql.cars6 (id, dealer_id, mark, model, year, country, power, sold)
VALUES (1, 1, 'Toyota', 'Camry', 2012, 'JP', 139, FALSE),
       (2, 23, 'Mazda', 'Demio', 2004, 'JP', 113, FALSE),
       (3, 7, 'ВАЗ', '2110', 2010, 'RU', 79, TRUE),
       (4, NULL, 'Nissan', 'Almera', 2016, 'JP', 130, FALSE),
       (5, 1, 'Nissan', 'Patrol', 2014, 'JP', 200, FALSE),
       (6, 23, 'Reno', 'Logan', 2009, 'FR', 87, TRUE),
       (7, 7, 'Lada', 'Priora', 2017, 'RU', 78, FALSE),
       (8, 67, 'Reno', 'Duster', 2011, 'FR', 143, FALSE),
       (9, 13, 'Hyundai', 'Solaris', 2010, 'KR', 98, FALSE),
       (10, 5, 'Nissan', 'Juke', 2016, 'JP', 120, FALSE),
       (11, 2, 'Reno', 'Logan', 2011, 'FR', 90, FALSE),
       (12, NULL, 'Nissan', 'Sunny', 1990, 'JP', 67, FALSE),
       (13, 1, 'Nissan', 'Juke', 2012, 'JP', 125, TRUE),
       (14, 5, 'Nissan', 'Juke', 2009, 'JP', 120, FALSE),
       (15, 23, 'Nissan', 'Almera', 2017, 'JP', 113, FALSE),
       (16, 5, 'Nissan', 'Juke', 2013, 'RU', 125, FALSE);
SELECT mark, model,year, power FROM mysql.cars6
WHERE country='JP' AND year BETWEEN 2010 AND 2016 AND dealer_id IS NOT NULL AND sold=0
ORDER BY power;

/* В таблице users содержится информация о сотрудниках компании.
Выберите из неё имена, фамилии, дни рождения и роли всех менеджеров мужского пола,
которые в данный момент работают (положительное поле active).
Данные отсортируйте сперва по фамилии, а затем по имени.
Поле roles относится к типу SET('programmer', 'designer', 'manager', 'marketer') NOT NULL */
CREATE TABLE mysql.users7 (
     id INT UNSIGNED NOT NULL,
     first_name VARCHAR(50) NULL,
     last_name VARCHAR(50) NULL,
     birthday DATE NOT NULL,
     active BOOL NULL,
     sex ENUM('w', 'm') NOT NULL,
     roles SET('programmer', 'designer', 'manager', 'marketer') NOT NULL
);
INSERT INTO mysql.users7 (id, first_name, last_name, birthday, active, sex, roles)
VALUES (1, 'Дмитрий', 'Федьков', '2000-01-02', True, 'm', 'manager'),
       (2, 'Светлана', 'Иванова', '1999-03-02', True, 'w', 'designer'),
       (3, 'Никита', 'Трутнев', '2000-08-08', True, 'm', 'programmer'),
       (4, 'Денис', 'Кац', '2000-08-09', True, 'm', 'programmer,manager'),
       (5, 'Алена', 'Сорокина', '2001-01-02', True, 'w', 'designer'),
       (6, 'Василий', 'Федьков', '2001-01-01', False, 'm', 'manager'),
       (7, 'Ярослав', 'Сорокин', '2000-08-01', True, 'm', 'manager,designer'),
       (8, 'Денис', 'Белый', '2000-12-09', True, 'm', 'designer'),
       (9, 'Анатолий', 'Дейчман', '1998-08-08', True, 'm', 'programmer'),
       (10, 'Юлия', 'Фёдорова', '2002-08-08', False, 'w', 'marketer'),
       (11, 'Анастасия', 'Литвинова', '1991-06-01', True, 'w', 'manager');
SELECT first_name, last_name, birthday, roles FROM mysql.users7
WHERE sex='m' AND active=1
ORDER BY last_name, first_name;

/*Выберите из таблицы products название, цену и страны всех товаров из России и Белоруссии
(в поле country обязательно должна присутствовать или Россия, или Белоруссия).
Выбирайте только товары, у которых задана категория. Данные отсортируйте по цене в обратном порядке.
Поле country относится к типу SET('RU', 'UA', 'BY', 'KZ') NOT NULL */
CREATE TABLE mysql.products7 (
    id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NULL,
    name VARCHAR(50) NULL,
    count INT NULL,
    price INT NULL,
    country SET('RU', 'UA', 'BY', 'KZ') NOT NULL
);
INSERT INTO mysql.products7 (id, category_id, name, count, price, country)
VALUES (1, 7, 'Стиральная машина', 5, 10000, 'RU,UA'),
       (2, 12, 'Холодильник', 0, 11000, 'BY'),
       (3, 12, 'Микроволновка', 3, 4000, 'UA,KZ'),
       (4, 8, 'Пылесос', 2, 4500, 'KZ,BY'),
       (5, NULL, 'Вентилятор', 0, 700, 'BY,RU'),
       (6, 9, 'Телевизор', 7, 31740, 'RU'),
       (7, 12, 'Тостер', 0, 2500, 'RU'),
       (8, NULL, 'Принтер', 4, 3000, 'UA,BY'),
       (9, NULL, 'Активные колонки', 1, 2900, 'UA');
SELECT name, price, country FROM mysql.products7
WHERE category_id IS NOT NULL AND (FIND_IN_SET ('RU',country) OR FIND_IN_SET ('BY',country))
ORDER BY price DESC;

/* Выберите из таблицы products название, цену и страну всех товаров из России и Украины.
Выбирайте только товары, которые есть в наличии.
Данные отсортируйте сперва по стране, а после по цене.
Поле country относится к типу ENUM('RU', 'UA', 'BY', 'KZ') NOT NULL */
CREATE TABLE mysql.products8 (
    id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NULL,
    name VARCHAR(50) NULL,
    count INT NULL,
    price INT NULL,
    country ENUM('RU', 'UA', 'BY', 'KZ') NOT NULL
);
INSERT INTO mysql.products8 (id, category_id, name, count, price, country)
VALUES (1, 7, 'Стиральная машина', 5, 10000, 'RU'),
       (2, 12, 'Холодильник', 0, 11000, 'BY'),
       (3, 12, 'Микроволновка', 3, 4000, 'UA'),
       (4, 8, 'Пылесос', 2, 4500, 'KZ'),
       (5, NULL, 'Вентилятор', 0, 700, 'BY'),
       (6, 9, 'Телевизор', 7, 31740, 'RU'),
       (7, 12, 'Тостер', 0, 2500, 'RU'),
       (8, NULL, 'Принтер', 4, 3000, 'UA'),
       (9, NULL, 'Активные колонки', 1, 2900, 'UA');
SELECT name, price, country FROM mysql.products8
WHERE count>0 AND country IN('RU','UA') 
ORDER BY country, price;