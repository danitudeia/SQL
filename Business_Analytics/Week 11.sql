-------Q1-----------
SELECT 
	DATEDIFF(day, o.OrderDate, ol.billDate) AS days
	,COUNT(*) AS numol 
FROM Orders o 
JOIN OrderLines ol 
ON o.OrderId = ol.OrderId 
GROUP BY DATEDIFF(day, o.OrderDate, ol.billDate) 
ORDER BY days

-----------Q2-----------
SELECT 
	DATEPART(WEEK, OrderDate) AS Week
	,COUNT(*) AS numol 
	,COUNT(DISTINCT customerid) AS numcust
	,SUM(Totalprice) AS Totalprice
FROM Orders 
WHERE YEAR(OrderDate) = '2011'
GROUP BY DATEPART(WEEK, OrderDate) 
ORDER BY DATEPART(WEEK, OrderDate)

-----------Q3-----------
SELECT 
	DATEPART(DAYOFYEAR, OrderDate) AS DAY
	,COUNT(*) AS numol 
	,COUNT(DISTINCT customerid) AS numcust
	,SUM(Totalprice) AS Totalprice
FROM Orders 
WHERE OrderDate >='2012-01-01' AND OrderDate <'2012-07-01'
GROUP BY DATEPART(DAYOFYEAR, OrderDate) 
ORDER BY DATEPART(DAYOFYEAR, OrderDate)

-----------Q4-----------
SELECT 
	DATEPART(WEEK,StartDate) AS WEEK
	,SUM(CASE WHEN YEAR(StartDate) = '2004' THEN 1 ELSE 0 END) [2004]
	,SUM(CASE WHEN YEAR(StartDate) = '2005' THEN 1 ELSE 0 END) [2005]
	,SUM(CASE WHEN YEAR(StartDate) = '2006' THEN 1 ELSE 0 END) [2006]
FROM Subscribers
WHERE YEAR(StartDate) IN ('2004','2005','2006')
GROUP BY DATEPART(WEEK,StartDate) 
ORDER BY DATEPART(WEEK,StartDate) 

-----------Q5-----------
SELECT 
	DATEPART(QUARTER, billDate) AS QUARTER
	,SUM(TotalPrice) TotalPrice
FROM OrderLines 
GROUP BY DATEPART(QUARTER, billDate)
ORDER BY DATEPART(QUARTER, billDate)

-----------Q6-----------
SELECT 
	firstname
	,gender
	,COUNT(DISTINCT customerid) num_cust
FROM customers
WHERE gender IN ('F','M') AND SUBSTRING(firstname, 2,2) <> '. '
GROUP BY firstname
	,gender

-----------Q7-----------
SELECT TOP 10
	o.state
	,CASE WHEN cust.gender = 'M' THEN 'Male'
	WHEN cust.gender = 'F' THEN 'Female' ELSE 'Unknown' END gender
	,COUNT(DISTINCT cust.customerid) num_cust
FROM customers cust
INNER JOIN orders o
ON cust.customerid = o.customerid
GROUP BY o.state
	,CASE WHEN cust.gender = 'M' THEN 'Male'
	WHEN cust.gender = 'F' THEN 'Female' ELSE 'Unknown' END
ORDER BY COUNT(DISTINCT cust.customerid) DESC
-------------
SELECT  
ct.state
,cust.num_cust
,cust.gender
FROM (SELECT o.state
		,CASE WHEN cust.gender = 'M' THEN 'Male'
		WHEN cust.gender = 'F' THEN 'Female' ELSE 'Unknown' END gender
		,COUNT(DISTINCT cust.customerid) num_cust
		FROM customers cust
		INNER JOIN orders o
		ON cust.customerid = o.customerid
		GROUP BY o.state
		,CASE WHEN cust.gender = 'M' THEN 'Male'
		WHEN cust.gender = 'F' THEN 'Female' ELSE 'Unknown' END) cust
INNER JOIN (SELECT TOP 10  o.state, COUNT(DISTINCT cust.customerid) num_cust
			FROM customers cust
			INNER JOIN orders o
			ON cust.customerid = o.customerid
			GROUP BY o.state
			ORDER BY COUNT(DISTINCT cust.customerid) DESC) ct
ON ct.state = cust.state
ORDER BY ct.state


-----------Q8-----------
SELECT
	CASE WHEN cust.gender = 'M' THEN 'Male'
	WHEN cust.gender = 'F' THEN 'Female' ELSE 'Unknown' END gender
	,AVG(o.numunits) AS num_units
	,AVG(o.TotalPrice) AS TotalPrice
FROM customers cust
INNER JOIN orders o
ON cust.customerid = o.customerid
GROUP BY CASE WHEN cust.gender = 'M' THEN 'Male'
	WHEN cust.gender = 'F' THEN 'Female' ELSE 'Unknown' END

-----------Q9-----------

SELECT
	CASE WHEN cust.gender = 'M' THEN 'Male'
	WHEN cust.gender = 'F' THEN 'Female' ELSE 'Unknown' END gender
	,YEAR(orderdate) as Year
	,COUNT(DISTINCT cust.customerid) num_cust
FROM customers cust
INNER JOIN orders o
ON cust.customerid = o.customerid
GROUP BY CASE WHEN cust.gender = 'M' THEN 'Male'
	WHEN cust.gender = 'F' THEN 'Female' ELSE 'Unknown' END
	,YEAR(orderdate)

-----------Q10-----------

SELECT
	MONTH(orderdate) as Month
	,COUNT(DISTINCT orderid) num_ord
FROM orders
WHERE YEAR(Orderdate) = '2015'
GROUP BY MONTH(orderdate)
ORDER BY MONTH(orderdate)