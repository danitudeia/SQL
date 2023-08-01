/*********Q1***********/

SELECT
	COUNT (DISTINCT Games)
FROM athlete_events



/*********Q2***********/

SELECT
	DISTINCT GAMES
FROM athlete_events


/*********Q3***********/

SELECT
	GAMES
	,COUNT(DISTINCT NOC) AS [No of Nations]
FROM athlete_events
GROUP BY GAMES


/*********Q4***********/


SELECT
	 GAMES
	 ,COUNT(DISTINCT NOC) AS CONT
FROM athlete_events
WHERE GAMES = (SELECT TOP 1 GAMES FROM athlete_events GROUP BY GAMES ORDER BY COUNT(DISTINCT NOC) ASC)
OR GAMES = (SELECT TOP 1 GAMES FROM athlete_events GROUP BY GAMES ORDER BY COUNT(DISTINCT NOC) DESC)
GROUP BY GAMES


/*********Q5***********/
SELECT 
	ath.CONT
	,reg.region
FROM (SELECT COUNT (DISTINCT Games) AS CONT, NOC FROM athlete_events GROUP BY NOC) AS ath
INNER JOIN NOC_REGIONS AS reg
ON ath.NOC = reg.NOC
WHERE ath.CONT = (SELECT COUNT (DISTINCT Games) FROM athlete_events)


/*********Q6***********/
SELECT 
	ath.CONT
	,ath.Sport
FROM (SELECT COUNT (DISTINCT Games) AS CONT, Sport FROM athlete_events GROUP BY Sport) AS ath
WHERE ath.CONT = (SELECT COUNT (DISTINCT Games) FROM athlete_events WHERE Season = 'Summer')



/************Q7*************/
SELECT 
	ath.CONT
	,ath.Sport
FROM (SELECT COUNT (DISTINCT Games) AS CONT, Sport FROM athlete_events GROUP BY Sport) AS ath
WHERE ath.CONT = 1

/************Q8*************/
SELECT 
	COUNT(DISTINCT Sport) AS CONT
	,Games
FROM athlete_events
GROUP BY Games

/************Q9*************/
SELECT 
	*
FROM athlete_events
WHERE Medal = 'GOLD' 
AND AGE = (SELECT MAX(AGE) FROM athlete_events WHERE Medal = 'GOLD')

/************Q10*************/
SELECT
	 Name
	 ,COUNT(*) AS CONT
FROM athlete_events
WHERE Name IN (SELECT TOP 5 Name FROM athlete_events WHERE Medal IN ('Gold') GROUP BY Name ORDER BY COUNT(1) DESC)
AND  Medal IN ('Gold')
GROUP BY Name
ORDER BY COUNT(*) DESC

/************Q11*************/
SELECT
	 Name
	 ,COUNT(*) AS CONT
FROM athlete_events
WHERE Name IN (SELECT TOP 5 Name FROM athlete_events WHERE Medal IN ('Bronze','Silver','Gold') GROUP BY Name ORDER BY COUNT(1) DESC)
AND  Medal IN ('Bronze','Silver','Gold')
GROUP BY Name
ORDER BY COUNT(*) DESC

/************Q12*************/
SELECT TOP 5
	 reg.region AS Country
	 ,COUNT(*) AS CONT
FROM athlete_events AS ath
INNER JOIN NOC_REGIONS AS reg
ON ath.NOC = reg.NOC
WHERE Medal IN ('Bronze','Silver','Gold')
GROUP BY reg.region
ORDER BY COUNT(*) DESC


/************Q13*************/
SELECT TOP 1
	 Sport
	 ,Event
	 ,COUNT(*) AS CONT
FROM athlete_events AS ath
INNER JOIN NOC_REGIONS AS reg
ON ath.NOC = reg.NOC
WHERE Medal IN ('Bronze','Silver','Gold') 
AND reg.region = 'INDIA'
GROUP BY Sport, Event
ORDER BY COUNT(*) DESC

/************Q14*************/
SELECT
	 Sport
	 ,Games
	 ,COUNT(*) AS CONT
FROM athlete_events AS ath
INNER JOIN NOC_REGIONS AS reg
ON ath.NOC = reg.NOC
WHERE Medal IN ('Bronze','Silver','Gold') 
AND reg.region = 'INDIA' AND Sport = 'Hockey'
GROUP BY Sport, Games
ORDER BY COUNT(*) DESC

/************Q15*************/
SELECT
	 reg.region As Country
	 ,Games
	 ,SUM(CASE WHEN MEDAL = 'GOLD' THEN 1 ELSE 0 END) Gold_Medal
	 ,SUM(CASE WHEN MEDAL = 'SILVER' THEN 1 ELSE 0 END) Silver_Medal
	 ,SUM(CASE WHEN MEDAL = 'BRONZE' THEN 1 ELSE 0 END) Bronze_Medal
FROM athlete_events AS ath
INNER JOIN NOC_REGIONS AS reg
ON ath.NOC = reg.NOC
WHERE Medal IN ('Bronze','Silver','Gold') 
GROUP BY reg.region, Games
ORDER BY Games ASC
