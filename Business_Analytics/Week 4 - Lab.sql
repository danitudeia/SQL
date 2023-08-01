/*********AGGREGATION*****/
SELECT Market, SUM(MonthlyFee) AS 'Total Monthly Fee'
FROM Subscribers
GROUP BY Market

/************PARTITION*********/
SELECT Market, MonthlyFee,
SUM(MonthlyFee) OVER (PARTITION BY Market) AS 'Total Monthly Fee'
FROM Subscribers

/************SUBQUERY*********/
SELECT zc.stab,
SUM(is_pop_more_10000) as num_more_10000,
SUM(is_pop_less_10000) as num_less_10000,
SUM(is_pop_more_10000*totpop) as pop_more_10000,
SUM(is_pop_less_10000*totpop) as pop_less_10000,
SUM(totpop) AS 'Total Population'
FROM (SELECT zc.*,
(CASE WHEN totpop >= 10000 THEN 1 ELSE 0 END) as
is_pop_more_10000,
(CASE WHEN totpop < 10000 THEN 1 ELSE 0 END) as
is_pop_less_10000
FROM zipcensus zc
) zc
GROUP BY zc.stab

/************CTE*********/
WITH zc as
(SELECT zc.*, (CASE WHEN totpop >= 10000 THEN 1 ELSE 0 END) as
is_pop_more_10000,
(CASE WHEN totpop < 10000 THEN 1 ELSE 0 END) as is_pop_less_10000
FROM ZipCensus zc)
SELECT zc.stab,
SUM(is_pop_more_10000) as num_more_10000,
SUM(is_pop_less_10000) as num_less_10000,
SUM(is_pop_more_10000 * totpop) as pop_more_10000,
SUM(is_pop_less_10000 * totpop) as pop_less_10000,
sum(totpop) as 'Total Population'
FROM zc
GROUP BY zc.stab

/************STRINGS*********/
SELECT LEN(city) as length, COUNT(*) as numorders, MIN(city), MAX(city)
FROM orders
GROUP BY LEN(city)
ORDER BY lengthSELECT CITY FROM orders
WHERE LEN(CITY) IS NULL
Order by CITY

SELECT CITY FROM orders
WHERE LEN(CITY) = 2
Order by CITY


----CLEANING SPACES BEFORE AND AFTER THE COLUMNS DATA AND CHECKING IF WE HAVE NOT EQUAL LENGTH
SELECT COUNT(*) as [not equal length]
FROM orders
WHERE city IS NOT NULL AND LEN(city) <> LEN(LTRIM(RTRIM(city)))-----EXERCISESELECT LEN('     FLORIDA     ') AS TrimmedString
SELECT DATALENGTH('     FLORIDA     ')AS TrimmedString
SELECT DATALENGTH(TRIM ('      FLORIDA      '))AS TrimmedString
SELECT DATALENGTH(LTRIM ('     FLORIDA     '))AS TrimmedString
SELECT DATALENGTH(RTRIM ('     FLORIDA      '))AS TrimmedString


/************UPPER AND LOWER CASE*****/
SELECT SUM(CASE WHEN city = UPPER(city) THEN 1 ELSE 0 END) as uppers,
SUM(CASE WHEN city = LOWER(city) THEN 1 ELSE 0 END) as lowers,
SUM(CASE WHEN city NOT IN (LOWER(city), UPPER(city))
THEN 1 ELSE 0 END) as mixed
FROM orders

/************BRINGS THE FIRST CHARACTER AND BRINGS THEIR RESPECTIVE ASCII CODE*****/
SELECT left(city, 1) as onechar,
ASCII(left(city, 1)) as asciival,
COUNT(*) as [Number of times]
FROM orders
GROUP BY left(city, 1)
ORDER BY onechar

/*******COMPARING DATA FROM 2 COLUMNS*********/
SELECT State, AVG(TotalPrice) as avgtotalprice
FROM Orders
GROUP BY State
ORDER BY avgtotalprice DESC

SELECT TOP 1 STATE, COUNT(*) as [Number of AE Card Holders]
FROM Orders WHERE PaymentType='AE'
GROUP BY STATE
ORDER BY 'Number of AE Card Holders' DESC

SELECT State, COUNT(*) as numorders,
SUM(CASE WHEN PaymentType = 'AE' THEN 1 ELSE 0 END) as numae,
AVG(CASE WHEN PaymentType = 'AE' THEN 1.0 ELSE 0 END) as avgae
FROM Orders o
GROUP BY State
HAVING COUNT(*) >= 100
ORDER BY avgae DESC