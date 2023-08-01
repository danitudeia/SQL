/****** NEW TABLES  ******/
SELECT
	a.*
	,b.*
  FROM [SQLBook].[dbo].[ZipCensus] a
  INNER JOIN [SQLBook].[dbo].[ZipCounty] b
  ON a.zcta5 = b.ZipCode


--------------------
 SELECT 
	zcta5 as ZipCode
	,SUBSTRING(zcta5,1,3) as scf
FROM [SQLBook].[dbo].[ZipCensus] 
WHERE Stab = 'MN'

------------------
SELECT 
	zc.zcta5
	,LEFT(zc.zcta5, 3) as scf
FROM ZipCensus zc
ORDER BY zc.zcta5------------------
SELECT 
	zc.zcta5
	,LEFT(zc.zcta5, 3) as scf
FROM ZipCensus zc
WHERE stab = 'MN'
ORDER BY 1----------------------
SELECT 
	COUNT(*) as numzip
FROM ZipCensus zc
----------------------
SELECT 
	stab
	,COUNT(*) as numzip
	FROM ZipCensus zc
	GROUP BY stab
	ORDER BY numzip DESC
----------------------
SELECT 
	zc.stab
	,COUNT(DISTINCT LEFT(zc.zcta5, 3)) as numscf
	FROM ZipCensus zc
	GROUP BY zc.stab
	ORDER BY zc.stab

