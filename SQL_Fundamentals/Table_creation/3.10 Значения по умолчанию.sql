/* Создайте таблицу reviews с отзывами о компании Shultais Education:
id — идентификатор, целое положительное.
user_id — идентификатор пользователя, который оставил отзыв. Целое положительное, NULL запрещен.
date — дата и время оставления отзыва, NULL запрещен, по умолчанию должно проставляться время создания записи.
course — курс, для которого оставлен отзыв. Выбор из python, sql, all. Можно выбрать только один вариант. NULL запрещен. Значение по умолчанию — all.
text — текст отзыва, поле типа TEXT. NULL запрещен.
public — отметка о том является ли отзыв публичным. Логический тип, по умолчанию FALSE. NULL запрещен */
CREATE TABLE mysql.reviews (
     id INT UNSIGNED NOT NULL,
     user_id INT UNSIGNED NOT NULL,
     date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     course ENUM('python', 'sql', 'all') NOT NULL DEFAULT 'all',
     text TEXT NOT NULL,
     public BOOL NOT NULL DEFAULT FALSE
);
INSERT INTO mysql.reviews (id, user_id, date, course, text, public)
VALUES (1, 817, '2018-01-11 19:50:01', 'python','Это прекрасная возможность получить новые очки в программировании. Доступное объяснение позволяет без проблем изучить желаемый материал',TRUE),
       (2, 1289, '2018-02-16 08:55:11', 'python','Проект на мой взгляд отличный: 1. Короткие видеоролики без воды 2. Интересные задачи и практика 3. Очень быстрая обратная связь',TRUE),
       (3, 2914, '2018-03-19 12:56:12', 'all', '	Хорошая затея. Но проект ещё нуждается в развитии.',TRUE);
SELECT * FROM mysql.reviews;

/* Создайте таблицу logs для хранения логов посещения сайта:
date — время посещения в формате DATETIME, NULL запрещен, по умолчанию должно проставляться время создания записи.
browser — название браузера, строка до 500 символов. NULL запрещен, по умолчанию пустая строка.
is_bot — отметка о том является ли посетитель ботом или нет. Логический тип, по умолчанию FALSE. NULL запрещен */
CREATE TABLE mysql.logs (
     date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     browser VARCHAR(500) NOT NULL DEFAULT '',
     is_bot BOOL NOT NULL DEFAULT FALSE
);
INSERT INTO mysql.logs (date, browser, is_bot)
VALUES ('2018-03-19 19:50:01', 'Chrome 64.0.1.417', FALSE),
       ('2018-03-19 19:55:11', 'Firefox 55 (yandex bot)', TRUE),
       ('2018-03-19 19:56:12', 'Chrome 63.0.0.471', FALSE);
SELECT * FROM mysql.logs;

/* Создайте таблицу products для хранения товаров в интернет магазине:
id — идентификатор, целое положительное.
category_id — категория, целое положительное. Может принимать NULL. По умолчанию NULL.
name — название, строка до 100 символов. NULL запрещен.
count — количество, целое положительное до 255. NULL запрещен, по умолчанию 0.
price — цена типа DECIMAL с 10 знаками, 2 из которых выделены для копеек. NULL запрещен, по умолчанию 0.00 */
CREATE TABLE mysql.products9 (
     id INT UNSIGNED NOT NULL,
     category_id INT UNSIGNED NULL DEFAULT NULL,
     name VARCHAR(100) NOT NULL,
     count INT UNSIGNED CHECK (count<255) NOT NULL DEFAULT 0,
     price DECIMAL(10,2) NOT NULL DEFAULT 0.00
);
INSERT INTO mysql.products9 (id, category_id, name, count, price)
VALUES (1, 1, 'Кружка', 5, 45.90),
       (2, 17, 'Фломастеры', 0, 78.00),
       (3, NULL, 'Сникерс', 12, 50.80);
SELECT * FROM mysql.products9;

/* Создайте таблицу orders для хранения списка заказов:
id — идентификатор, целое положительное.
user_id — идентификатор пользователя, который оформил заказ. Целое положительное, NULL запрещен.
amount — стоимость заказа. Целое положительное число не более 1 млн. NULL запрещен, по умолчанию 0.
created — дата и время создания заказа. NULL запрещен.
state — статус заказа. Выбор из new, cancelled, in_progress, delivered, completed. Можно выбрать только один вариант. NULL запрещен. По умолчанию должен стоять new */
CREATE TABLE mysql.orders6 (
     id INT UNSIGNED NOT NULL,
     user_id INT UNSIGNED NOT NULL,
     amount INT UNSIGNED CHECK(amount<1000000) NOT NULL DEFAULT 0,
     created DATETIME NOT NULL,
     state ENUM('new', 'cancelled', 'in_progress', 'delivered', 'completed') NOT NULL DEFAULT 'new'
);
INSERT INTO mysql.orders6 (id, user_id, amount, created, state)
VALUES (1, 56, 5400, '2018-02-01 17:46:59', 'new'),
       (2, 90, 5400, '2018-02-01 19:13:04', 'new'),
       (3, 78, 5400, '2018-02-01 22:43:09', 'new');
SELECT * FROM mysql.orders6;

/* Создайте таблицу users для хранения списка пользователей сайта:
id — идентификатор, целое положительное.
first_name — имя, строка до 20 символов. NULL запрещен.
last_name — фамилия, строка до 20 символов. NULL запрещен.
patronymic — отчество, строка до 20 символов. NULL запрещен, по умолчанию пустая строка.
is_active — отметка об активности пользователя. Логическое поле, по умолчанию TRUE.
is_superuser — отметка администратора. Логическое поле, по умолчанию FALSE */
CREATE TABLE mysql.users8 (
     id INT UNSIGNED NOT NULL,
     first_name VARCHAR(20) NOT NULL,
     last_name VARCHAR(20) NOT NULL,
     patronymic VARCHAR(20) NOT NULL DEFAULT '',
     is_active BOOL DEFAULT TRUE,
     is_superuser BOOL DEFAULT FALSE
);
INSERT INTO mysql.users8 (id, first_name, last_name, patronymic, is_active, is_superuser)
VALUES (1, 'Дмитрий', 'Иванов', DEFAULT, TRUE , FALSE),
       (2, 'Анатолий', 'Белый', 'Сергеевич', TRUE , FALSE),
       (3, 'Андрей', 'Крючков', DEFAULT, TRUE , FALSE);
SELECT * FROM mysql.users8;