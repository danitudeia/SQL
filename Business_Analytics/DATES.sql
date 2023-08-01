
/**********SOMA O NUMERO DE DYAS, MESES, ANOS, ETC A DATA*******/
SELECT DATEADD(DAY, 45, '2013-01-01')

/**********CONTA O NUMERO DE DYAS, MESES, ANOS, ETC ENTRE DATAS*******/
SELECT DATEDIFF (YEAR, '2013-01-01', '2015-01-01')


/**********RETORNA A DATA DE HOJE*******/
SELECT GETDATE(); --------DATA E HORA
SELECT CONVERT(DATE, GETDATE()); -----SOMENTE DATA

/**********RETORNA A HORA ATUAL*******/
SELECT CONVERT(TIME, GETDATE()); 

/**********RETORNA A HORA ATUAL*******/
SELECT CURRENT_TIMESTAMP;

/**********RETORNA OS ELEMENTOS DA DATA*******/
SELECT 
	YEAR(GETDATE())
	,MONTH(GETDATE())
	,DAY(GETDATE());

/**********RETORNA A DATA DO SISTEMA*******/
SELECT SYSDATETIME ()

/**********RETORNA A DATA DO SISTEMA COM A TIME ZONE******/
SELECT SYSDATETIMEOFFSET ()

/**********RETORNA PARTE DA DATA - CONVERTE******/

SELECT CAST(GETDATE() AS datetime)
SELECT CAST(GETDATE() AS date)

/**********RETORNA PARTE DA DATA******/

SELECT DATENAME(MONTH,GETDATE()) ----STRING
SELECT DATEPART(MONTH,GETDATE()) -----INT

/**********SOMA DIAS/MESES/ANOS/ETC NA DATA******/

SELECT DATEADD(DAY,45, GETDATE())
SELECT DATEADD(DAYOFYEAR,45, GETDATE())
SELECT DATEADD(weekday,-45, GETDATE())

SELECT DATEADD(HOUR,10, GETDATE())
SELECT DATEADD(YEAR,3, GETDATE())
SELECT DATEADD(MONTH,-2, GETDATE())

/******DIFERENCA ENTRE DATAS*******/

SELECT DATEDIFF(MONTH, GETDATE(), '2023-12-31')


/******CHANGING TO DATE WITHOUT - *******/

SELECT YEAR(OrderDate)* 10000 + MONTH(OrderDate) * 100 +
DAY(OrderDate) FROM Orders


/******Does this date column have any unexpected timevalues?*******/
SELECT (CASE WHEN ShipDate = CAST(ShipDate as DATE)
THEN 'PURE' ELSE 'MIXED' END) as datetype,
COUNT(*) AS TOTAL_1
FROM OrderLines OL
GROUP BY (CASE WHEN ShipDate = CAST(ShipDate as DATE)
THEN 'PURE' ELSE 'MIXED' END)


/*****Comparing Counts by Date********/
SELECT CAST(ShipDate as DATE) shipdate , COUNT(*) AS 'Orders per
day'
FROM orderlines
GROUP BY shipdate
ORDER BY shipdate


/***How many orderlines shipped each day and how many billed each day?****/

 SELECT CAST(OL1.ShipDate as DATE) 'the date', OL1.numordship, OL2.numordbill
FROM (SELECT CAST(SHIPDATE AS DATE) as shipdate, COUNT(*) as numordship
FROM OrderLines
GROUP BY ShipDate
) OL1 LEFT OUTER JOIN
(SELECT CAST( BillDate as DATE) as Billdate, COUNT(*) as numordbill
FROM OrderLines
GROUP BY BillDate
) OL2
ON OL1.ShipDate = OL2. BillDate
ORDER BY 'the date'


/**********/

SELECT COALESCE(OL1.ShipDate, OL2.BillDate) as thedate,
COALESCE(OL1.numordship, 0) as numordship, COALESCE(OL2.numordbill, 0) as
numordbill
FROM (SELECT CAST(SHIPDATE AS DATE) as shipdate, COUNT(*) as numordship
FROM OrderLines
GROUP BY ShipDate
) OL1 FULL OUTER JOIN
(SELECT CAST( BillDate as DATE) as Billdate, COUNT(*) as numordbill
FROM OrderLines
GROUP BY BillDate
) OL2
ON OL1.ShipDate = OL2. BillDate
ORDER BY thedate


/******DISTINCT CUSTOMER*****/
SELECT YEAR(orderdate) as year, MONTH(orderdate) as month,
COUNT(DISTINCT customerid) as numcustomers
FROM orders o
GROUP BY YEAR(orderdate), MONTH(orderdate)
ORDER BY year, month

/*****Average number of units purchased by eachcustomer******/
SELECT SUM(numunits) as numunits,
count (distinct customerid) as totalcustomerid,
SUM(numunits) / COUNT(DISTINCT customerid) as unitspercust
FROM orders o


/***Average number of units purchased by each customer***/
SELECT YEAR(OrderDate) as year, MONTH(OrderDate) as month,
COUNT(DISTINCT CustomerId) as numcustomers,
COUNT(*) as numorders,
SUM(numunits) as numunits,
SUM(numunits)*1.0 / COUNT(DISTINCT customerid) as unitspercust,
SUM(numunits)*1.0 / COUNT(*) as unitspercustorder
FROM Orders o
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY year, month

/*******How many distinct products, as measured by distinct product IDs in each customer’s order per month per year?*********/

SELECT 
	YEAR(OrderDate) as year, MONTH(OrderDate) as month
	,COUNT(*) as numorders
	,COUNT(DISTINCT CustomerId) as numcusts
	,SUM(prodsperord) as sumprodsperorder
	,SUM(prodsperord)*1.0/COUNT(*) as avgperorder
	,SUM(prodsperord)*1.0/COUNT(DISTINCT CustomerId) as avgpercust
FROM (SELECT o.OrderId, o.CustomerId, o.OrderDate, COUNT(DISTINCT ProductId) as prodsperord 
		FROM Orders o JOIN OrderLines ol ON o.orderid = ol.orderid 
		GROUP BY o.orderid, o.customerid, o.orderdate ) o
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY year, month