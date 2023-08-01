USE SQLBook
CREATE TABLE Stations
(
    id INT,
	station varchar(100),
	municipality varchar(30),
	lat REAL,
	ln REAL
)
BULK INSERT Stations
FROM 'C:\Users\Danielle\Downloads\Stations.csv' --Change this location as  appropriate for you
WITH
(
    FIRSTROW = 2,
	FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'

)
GO
SELECT * FROM Stations
--DROP Table Stations

CREATE TABLE Trips
(
    tripduration INT,
	startstationid INT,
	startstationname VARCHAR (100),
	startstationlatitude REAL,
	startstationlongititude REAL,
	endstationid INT,
	endstationname VARCHAR (100),
	endstationlatitude REAL,
	endstationlongititude REAL,
	bikeid INT,
	usertype VARCHAR(30),
	birthyear INT,
	gender INT
)
BULK INSERT Trips
FROM 'C:\Users\Danielle\Downloads\Trips.csv' --Change this location as  appropriate for you
WITH
(
    FIRSTROW = 2,
	FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'

)
GO

SELECT * FROM Trips
--DROP Table Trips

/*
Assume id in Stations as PK, startstationid, endstationid in Trips as FKs
*/

/*****************EXERCISE 1**************/
SELECT MAX(tripduration) tripduration_max 
FROM Trips

SELECT TOP 1 * 
FROM Trips
ORDER BY tripduration DESC

/*****************EXERCISE 2**************/
SELECT COUNT(1) trips_num
FROM Trips
WHERE usertype = 'subscriber' 

/*****************EXERCISE 3**************/
SELECT 
	AVG(tripduration) avg_trip_dur
	,usertype
FROM Trips
GROUP BY usertype

/*****************EXERCISE 4**************/
SELECT 
	bikeid
	,count(1) trips_num
FROM Trips
GROUP BY bikeid

/*****************EXERCISE 5**************/
SELECT 
	AVG(tripduration) AS avg_trip_dur
FROM Trips
WHERE YEAR(GETDATE()) - birthyear >30


/*****************EXERCISE 6**************/
SELECT 
	TOP 1
	COUNT(1) AS num_trip
	,trp.startstationname
	,st.municipality
FROM Trips AS trp
LEFT JOIN Stations AS st
ON trp.startstationid = st.id
GROUP BY trp.startstationname, st.municipality
ORDER BY COUNT(1) DESC

/*****************EXERCISE 7**************/
SELECT 
	TOP 5
	COUNT(1) AS num_trip
	,startstationname
	,endstationname
FROM Trips
WHERE startstationname = endstationname
GROUP BY startstationname, endstationname
ORDER BY COUNT(1) DESC

/*****************EXERCISE 8**************/
SELECT 
	COUNT(1) AS num_trip
FROM Trips AS trp
LEFT JOIN Stations AS sts
ON trp.startstationid = sts.id
LEFT JOIN Stations AS ste
ON trp.endstationid = ste.id
WHERE sts.municipality <> ste.municipality
