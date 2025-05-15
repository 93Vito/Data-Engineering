/* Создайте таблицу users для хранения информации о пользователях
сайта.
В таблице должны быть следующие поля:
id – идентификатор, целое положительное;
email – адрес электронной почты, строка не более 100 символов;
date_joined – дата регистрации (достаточно хранить дату, без времени)
last_activity – дата и время последней активности (с точностью до секунд) */
CREATE TABLE mysql.users5 (
    id INT UNSIGNED,
    email VARCHAR(100),
    date_joined DATE,
    last_activity DATETIME
);
INSERT INTO mysql.users5 (id, email, date_joined, last_activity)
VALUES (1, 'user1@domain.com', '2014-12-12', '2016-04-08 12:34:54'),
       (2, 'user2@domain.com', '2014-12-12', '2017-02-13 11:46:53'),
       (3, 'user3@domain.com', '2014-12-13', '2017-04-04 05:12:07');
SELECT * FROM mysql.users5;

/* Создайте таблицу cars для хранения списка автомобилей
дилерского центра. Таблица должна содержать следующие поля:
id – идентификатор, целое положительное;
mark – марка автомобиля, строка до 20 символов;
model – модель автомобиля, строка до 20 символов;
year – год выпуска, используйте тип YEAR;
mileage – пробег, целое число от 0 до 100 000 */
CREATE TABLE mysql.cars4 (
     id INT UNSIGNED,
     mark VARCHAR(20),
     model VARCHAR(20),
     year YEAR,
     mileage INT CHECK (mileage between 0 and 100000)
);
INSERT INTO mysql.cars4 (id, mark, model, year, mileage)
VALUES (1,'Toyota', 'Camry', 2015, 32000),
       (2,'Mazda', 'CX-5', 2016, 17000),
       (3,'Nissan', 'Patrol', 2016, 60000);
SELECT * FROM mysql.cars4;

/* Создайте таблицу arrival для хранения времени прихода
сотрудников на работу. Добавьте в неё следующие поля:
id – идентификатор, целое положительное;
user_id – идентификатор пользователя, целое положительное;
a_date – дата прихода;
a_time – время прихода */
CREATE TABLE mysql.arrival (
     id INT UNSIGNED,
     user_id INT UNSIGNED,
     a_date DATE,
     a_time TIME
);
INSERT INTO mysql.arrival (id, user_id, a_date, a_time)
VALUES (1, 10, '2017-03-09', '08:45:41'),
       (2, 12, '2017-03-09', '08:46:12'),
       (3, 7, '2017-03-09', '08:53:01'),
       (4, 31, '2017-03-09', '09:01:17');
SELECT * FROM mysql.arrival;

/* Создайте таблицу temperature для хранения записей
о температуре. Добавьте в неё следующие поля:
id – идентификатор, целые положительные числа;
city_id – идентификатор города, целые положительные числа;
temperature – температура, целое число в диапазоне от -100 до 100 градусов.
wind_speed – целое положительное число для хранения скорости ветра. Историческая максимальная скорость ветра была 113 м/с.
mdate – дата и время измерения (с точностью до секунд) */
CREATE TABLE mysql.temperature (
     id INT UNSIGNED,
     city_id INT UNSIGNED,
     temperature TINYINT,
     wind_speed TINYINT UNSIGNED,
     mdate DATETIME
);
INSERT INTO mysql.temperature (id, city_id, temperature, wind_speed, mdate)
VALUES (1, 456, 17, 7, '2017-02-08 12:00:00'),
       (2, 456, 19, 6, '2017-02-08 12:10:00'),
       (3, 456, 20, 6, '2017-02-08 12:20:00'),
       (4, 471, -7, 12, '2017-02-08 12:20:01'),
       (5, 44, -43, 17, '2017-02-08 12:23:12');
SELECT * FROM mysql.temperature;

/*Выберите из таблицы cars все автомобили с пробегом
меньше 50 000, которые выпустили в 2016 году.
Результаты отсортируйте по пробегу */
CREATE TABLE mysql.cars5 (
     id INT UNSIGNED,
     mark VARCHAR(20),
     model VARCHAR(20),
     year YEAR,
     mileage INT UNSIGNED
);
INSERT INTO mysql.cars5 (id, mark, model, year, mileage)
VALUES (1, 'Toyota', 'Camry', 2015, 32000),
       (2, 'Mazda', 'CX-5', 2016, 17000),
       (3, 'Nissan', 'Patrol', 2016, 60000),
       (4, 'Toyota', 'Prius', 2015, 10000),
       (5, 'Mazda', 'Demio', 2003, 98000),
       (6, 'Nissan', 'Murano', 2016, 5000);
SELECT * FROM mysql.cars5
WHERE year=2016 and mileage <=50000
ORDER BY mileage ASC;

/* Создайте таблицу calendar для хранения календаря посетителей.
В таблице должны быть следующие поля:
id – идентификатор записи в календаре, целое положительное;
user_id – идентификатор пользователя, целое (INT) положительное;
doctor_id – идентификатор доктора, целое (INT) положительное;
visit_date – дата и время визита (точность до секунд) */
CREATE TABLE mysql.calendar (
     id INT UNSIGNED,
     user_id INT UNSIGNED,
     doctor_id INT UNSIGNED,
     visit_date DATETIME
);
INSERT INTO mysql.calendar (id, user_id, doctor_id, visit_date)
VALUES (1, 1914, 1, '2017-04-08 12:00:00'), 
       (2, 12, 1, '2017-04-08 12:30:00'), 
       (3, 4641, 2, '2017-04-09 09:00:00'), 
       (4, 784, 1, '2017-04-08 13:00:00'), 
       (5, 15, 2, '2017-04-09 10:00:00');
SELECT * FROM mysql.calendar;
 

 

 

