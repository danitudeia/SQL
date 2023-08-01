/***********QUESTION 1**********/
SELECT
	cus.firstname as FirstName
	,cus.gender
	,ord.zipcode
	,zc.Longitude
	,zc.Latitude
FROM (SELECT * 
		FROM Customers 
		WHERE FirstName is not null and FirstName <> '') AS cus
INNER JOIN orders as ord
ON cus.customerid = ord.customerid
INNER JOIN ZipCensus AS zc
ON ord.zipcode = zc.zcta5

/***********QUESTION 2**********/
SELECT
	YEAR(orderdate) AS yearly
	,COUNT(*) Distribution
FROM orders as ord
WHERE YEAR(orderdate) > '2010'
GROUP BY YEAR(orderdate) 
ORDER BY YEAR(orderdate) ASC

/***********QUESTION 3**********/
SELECT
	YEAR(orderdate) AS yearly
	,SUM(numunits) AS NumofUnits
	,COUNT(*) Distribution
FROM orders as ord
WHERE YEAR(orderdate) > '2010'
GROUP BY YEAR(orderdate) 
ORDER BY YEAR(orderdate) ASC

/***********QUESTION 4**********/
SELECT
	YEAR(orderdate) AS yearly
	,SUM(CASE WHEN cus.gender = 'M' THEN 1 ELSE 0 END) AS male_count
	,SUM(CASE WHEN cus.gender = 'F' THEN 1 ELSE 0 END) AS female_count
FROM orders AS ord
INNER JOIN Customers AS cus
ON cus.customerid = ord.customerid
WHERE YEAR(orderdate) > '2010'
GROUP BY YEAR(orderdate) 
ORDER BY YEAR(orderdate) ASC

/***********QUESTION 5**********/
SELECT
	TOP 20
	zcta5
	,SUM(TotPop) AS TotPop
	,Latitude
	,Longitude
FROM ZipCensus
GROUP BY zcta5
	,Latitude
	,Longitude
ORDER BY SUM(TotPop) DESC

/***********QUESTION 6**********/
SELECT
	ord.ZipCode
FROM orders AS ord
LEFT JOIN ZipCensus AS zc
ON ord.zipcode = zc.zcta5
WHERE zc.zcta5 is NULL
GROUP BY ord.ZipCode
ORDER BY ZipCode ASC

SELECT ZipCode
FROM orders
EXCEPT
SELECT zcta5
FROM ZipCensus
ORDER BY ZipCode ASC