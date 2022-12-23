create database information ;
use information ;
create table salespeople (snum int primary key,sname varchar(255) unique ,city varchar(255) not null, comm decimal(5,2)) ;



insert into salespeople(snum,sname,city,comm) 
values
(1001,'peel','london',.12),
(1002,'serres','sanjose',.13),
(1004,'Motika','london',.11),
(1007,'Rifkin ','Bercelona',.15),
(1003,'Axelrod','Newyork',.10) ;
select * from salespeople ;

create table customers (cnum int primary key,cname varchar(50) not null,city varchar(50),snum int,foreign key(snum) references salespeople(snum)) ;
INSERT INTO CUSTOMERS VALUES
(2001,  'Hoffman', 'London', 1001),

(2002,  'Giovanni', 'Rome', 1003),

(2003,  'Liu', 'Sanjose', 1002),

(2004,  'Grass', 'Berlin', 1002),

(2006, 'Clemens', 'London', 1001),

(2008, 'Cisneros', 'Sanjose', 1007),

(2007, 'Pereira', 'Rome', 1004);

select * from customers ;

CREATE TABLE ORDERS
(
ONUM INT PRIMARY KEY,
AMT FLOAT,
ODATE DATE,
CNUM INT,
SNUM INT,
FOREIGN KEY (CNUM) REFERENCES CUSTOMERS(CNUM),
FOREIGN KEY (SNUM) REFERENCES SALESPEOPLE(SNUM)
);
INSERT INTO ORDERS VALUES
(3001, 18.69, '1990-10-03', 2008 ,1007),
(3003, 767.19, '1990-10-03', 2001 ,1001 ),
(3002, 1900.10, '1990-10-03', 2007 ,1004),
(3005,  5160.45, '1990-10-03', 2003 ,1002),
(3006,  1098.16, '1990-10-03', 2008 ,1007),
(3009, 1713.23, '1990-10-03', 2002 ,1003),
(3007,  75.75, '1990-10-04', 2004 ,1002),
(3008,  4273.00, '1990-10-05', 2006 ,1001),
(3010, 1309.95, '1990-10-06', 2004 ,1002),
(3011,  9891.88, '1990-10-06', 2006 ,1001);

SELECT * FROM ORDERS;


# Count the number of Salesperson whose name begin with ‘a’/’A’.
SELECT COUNT(SNAME)
FROM SALESPEOPLE
WHERE SNAME LIKE 'a%' OR 'A%';

#  Display all the Salesperson whose all orders worth is more than Rs. 2000.
SELECT S.SNAME, O.AMT
FROM SALESPEOPLE S
LEFT JOIN ORDERS O
ON S.SNUM = O.SNUM
WHERE O.AMT > 2000
ORDER BY O.AMT;

#  Count the number of Salesperson belonging to Newyork.
SELECT COUNT(*) NYBASED
FROM SALESPEOPLE
WHERE CITY = 'NEWYORK';

#  Display the number of Salespeople belonging to London and belonging to Paris.
SELECT *
FROM SALESPEOPLE 
WHERE CITY= 'LONDON' OR CITY = 'PARIS';


# Display the number of orders taken by each Salesperson and their date of orders.
SELECT S.SNAME,O.ODATE,COUNT(O.ODATE) AS NO_OF_ORDERS
FROM SALESPEOPLE S
LEFT JOIN ORDERS O
ON S.SNUM = O.SNUM
GROUP BY S.SNAME, O.ODATE;







