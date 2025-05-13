/* Создаю таблицу rating */
CREATE TABLE mysql.rating (
     id INT,
     car_id INT,
     user_id INT,
     rating FLOAT
);
INSERT INTO mysql.rating (id, car_id, user_id, rating)
VALUES (1, 1, 1, 4.54),
       (2, 1, 2, 3.34),
       (3, 2, 3, 4.19),
       (4, 2, 11, 1.12);
SELECT * FROM mysql.rating;

/*Создайте таблицу orders с полем id типа INT, полем state для хранения статуса заказа
и полем amount для хранения суммы заказа. Статус заказа умещается в строку в 10 символов,
а сумма заказа имеет целочисленный тип данных */
CREATE TABLE mysql.orders3 (
     id INT,
     state VARCHAR(10),
     amount INT
);
INSERT INTO mysql.orders3 (id, state, amount)
VALUES (1, 'new', 10000),
       (2, 'new', 3400),
       (3, 'delivery', 7000);
SELECT * FROM mysql.orders3;

/* Создайте таблицу users с полем id типа INT и двумя текстовыми полями,
которые будут хранить имя (first_name) и фамилию (last_name). Длина имени и фамилии не превышает 50 символов */
CREATE TABLE mysql.users2 (
     id INT,
     first_name VARCHAR(50),
     last_name VARCHAR(50)
);
INSERT INTO mysql.users2 (id, first_name, last_name)
VALUES (1, 'Дмитрий', 'Иванов'),
       (2, 'Анатолий', 'Белый'),
       (3, 'Денис', 'Давыдов');
SELECT * FROM mysql.users2;

/* Создайте таблицу users с полем id типа INT и двумя строковыми полями,
которые будут хранить имя (first_name) и фамилию (last_name).
Длина имени не превышает 20 символов, а фамилии 50 символов.
Также добавьте в таблицу поле birthday типа DATE */
CREATE TABLE mysql.users3 (
     id INT,
     first_name VARCHAR(20),
     last_name VARCHAR(50),
     birthday DATE
);
INSERT INTO mysql.users3 (id, first_name, last_name, birthday)
VALUES (1, 'Дмитрий', 'Иванов', '1995-08-12'),
       (2, 'Анатолий', 'Белый', '1993-07-08'),
       (3, 'Денис', 'Давыдов', '1996-12-23');
SELECT * FROM mysql.users3;

/*Создайте таблицу messages. Добавьте в таблицу сообщение с темой «Первое сообщение» и текстом «Это мое первое сообщение!».
Дату установите 12 декабря 2016 года 14 часов, 16 минут. Сообщение должно быть публичным */
CREATE TABLE mysql.messages (
     id INT,
     subject VARCHAR(100),
     message TEXT,
     add_date DATETIME,
     is_public BOOL
);
INSERT INTO mysql.messages (id, subject, message, add_date, is_public)
VALUES (1, 'Первое сообщение', 'Это моё первое сообщение!', '2016-12-12 14:16:00', true);
SELECT * FROM mysql.messages;