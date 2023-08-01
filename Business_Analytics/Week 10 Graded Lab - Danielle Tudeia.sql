/****** Q1  ******/
SELECT 
	DATEPART(WEEKDAY,billdate) AS [DAY OF WEEK]
	,SUM(totalprice) AS [TOTAL PRICE]
FROM orderlines
GROUP BY DATEPART(WEEKDAY,billdate) 
ORDER BY DATEPART(WEEKDAY,billdate)  ASC

 ----------------------Q2---------------

SELECT
	YEAR(STARTDATE) AS [YEAR]
	,SUM(CASE WHEN CHANNEL = 'Chain' THEN 1 ELSE 0 END) Chain
	,SUM(CASE WHEN CHANNEL = 'Dealer' THEN 1 ELSE 0 END) Dealer
	,SUM(CASE WHEN CHANNEL = 'Mail' THEN 1 ELSE 0 END) Mail
	,SUM(CASE WHEN CHANNEL = 'Store' THEN 1 ELSE 0 END) Store
FROM Subscribers
WHERE STARTDATE >= '2004-01-01'
GROUP BY YEAR(STARTDATE) 
ORDER BY YEAR(STARTDATE) ASC

 ----------------------Q3---------------
SELECT 
	'Start_' + Channel AS [YEAR]
	,SUM(CASE WHEN YEAR(StartDate) = '2004' THEN 1 ELSE 0 END) [2004]
	,SUM(CASE WHEN YEAR(StartDate) = '2005' THEN 1 ELSE 0 END) [2005]
	,SUM(CASE WHEN YEAR(StartDate) = '2006' THEN 1 ELSE 0 END) [2006]
FROM Subscribers
WHERE StartDate >= '2004-01-01'
GROUP BY 'Start_' + Channel
UNION ALL
    SELECT 
	'Stop_' + Channel AS [YEAR]
	,SUM(CASE WHEN YEAR(StopDate) = '2004' THEN 1 ELSE 0 END) [2004]
	,SUM(CASE WHEN YEAR(StopDate) = '2005' THEN 1 ELSE 0 END) [2005]
	,SUM(CASE WHEN YEAR(StopDate) = '2006' THEN 1 ELSE 0 END) [2006]
FROM Subscribers
WHERE StopDate >= '2004-01-01'
GROUP BY 'Stop_' + Channel
ORDER BY 'Start_' + Channel ASC

----------------------Q4---------------

SELECT
	MONTH(StartDate) AS [Month]
	,SUM(CASE WHEN RatePlan = 'Top' THEN 1 ELSE 0 END) Topmost
	,SUM(CASE WHEN RatePlan = 'Middle' THEN 1 ELSE 0 END) Middle
	,SUM(CASE WHEN RatePlan = 'Bottom' THEN 1 ELSE 0 END) Bottom
FROM Subscribers
WHERE StartDate >= '2004-01-01'
	AND IsActive = 1
GROUP BY MONTH(StartDate)
ORDER BY MONTH(StartDate) ASC

----------------------Q5---------------

SELECT
	DATEDIFF(YEAR, StartDate, StopDate) AS CalculatedTenure
	,SUM(MonthlyFee) as MonthlyFee
FROM Subscribers
WHERE StartDate>= '2004-01-01'
	AND IsActive = 0
GROUP BY DATEDIFF(YEAR, StartDate, StopDate) 
ORDER BY DATEDIFF(YEAR, StartDate, StopDate) DESC
