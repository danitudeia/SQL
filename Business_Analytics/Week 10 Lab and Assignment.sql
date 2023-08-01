
--Query 1 ---The following query provides the counts of orders, customers, and households:

			
	 SELECT COUNT(*) as numorders, COUNT(DISTINCT c.CustomerId) as numcusts,							
       COUNT(DISTINCT HouseholdId) as numhh						
FROM Orders o LEFT OUTER JOIN							
     Customers c							
     ON o.CustomerId = c.CustomerId		
	 ---------------------------------------with average--------------------------------------
	  SELECT COUNT(*) as numorders, COUNT(DISTINCT c.CustomerId) as numcusts,							
       COUNT(DISTINCT HouseholdId) as numhh,			
	   COUNT(*)*1.0/COUNT(DISTINCT c.CustomerId) as ordpercust,
	   COUNT(DISTINCT c.CustomerId)*1.0/COUNT(DISTINCT HouseholdId) as custperhh
FROM Orders o LEFT OUTER JOIN							
     Customers c							
     ON o.CustomerId = c.CustomerId	

--Query 2 ---How Many Customers are in a Household?-- number of households with 1 member, number of households with 2 members 

SELECT h.numinhousehold, COUNT(*) as numhh					
FROM (SELECT HouseholdId, COUNT(*) as numinhousehold					
      FROM Customers c					
      GROUP BY HouseholdId
	  --order by count(*)	desc				
     ) h					
GROUP BY numinhousehold					
ORDER BY numinhousehold					

--Query 3 -- Calculate the Average Size of a Household----there is on average 1.2 customers in one household--- so some has 1 and some has 2. 
SELECT COUNT(*)*1.0 / COUNT(DISTINCT HouseholdId)					
FROM Customers c 

--Query 4.1 How Many Genders in a Household ---- we can do that in different ways--- Yellow Null as system detection or giving it a calculated name as Null
					
	SELECT Gender, COUNT(*) as numcusts
	--, MIN(CustomerId), MAX(CustomerId)							
FROM Customers							
GROUP BY Gender							
ORDER BY numcusts DESC							
				
--Query 4.2 Variation 1
SELECT (CASE WHEN Gender IS NULL THEN 'NULL' WHEN Gender = '' THEN 'EMPTY'								
             WHEN Gender = ' ' THEN 'SPACE'								
             ELSE Gender END) as gender, COUNT(*) as numcusts								
FROM Customers								
GROUP BY Gender								
ORDER BY numcusts DESC		
-----------------------------------------------------------------------------------
SELECT (CASE WHEN Gender IS NULL THEN 'NULL'							
         ELSE Gender END) as gender, COUNT(*) as numcusts								
FROM Customers								
GROUP BY Gender								
ORDER BY numcusts DESC		


--Query 5.1 Calculation by Gender good is the customers who filled in the gender column, Bad is null gender. Next 2 queries are different because of group by.. 
SELECT (CASE WHEN Gender IN ('M', 'F') THEN 'GOOD' ELSE 'BAD' END) as g,							
       COUNT(*) as numcusts							
FROM Customers							
GROUP BY (CASE WHEN Gender IN ('M', 'F') THEN 'GOOD' ELSE 'BAD' END) 


--Query 5.2 Calculation by Gender
	SELECT (CASE WHEN Gender IN ('M', 'F') THEN 'GOOD' ELSE 'BAD' END) as g,							
       COUNT(*) as numcusts							
FROM Customers							
GROUP BY Gender							
					
--QUERY 6 How many genders in each household---- kind of subquery for the next query, shows count of number of genders based on First name and household ID. 

SELECT HouseholdId, firstname,
--COUNT(*) as numcustomers,						
             COUNT(DIStinct Gender) as numgenders						
      FROM Customers c						
      GROUP BY HouseholdId, firstname

	  order by COUNT(DISTINCT Gender) desc


--Query 7 For each household size (by number of customers), how many households have one gender, two genders, and three genders?
--There are 134293 households with only one customer and out of that 122722 customers have filled in the gender column. 

SELECT numcustomers, COUNT(*) as numhh,						
       SUM(CASE WHEN numgenders = 1 THEN 1 ELSE 0 END) as gen1,						
       SUM(CASE WHEN numgenders = 2 THEN 1 ELSE 0 END) as gen2,						
       SUM(CASE WHEN numgenders = 3 THEN 1 ELSE 0 END) as gen3						
FROM (SELECT HouseholdId, COUNT(*) as numcustomers,						
             COUNT(DISTINCT Gender) as numgenders						
      FROM Customers c						
      GROUP BY HouseholdId) hh						
GROUP BY numcustomers						
ORDER BY numcustomers						

--Query 8 Slide 13 How many households consist of “different” customers that have the same first name and the same gender?


SELECT COUNT(*) as numhh,							
       SUM(CASE WHEN numgenders = 1 AND numfirstnames = 1 THEN 1 ELSE 0							
           END) as allsame							
FROM (SELECT HouseholdId, COUNT(*) as numcustomers,							
             COUNT(DISTINCT Gender) as numgenders,							
             COUNT(DISTINCT Firstname) as numfirstnames							
      FROM Customers c							
      GROUP BY HouseholdId) hh							
WHERE numcustomers > 1							

/*Results broken down by num of customers and num households
SELECT numcustomers, COUNT(*),							
       SUM(CASE WHEN numgenders = 1 AND numfirstnames = 1 THEN 1 ELSE 0							
           END) as allsame							
FROM (SELECT HouseholdId, COUNT(*) as numcustomers,							
             COUNT(DISTINCT Gender) as numgenders,							
             COUNT(DISTINCT FirstName) as numfirstnames							
      FROM Customers c							
      GROUP BY HouseholdId) a							
GROUP BY numcustomers							
ORDER BY numcustomers*/							

--Query 9 slide 14--What are some examples of first names from each household where all members have the same genders?
--MIN is first time customer named type is used for the login (IKE) AND MAX is the name type customer used for the last time it logged in(MARTIN). 

SELECT HouseholdId, MIN(Firstname)as mini, MAX(Firstname)as maxi						
FROM Customers c						
GROUP BY HouseholdId						
HAVING MIN(Firstname) <> MAX(Firstname) AND MIN(Gender) = MAX(Gender)	

--Query 10 slide 19 Recency--- how many customers made purchase one day ago, 2 days ago and so on.. run the subquery 

SELECT recency, COUNT(*) as numofcustrecpurch							
FROM (SELECT HouseholdId, DATEDIFF(day, MAX(OrderDate), '2016-01-01') as recency								
      FROM Orders o JOIN Customers c ON o.CustomerId = c.CustomerId								
      WHERE OrderDate < '2016-01-01'								
      GROUP BY HouseholdId
	  --order by recency 
	  ) h								
GROUP BY recency								
ORDER BY recency 								


--Query 11 slide 20 Frequency ..measures how frequently customer makes purchases,so 35 customers make purchases in after every one day, 58 customers 
SELECT frequency, 							
       COUNT(*)	numofcustfrepurch							
FROM (SELECT HouseholdId, DATEDIFF(day, MIN(OrderDate), '2016-01-01')/COUNT(*) as frequency							
      FROM Orders o JOIN Customers c ON o.CustomerId = c.CustomerId							
      WHERE OrderDate < '2016-01-01'							
      GROUP BY HouseholdId) h							
GROUP BY frequency						
ORDER BY frequency	

--Query 12 slide 21 Monetary
SELECT floor(money) as dollars, count(*) as numofcustspenddollars				
FROM (SELECT HouseholdId, SUM(TotalPrice)/count(*) as money						
      FROM Orders o JOIN Customers c ON o.CustomerId = c.CustomerId						
      WHERE OrderDate < '2016-01-01'						
      GROUP BY HouseholdId) a						
GROUP BY floor(money)						
ORDER BY dollars


--Query 13 slide 22 RFM bin
Select   recbin * 100 + freqbin * 10 + monbin as rfm, count(*) as numcust from
(SELECT (CASE WHEN r <= 380 THEN 1 WHEN r <= 615 THEN 2							
                   WHEN r <= 1067 THEN 3 WHEN r <= 1696 THEN 4							
                   ELSE 5 END) as recbin,							
             (CASE WHEN f <= 372 THEN 1 WHEN f <= 594 THEN 2							
                   WHEN f <= 974 THEN 3 WHEN f <= 1628 THEN 4							
                   ELSE 5 END) as freqbin,							
             (CASE WHEN m >= 59 THEN 1 WHEN m >= 28 THEN 2							
                   WHEN m >= 20 THEN 3 WHEN m >= 13 THEN 4							
                   ELSE 5 END) as monbin							
      FROM (SELECT HouseholdId, MIN(OrderDate) as mindate,  					
                   DATEDIFF(day, MAX(OrderDate), '2016-01-01')  as r,							
                   DATEDIFF(day, MIN(OrderDate), '2016-01-01') / COUNT(*) as f,							
                   SUM(TotalPrice) / COUNT(*) as m							
            FROM Orders o JOIN Customers c ON o.CustomerId = c.CustomerId							
            WHERE OrderDate < '2016-01-01'							
            GROUP BY HouseholdId) a ) b							
GROUP BY recbin * 100 + freqbin * 10 + monbin							
ORDER BY rfm 


						

					
					
					
						

