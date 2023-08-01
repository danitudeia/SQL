/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Year]
      ,[Category]
      ,[Prize]
      ,[Motivation]
      ,[Prize Share]
      ,[Laureate ID]
      ,[Laureate Type]
      ,[Full Name]
      ,[Birth Date]
      ,[Birth City]
      ,[Birth Country]
      ,[Sex]
      ,[Organization Name]
      ,[Organization City]
      ,[Organization Country]
      ,[Death Date]
      ,[Death City]
      ,[Death Country]
  FROM [SQLBook Database].[dbo].[Nobel Prize Winners]

 
 ------------------------Exercises----------------

 SELECT *
 FROM [SQLBook Database].[dbo].[Nobel Prize Winners]
 WHERE Category = 'Chemistry'


 SELECT *
 FROM [SQLBook Database].[dbo].[Nobel Prize Winners]
 WHERE Year >= 1987 AND Category = 'Chemistry'


 SELECT *
 FROM [SQLBook Database].[dbo].[Nobel Prize Winners]
 WHERE Year >= 1987 OR Category = 'Chemistry'


 SELECT
	Prize
	,Sex
	,[Birth City]
FROM [SQLBook Database].[dbo].[Nobel Prize Winners]

/* COMMENT */ 
 SELECT *
 FROM [SQLBook Database].[dbo].[Nobel Prize Winners]
 WHERE Year >= 1987 AND Category LIKE 'C%'


