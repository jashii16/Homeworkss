create database if not exists library_db;
use library_db;


-- create table if not exists authors (
--     id int auto_increment primary key,
--     name varchar(100) not null,
--     country varchar(50)
-- );

-- create table if not exists books (
--     id int auto_increment primary key,
--     title varchar(150) not null,
--     author_id int not null,
--     genre varchar(30),
--     published_year int check (published_year >= 1500 and published_year <= 2026),
--     price decimal(6,2) check (price > 0),
--     pages int check (pages > 0),
--     copies int default 1 check (copies >= 0),
--     foreign key (author_id) references authors(id) on delete cascade
-- );

-- create table if not exists members (
--     id int auto_increment primary key,
--     first_name varchar(50) not null,
--     last_name varchar(50) not null,
--     email varchar(100) unique not null,
--     phone varchar(20),
--     city varchar(50) default 'tbilisi',
--     joined_on date default (current_date)
-- );

-- create table if not exists loans (
--     id int auto_increment primary key,
--     book_id int not null,
--     member_id int not null,
--     loan_date date not null,
--     return_date date,
--     foreign key (book_id) references books(id),
--     foreign key (member_id) references members(id),
--     check (return_date is null or return_date >= loan_date)
-- );

-- insert into authors (name, country) values
-- ('george orwell', 'united kingdom'),
-- ('j.k. rowling', 'united kingdom'),
-- ('j.r.r. tolkien', 'united kingdom'),
-- ('vaja-pshavela', 'georgia'),
-- ('jules verne', 'france'),
-- ('f. scott fitzgerald', 'united states');

-- insert into books (title, author_id, genre, published_year, price, pages, copies) values
-- ('1984', 1, 'dystopia', 1949, 25.00, 328, 4),
-- ('animal farm', 1, 'dystopia', 1945, 18.00, 112, 3),
-- ('harry potter and the philosopher''s stone', 2, 'fantasy', 1997, 30.00, 223, 5),
-- ('harry potter and the chamber of secrets', 2, 'fantasy', 1998, 28.00, 251, 3),
-- ('the lord of the rings 1', 3, 'fantasy', 1954, 32.50, 423, 2),
-- ('the lord of the rings 2', 3, 'fantasy', 1954, 32.50, 352, 2),
-- ('the lord of the rings 3', 3, 'fantasy', 1955, 32.50, 416, 2),
-- ('aluda ketelauri', 4, 'poetry', 1888, 8.00, 48, 3),
-- ('bakhtrioni', 4, 'poetry', 1892, 9.00, 64, 2),
-- ('twenty thousand leagues under the seas', 5, 'adventure', 1870, 22.00, 384, 3),
-- ('around the world in eighty days', 5, 'adventure', 1872, 19.00, 288, 3),
-- ('the mysterious island', 5, 'adventure', 1875, 24.00, 620, 2),
-- ('the great gatsby', 6, 'classic', 1925, 28.00, 218, 4),
-- ('the curious case of benjamin button', 6, 'novel', 1922, 12.00, 64, 2),
-- ('sherlock holmes', 1, 'detective', 1892, 15.00, 307, 1),
-- ('huckleberry finn', 5, 'novel', 1884, 14.00, 366, 1);

-- insert into members (first_name, last_name, email, phone, city, joined_on) values
-- ('nika', 'giorgadze', 'nika@gmail.com', '599111222', 'tbilisi', '2026-01-15'),
-- ('mariam', 'beridze', 'mariam@gmail.com', '599333444', 'tbilisi', '2026-02-01'),
-- ('giorgi', 'kapanadze', 'giorgi@gmail.com', null, 'rustavi', '2026-02-10'),
-- ('nino', 'chelidze', 'nino@gmail.com', '599555666', 'tbilisi', '2026-03-05'),
-- ('dato', 'maisuradze', 'dato@gmail.com', null, 'batumi', '2026-03-12'),
-- ('luka', 'shengelia', 'luka@gmail.com', '599777888', 'zugdidi', '2026-04-01'),
-- ('ana', 'beridze', 'ana@gmail.com', null, 'batumi', '2026-04-15'),
-- ('giorgi', 'kipiani', 'giorgik@gmail.com', '599999000', 'kutaisi', '2026-05-01');

-- insert into loans (book_id, member_id, loan_date, return_date) values
-- (1, 1, '2026-01-20', '2026-02-05'),
-- (3, 1, '2026-02-10', '2026-02-25'),
-- (8, 2, '2026-02-05', null),
-- (13, 3, '2026-02-15', null),
-- (10, 3, '2026-03-01', '2026-03-15'),
-- (4, 4, '2026-03-10', '2026-03-24'),
-- (1, 6, '2026-03-15', '2026-03-30'),
-- (2, 6, '2026-04-01', '2026-04-14');

-- task 13
update members 
set city = 'kutaisi' 
where first_name = 'dato' and last_name = 'maisuradze';

-- task 14
update loans 
set return_date = '2026-11-05' 
where id = 16;

-- task 15
delete from members 
where id not in (select distinct member_id from loans);

-- task 16
select title, pages 
from books;

-- task 17
select * 
from books 
where genre = 'fantasy';

-- task 18
select title, pages 
from books 
where pages > 400 
order by pages desc;

-- task 19
select first_name, city 
from members 
where city in ('tbilisi', 'kutaisi');

-- task 20
select title, published_year 
from books 
where published_year between 1900 and 1999;

-- task 21
select * 
from authors 
where name like 'j%';

select * 
from books 
where title like '%the%';

-- task 22
select * 
from members 
where phone is null;

-- task 23
select * 
from loans 
where return_date is null;

-- task 24
select title, price 
from books 
order by price asc 
limit 3;

-- task 25
select distinct genre 
from books 
order by genre asc;

-- task 26
select title, price, copies, (price * copies) as stock_value 
from books 
order by stock_value desc;

-- task 27
select concat(first_name, ' ', last_name) as full_name, joined_on 
from members 
where joined_on >= '2026-01-01' and joined_on <= '2026-12-31';

-- task 28
select count(*) as unique_books, sum(copies) as total_copies, round(avg(price), 2) as average_price 
from books;

-- task 29
select min(price) as cheapest_price, max(price) as highest_price, min(published_year) as oldest_year 
from books;

-- task 30
select genre, count(*) as book_count 
from books 
group by genre 
order by book_count desc;

-- task 31
select genre, round(avg(pages)) as avg_pages 
from books 
group by genre 
having avg(pages) > 250;

-- task 32
select city, count(*) as member_count 
from members 
group by city 
having count(*) >= 2;

-- task 33
select member_id, count(*) as loan_count 
from loans 
group by member_id 
order by loan_count desc;

-- task 34
select book_id, count(*) as borrow_count 
from loans 
group by book_id 
order by borrow_count desc 
limit 3;

-- task 35
select month(loan_date) as loan_month, count(*) as returned_loan_count 
from loans 
where return_date is not null and year(loan_date) = 2026 
group by month(loan_date) 
order by loan_month asc;

-- task 36
select title, price 
from books 
where price > (select avg(price) from books);

-- task 37
select title 
from books 
where author_id = (select id from authors where name = 'george orwell');

-- task 38
select first_name, last_name 
from members 
where id not in (select member_id from loans);

-- task 39
select title 
from books 
where id in (select book_id from loans where return_date is null);

-- task 40
select name 
from authors 
where id in (
    select author_id 
    from books 
    where id in (
        select book_id 
        from loans 
        where member_id in (
            select id 
            from members 
            where city = 'tbilisi'
        )
    )
);

-- bonus 1
select title 
from books 
where id = (
    select book_id 
    from loans 
    group by book_id 
    order by count(*) desc 
    limit 1
);

-- bonus 2
select genre, title, pages 
from books b1 
where pages = (
    select max(pages) 
    from books b2 
    where b2.genre = b1.genre
);
