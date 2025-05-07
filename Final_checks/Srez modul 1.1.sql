/* Создаю таблицу с исходными данными */
create table mysql.books (              /* приходится менять название относительно исходного, т.к. возникает ошибка что база данных не выбрана */
BookID int primary key not null,
Title varchar(255) not null,
Author varchar(255) not null,
PublishedYear int not null,
Genre varchar(100),
Price decimal(10,2));
insert into mysql.books (BookID, Title, Author, PublishedYear, Genre, Price) values
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Fiction', 10.99),
(2, 'To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction', 8.99),
(3, '1984', 'George Orwell', 1949, 'Dystopian', 6.50),
(4, 'The Catcher in the Rye', 'J.D. Salinger', 1951, 'Fiction', 9.99),
(5, 'Brave New World', 'Aldous Huxley', 1932, 'Dystopian', 7.75),
(6, 'Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 1997, 'Fantasy', 12.50),
(7, 'The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy', 10.25),
(8, 'Fahrenheit 451', 'Ray Bradbury', 1953, 'Dystopian', 5.99),
(9, 'Moby Dick', 'Herman Melville', 1851, 'Adventure', 14.00),
(10, 'War and Peace', 'Leo Tolstoy', 1869, 'Historical', 14.50);
select * from mysql.books;

/* Получите все книги, которые относятся к жанрам "Dystopian" или "Fantasy",
и цена которых составляет меньше 10. Формат выходных данных: Title, Genre, Price */
select Title, Genre, Price from mysql.books
where (Genre='Dystopian' or Genre='Fantasy') and Price < 10; /*можно также использовать оператор in*/

/* Выведите список всех авторов и названий их книг в формате Автор, Название. Данные должны быть отсортированы в алфавитном порядке по автору,
и для авторов с одинаковым именем нужно отсортировать книги по году публикации (по возрастанию). (hint: contact function) */
Select  Author, Title from mysql.books
order by Author, PublishedYear asc; (вначале сортирует по первому параметру - для строковых это в автомате по алфавиту, и потому уже сортируется по году публикации */)

/* Получите список самых дорогих книг. Выведите только три книги с самыми высокими ценами */
Select * from mysql.books
order by price desc limit 3; /* сортируем по цене и показываем 3 самых дорогих */

/* Создайте сложный запрос, который:
•	Выводит только названия книг, опубликованных после 1950 года;
•	Отбирает данные для жанров "Fiction" и "Adventure";
•	Сортирует результат по убыванию цены */
Select title from mysql.books
where PublishedYear>1950 and Genre in('Fiction', 'Adventure') /*выполняем условие больше 1950 и чтобы относилось к одному из 2х жанров */
order by Price desc; /* выводим по убыванию цены */

/* Представьте, что поступила ошибка, и во всех названиях книг нужно заменить слово "and" (союз) на "&".
Например, Harry Potter and the Sorcerer's Stone должен быть изменён на Harry Potter & the Sorcerer's Stone. (hint: replace function) */

update mysql.books
set Title = replace(Title, 'and', '&');
Select title from mysql.books;

update mysql.books /* возвращаем к исходному виду */
set Title = replace(Title, '&', 'and');
Select title from mysql.books;

/* Найдите все книги, в названии которых содержится слово "and", и выведите их заголовок с заменой "and" на "&" 
(результат только в выводе, а не в самом изменении данных) */

select replace (Title, 'and', '&') as Modified_Title
FROM mysql.books
WHERE Title LIKE '%and%';

/*В таблице явно видно, что некоторые книги имеют цену меньше среднего (например, "Fahrenheit 451").
Напишите запрос, который выводит:
•	Названия книг с ценой ниже среднего значения по таблице.
•	Среднюю цену книг (подсчёт средних значений можно делать с помощью AVG) */

Select Title, (select avg(Price) from mysql.books) as Average_price from mysql.books
Where Price <(select avg(Price) from mysql.books);