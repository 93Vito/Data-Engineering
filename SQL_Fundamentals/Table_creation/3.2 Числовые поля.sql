/* Создайте таблицу products для хранения информации о товарах в магазине.
Выберите оптимальные поля для хранения данных в соответствии с условиями:
id типа INT – только положительные числа;
name – символьный тип до 100 символов (включительно);
count – количество товара на складе (до 200 штук), целое положительное;
price – цена в рублях без копеек (не более 1 млн рублей) */
CREATE TABLE mysql.products4 (
     id INT UNSIGNED,
     name VARCHAR(100),
     count TINYINT UNSIGNED CHECK (count <=200), 
     price MEDIUMINT UNSIGNED CHECK (price <=1000000)
);
INSERT INTO mysql.products4 (id, name, count,price)
VALUES (1, 'Холодильник', 10, 50000),
       (2, 'Стиральная машина', 0, 23750),
       (3, 'Утюг', 3, 7300);
SELECT * FROM mysql.products4;

/* Создайте таблицу orders для хранения заказов в магазине.
Выберите оптимальные поля для хранения данных в соответствии с условиями:
id – тип INT. Только положительные числа.
product_id – для хранения номера товара. Только положительные числа от 0 до 4294967295.
sale – скидка. Целое положительное число от 0 до 100.
amount – сумма заказа. Денежный тип. Максимальная сумма заказа 999999.99 рублей */
CREATE TABLE mysql.orders4 (
     id INT UNSIGNED,
     product_id INT UNSIGNED,
     sale TINYINT UNSIGNED CHECK (sale BETWEEN 0 and 100),
     amount DECIMAL(8,2)
);
INSERT INTO mysql.orders4 (id, product_id, sale, amount)
VALUES (1, 245, 0, 230.5),
       (2, 17, 15, 999999.99),
       (3, 145677, 21, 1240.00);
SELECT * FROM mysql.orders4;

/* Создайте таблицу files для хранения информации о файлах.
Выберете оптимальные поля исходя из условий ниже:
id — типа INT, только положительные числа.
filename — текстовое поле длиной 255 символов для хранения имени файла.
size — целочисленное поле для хранения размера файла в байтах. Только положительные числа. Могут храниться данные до 100 Гб.
filetype — поле для хранения типа файла, строка до 3 символов */
CREATE TABLE mysql.files (
     id INT UNSIGNED,
     filename VARCHAR(255),
     size BIGINT,
     filetype VARCHAR(3)
);
INSERT INTO mysql.files (id, filename,size, filetype)
VALUES (1,'bigarchive.zip', 81604378624, 'zip'),
       (2, 'movie_37.mp4', 7838315315, 'mp4'),
       (3, 'music007.mp3', 5242880, 'mp3');
SELECT * FROM mysql.files;

/* Создайте таблицу films с информацией о фильмах.
Выберете оптимальные поля для хранения данных в соответствии с условиями:
id типа INT, только положительные числа.
name – символьное поле длиной 100.
rating – рейтинг, вещественное число. Принимает положительные значения от 0 до 10.
country – страна фильма. Символьное поле, содержащее ровно 2 символа */
CREATE TABLE mysql.films (
     id INT UNSIGNED,
     name VARCHAR(100),
     rating FLOAT CHECK (rating between 0 and 10),
     country CHAR(2)
);
INSERT INTO mysql.films (id, name, rating, country)
VALUES (1, 'Большая буря', 3.45, 'RU'),
       (2, 'Игра', 7.5714, 'US'),
       (3, 'Война', 10.0, 'RU');
SELECT * FROM mysql.films;
