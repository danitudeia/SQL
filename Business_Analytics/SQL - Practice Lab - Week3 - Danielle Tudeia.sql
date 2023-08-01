--This script will guide you how to bulk Insert data from CSV file

USE SQLBook
CREATE TABLE CEOs
(
    company varchar(30) NOT NULL,
	continent varchar(30) NOT NULL,
	ceo varchar(30) NOT NULL
	
)
GO
BULK INSERT CEOs
FROM 'C:\Users\Danielle\Downloads\ceos.csv' --Change this location as  appropriate for you
WITH
(
    FIRSTROW = 2,
	FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'

)
GO

SELECT * FROM CEOs
--drop table CEOs

CREATE TABLE CTOs
(
    company varchar(30) NOT NULL,
	continent varchar(30) NOT NULL,
	cto varchar(30) NOT NULL
	
)
GO
BULK INSERT CTOs
FROM 'C:\Users\Danielle\Downloads\ctos.csv' --Change this location as  appropriate for you
WITH
(
    FIRSTROW = 2,
	FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'

)
GO
SELECT * FROM CTOs
--drop table CTOs

CREATE TABLE Presidents
(
    company varchar(30) NOT NULL,
	continent varchar(30) NOT NULL,
	president varchar(30) NOT NULL
	
)
GO
BULK INSERT Presidents
FROM 'C:\Users\Danielle\Downloads\presidents.csv' --Change this location as  appropriate for you
WITH
(
    FIRSTROW = 2,
	FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'

)
GO
SELECT * FROM Presidents
--drop table Presidents

CREATE TABLE Companies
(
    company varchar(30) NOT NULL,
	continent varchar(30) NOT NULL, 
	est_year int,
		
)
GO
BULK INSERT Companies
FROM 'C:\Users\Danielle\Downloads\companies.csv' --Change this location as  appropriate for you
WITH
(
    FIRSTROW = 2,
	FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'

)
GO
SELECT * FROM Companies
--drop table Companies
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*********EXERCISE 1********/

SELECT 
	ceo
	,company
FROM CEOs
ORDER BY company asc

/*********EXERCISE 2********/

SELECT 
	cto
	,company
FROM CTOs
ORDER BY company asc

/*********EXERCISE 3********/

SELECT 
	CASE WHEN cto = 'Roy' THEN cto
	WHEN cto = 'Kif' THEN cto
	WHEN cto = 'Harrison' THEN cto
	WHEN cto = 'Philip'	THEN cto
	ELSE NULL END cto
	,company
FROM CTOs

/*********EXERCISE 4********/

SELECT 
	ceo AS leader
	,company
FROM CEOs
UNION
SELECT
	cto AS leader
	,company
FROM CTOs
ORDER BY company asc

/*********EXERCISE 5********/

SELECT 
	ceo AS leader
	,company
FROM CEOs
UNION ALL
SELECT
	cto AS leader
	,company
FROM CTOs
ORDER BY company asc

/*********EXERCISE 6********/

SELECT 
	ceo AS leader
	,company
FROM CEOs
INTERSECT
SELECT
	cto AS leader
	,company
FROM CTOs
ORDER BY company asc

/*********EXERCISE 7********/

SELECT 
	ceo AS leader
	,company
FROM CEOs
EXCEPT
SELECT
	cto AS leader
	,company
FROM CTOs
ORDER BY company asc

/*********EXERCISE 8********/

SELECT 
	CASE WHEN ceo = 'John' THEN ceo
	WHEN ceo = 'Francis' THEN ceo
	WHEN ceo = 'Xuan' THEN ceo
	WHEN ceo = 'Jack' THEN ceo
	WHEN ceo = 'Sameer'	THEN ceo
	WHEN ceo = 'Marshal' THEN ceo
	WHEN ceo = 'Solesberg'	THEN ceo
	WHEN ceo = 'Roy' THEN ceo
	WHEN ceo = 'Kif'	THEN ceo
	WHEN ceo = 'Ramos'	THEN ceo
	ELSE NULL END leader
	,company
FROM CEOs

/*********EXERCISE 9********/

SELECT 
	cto AS leader
	,company
FROM CTOs
WHERE cto in ('Harrison','Philip')

/*********EXERCISE 10********/

SELECT 
	cto as leader
	,company
FROM CTOs

/*********EXERCISE 11********/
SELECT *
	,CASE WHEN est_year < '1900' THEN 'before 1900'
	WHEN est_year >= '1900' AND est_year <= '1930' THEN 'between 1900 and 1930'
	WHEN est_year > '1930' THEN 'after 1930' 
	ELSE NULL END est_year_group
FROM Companies
ORDER BY CASE WHEN est_year < '1900' THEN 'before 1900'
	WHEN est_year >= '1900' AND est_year <= '1930' THEN 'between 1900 and 1930'
	WHEN est_year > '1930' THEN 'after 1930' 
	ELSE NULL END ASC

/*********EXERCISE 12********/
SELECT * 
FROM CTOs 
CROSS JOIN CEOs 

/*********EXERCISE 13********/
SELECT TOP 18
	cust.*
	,cust2.*
FROM customers cust
LEFT JOIN customers cust2
ON cust.customerid = cust2.customerid

/*********EXERCISE 14********/
SELECT TOP 12
	ord.customerid as CustomerID
	,cust.firstname AS FirstName
	,ord.orderdate AS OrderDate
	,ord.totalprice AS TotalPrice
FROM orders AS ord
INNER JOIN customers AS cust
ON ord.customerid = cust.customerid

/*********EXERCISE 15********/
SELECT *
FROM orders
WHERE orderid = '999992'

SELECT *
FROM customers
WHERE customerid = '107237'

/*********EXERCISE 16********/
SELECT TOP 19
	ord.customerid as CustomerID
	,cust.firstname AS FirstName
	,CONVERT(DATE,ord.orderdate) AS OrderDate
	,ord.totalprice AS TotalPrice
FROM orders AS ord
INNER JOIN customers AS cust
ON ord.customerid = cust.customerid
WHERE ord.orderdate >= '2015-09-24'


/*********EXERCISE 17********/

CREATE TABLE Clients (ClientID CHAR(4), ClientName CHAR(15) NOT NULL);
INSERT INTO Clients VALUES('0001', 'John');
INSERT INTO Clients VALUES('0002', 'Richard');
INSERT INTO Clients VALUES('0003','Henry');

CREATE TABLE OrderSystem (OrderID CHAR(6), ClientID CHAR(4) NOT NULL, OrderDate DATE NOT NULL);
INSERT INTO OrderSystem VALUES('000001', '0001', '2021-01-01');
INSERT INTO OrderSystem VALUES('000002', '0003', '2021-01-02');
INSERT INTO OrderSystem VALUES('000003', 'NULL',  '2021-01-03');

SELECT * FROM Clients
SELECT * FROM OrderSystem

/*********EXERCISE 18********/
SELECT
	cli.ClientID
	,cli.ClientName
	,ord.OrderID
	,ord.OrderDate
FROM Clients AS cli
INNER JOIN OrderSystem AS ord
ON cli.ClientID = ord.ClientID

/*********EXERCISE 19********/
SELECT
	cli.ClientID
	,cli.ClientName
	,ord.OrderID
	,ord.OrderDate
FROM Clients AS cli
LEFT JOIN OrderSystem AS ord
ON cli.ClientID = ord.ClientID

/*********EXERCISE 20********/
SELECT
	cli.ClientID
	,cli.ClientName
	,ord.OrderID
	,ord.OrderDate
FROM Clients AS cli
RIGHT JOIN OrderSystem AS ord
ON cli.ClientID = ord.ClientID
