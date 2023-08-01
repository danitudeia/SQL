
/***** Ten Closest Zip Codes to the US Geographic Center in the middle of Kansas and has a longitude of –98.6° and a latitude of 39.8° ********/
WITH zc AS
(SELECT *, (latitude - 39.8) as difflat,
(latitude + 39.8) * PI() / (2 * 180) as avglatrad,
longitude - (-98.6) as difflong,
latitude * PI() / 180 as latrad
FROM ZipCensus)

SELECT TOP 10 zcta5, stab, totpop, latitude, longitude,
SQRT(SQUARE(difflat*68.7)+SQUARE(difflong*COS(avglatrad)*68.7)
) as disteuc
FROM zc
ORDER BY disteuc

/************To see all the longitude and latitude in ZipCensus table.****/
SELECT longitude, latitude FROM ZipCensus

/********Query 2 to draw a scatter plot***********/
SELECT longitude, latitude
FROM ZipCensus
WHERE latitude BETWEEN 20 AND 50 AND
longitude BETWEEN -130 AND -65

/*****Who Uses Solar Power for Heating?***********/
SELECT zcta5, longitude, latitude, tothhs, hhfsolar, pcthhfsolar 
FROM ZipCensus

/******Which zip codes have any household with solar power?*******/
SELECT zcta5, longitude,
(CASE WHEN hhfsolar = 0 THEN latitude END) as nosolarlat,
(CASE WHEN hhfsolar > 0 THEN latitude END) as solarlat
FROM ZipCensus
WHERE latitude BETWEEN 20 and 50 AND
Longitude Between -135 and -65

/****What proportion of zip codes in each state have at least one solar powered residence?*****/
SELECT TOP 10 stab, COUNT(*) as numzips, SUM(tothhs) as NumHHs,
SUM(CASE WHEN hhfsolar > 0 THEN 1.0 END)/COUNT(*) as propzips,
SUM(hhfsolar * 1.0) / SUM(tothhs) as prophhu
FROM ZipCensus zc
GROUP BY stab
ORDER BY prophhu DESC

/******Where are the Customers? - number of orders in each zip code and then joins this information to the latitude and longitude in the Zipcensus table****/
SELECT zc.zcta5, longitude, latitude, numords
FROM ZipCensus zc JOIN
(SELECT ZipCode, COUNT(*) as numords
FROM Orders
GROUP BY ZipCode) o
ON zc.zcta5 = o.zipcode
WHERE latitude BETWEEN 20 and 50 AND
longitude BETWEEN -135 AND -65

/***Find the zip code with the highest median household income is***/
SELECT TOP 1 zcta5, medianhhinc
FROM ZipCensus
ORDER BY medianhhinc DESC

/***Zipcodes with the Maximum Median Household Income***/
SELECT zcta5, state, zipname, totpop, tothhs, families, medianhhinc
FROM ZipCensus
WHERE medianhhInc = (SELECT MAX(medianhhInc) FROM ZipCensus)
ORDER BY zcta5


/******Information About the Wealthiest and Poorest ZipCodes***/
SELECT zcta5, stab, medianhhinc, medianfaminc, totpop, tothhs, zc.famhhinc200,zc.famhhinc0
FROM ZipCensus zc WHERE zc.famhhinc200 = (SELECT MAX(famhhinc200) FROM ZipCensus)

SELECT zcta5, stab, medianhhinc, medianfaminc, totpop, tothhs, zc.famhhinc200,zc.famhhinc0
FROM ZipCensus zc WHERE zc.famhhinc0 = (SELECT MAX(famhhinc0) FROM ZipCensus)

SELECT zcta5, stab, medianhhinc, medianfaminc, totpop, tothhs, zc.famhhinc200,zc.famhhinc0
FROM ZipCensus zc WHERE (zc.famhhinc200 = (SELECT MAX(famhhinc200) FROM ZipCensus)
OR zc.famhhinc0=(SELECT MAX(famhhinc0) FROM ZipCensus))