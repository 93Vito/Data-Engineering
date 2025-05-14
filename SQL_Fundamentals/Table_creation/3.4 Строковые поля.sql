/* Создайте таблицу users , в которой будут следующие поля:
id — идентификатор, целые положительные числа.
first_name— имя, строки до 50 символов.
last_name — фамилия, строки до 60 символов.
bio — биография, текст до 65000 символов */
CREATE TABLE mysql.users4 (
     id INT UNSIGNED,
     first_name VARCHAR(50),
     last_name VARCHAR(60),
     bio TEXT
);
INSERT INTO mysql.users4 (id, first_name, last_name, bio)
VALUES (1, 'Антон', 'Кулик', 'С отличием окончил 39 лицей.'),
       (2, 'Сергей', 'Давыдов', ''),
       (3, 'Дмитрий', 'Соколов', 'Профессиональный программист.');
SELECT * FROM mysql.users4;

/* Создайте таблицу apartments для хранения информации о квартирах на сайте жилищного комплекса.
В таблице должны быть следующие поля:
id — идентификатор, целое положительное.
image — поле для хранения пути до изображения, строка не более 100 символов.
price — цена не более 99 999 999. Целое положительное число.
square — площадь квартиры. Не более 150 квадратных метров. Целое положительное число */
CREATE TABLE mysql.apartments (
     id INT UNSIGNED,
     image VARCHAR(100),
     price INT UNSIGNED CHECK (price <=99999999),
     square SMALLINT UNSIGNED CHECK (square <=150)
);
INSERT INTO mysql.apartments (id, image, price, square)
VALUES (1, '/apartments/1/cover.jpg', 5250000, 90),
       (2, '/apartments/2/cover.jpg', 7500000, 103),
       (3, '', 2300000, 56);
SELECT * FROM mysql.apartments;

/* Создайте таблицу books для хранения данных о книгах.
В таблице должны быть следующие поля:
id – идентификатор, целое положительное.
name – название, строка длиной не более 100 символов.
description – описание книги длиной не более 1000 символов.
isbn – международный стандартный книжный номер. 10 или 13 знаков */
CREATE TABLE mysql.books1 (
     id INT UNSIGNED,
     name VARCHAR(100),
     description VARCHAR(1000),
     isbn BIGINT
);
INSERT INTO mysql.books1 (id, name, description, isbn)
VALUES (1, 'MySQL 5', 'Хорошая книга.', 5941579284),
       (2, 'Изучаем SQL', 'Полезная книга.', 5932860510),
       (3, 'Изучаем Python. 4-е издание', 'Подробная книга о Python', 9785932861592);
SELECT * FROM mysql.books1;

/* Получите из таблицы cars информацию обо всех автомобилях марки Nissan
младше 1990 года и мощностью более 120 лошадиных сил */
CREATE TABLE mysql.cars2 (
     id INT UNSIGNED,
     mark VARCHAR(255),
     model VARCHAR(255),
     year INT,
     country VARCHAR(2),
     power INT
);
INSERT INTO mysql.cars2 (id, mark, model, year, country, power)
VALUES (1, 'Toyota', 'Camry', 2012, 'JP', 139),
       (2, 'Mazda', 'Demio', 2004, 'JP', 113),
       (3, 'ВАЗ', '2110', 2010, 'RU', 79),
       (4, 'Nissan', 'Almera', 2016, 'JP', 130),
       (5, 'Nissan', 'Juke', 2016, 'JP', 120),
       (6, 'Reno', 'Logan', 2009, 'FR', 87),
       (7, 'Lada', 'Priora', 2017, 'RU', 78),
       (8, 'Reno', 'Duster', 2011, 'FR', 143),
       (9, 'Hyundai', 'Solaris', 2010, 'KR', 98),
       (10, 'Nissan', 'Patrol', 2014, 'JP', 200),
       (11, 'Reno', 'Logan', 2011, 'FR', 90),
       (12, 'Nissan', 'Sunny', 1990, 'JP', 67),
       (13, 'Reno', 'Dust', 2012, 'FR', 130),
       (14, 'Nissan', 'Sunny', 1989, 'JP', 140);
SELECT * FROM mysql.cars2
WHERE mark='Nissan' AND year >=1990 AND power >=120;

На сайте действует следующая система: сперва сотрудник заносит в таблицу URL-адрес фотографии в интернете, а после скрипт на языке Python скачивает файл из сети на жесткий диск и добавляет в эту же таблицу путь до него.

/* Создайте таблицу files, которая поможет сотруднику и скрипту выполнить свои задачи.
Таблица должна содержать следующие поля:
id — целое положительное
file_url — url файла, строка длиной до 500 символов.
file_path — путь до файла на жестком диске, строка до 200 символов.
size — размер скачанного файла в байтах, целое положительное. Размер файла может достигать 100 Гб */
CREATE TABLE mysql.files1 (
     id INT UNSIGNED,
     file_url VARCHAR(500),
     file_path VARCHAR(200),
     size BIGINT UNSIGNED
);
INSERT INTO mysql.files1 (id, file_url, file_path, size)
VALUES (1,'http://archives.com/archives/big_archive.zip','files/2018/02/archive.zip	',81604378624),
       (2,'http://movies.com/movies/movie.mp4','',0),
       (3,'http://movies.com/best-songs/song.mp3','	files/2018/03/song.mp3',5242880);
SELECT * FROM mysql.files1;

/* Получите из таблицы cars информацию обо всех японских автомобилях, а также об автомобилях марки Peugeot.
Выведите только марку, модель и год выпуска. Данные отсортируйте по году в обратном порядке */
CREATE TABLE mysql.cars3 (
     id INT UNSIGNED,
     mark VARCHAR(255),
     model VARCHAR(255),
     year INT,
     country VARCHAR(2),
     power INT
);
INSERT INTO mysql.cars3 (id, mark, model, year, country, power)
VALUES (1, 'Toyota', 'Camry', 2012, 'JP', 139),
       (2, 'Mazda', 'Demio', 2004, 'JP', 113),
       (3, 'ВАЗ', '2110', 2010, 'RU', 79),
       (4, 'Nissan', 'Almera', 2016, 'JP', 130),
       (5, 'Nissan', 'Juke', 2016, 'JP', 120),
       (6, 'Renault', 'Logan', 2009, 'FR', 87),
       (7, 'Peugeot', '3008', 2016, 'FR', 150),
       (8, 'Renault', 'Duster', 2011, 'FR', 143),
       (9, 'Hyundai', 'Solaris', 2010, 'KR', 98),
       (10, 'Nissan', 'Patrol', 2014, 'JP', 200),
       (11, 'Renault', 'Logan', 2011, 'FR', 90),
       (12, 'Nissan', 'Sunny', 1990, 'JP', 67),
       (13, 'Peugeot', '307', 2003, 'FR', 110);
SELECT mark, model, year FROM mysql.cars3
WHERE country='JP' OR mark='Peugeot'
ORDER BY year DESC;
