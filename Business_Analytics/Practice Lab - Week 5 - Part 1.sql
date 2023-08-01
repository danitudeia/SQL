/***********Q1***********/
SELECT * FROM [dbo].[Departments]

/***********Q2***********/
SELECT DISTINCT Name FROM [dbo].[Departments]

/***********Q3***********/
SELECT Salary
FROM [dbo].[Employees]

/***********Q4***********/
SELECT 
	CONCAT(FirstName, ' ',MiddleName,' ', LastName) AS FullName 
FROM [dbo].[Employees]


/***********Q5***********/
SELECT 
	CONCAT(LOWER(FirstName), '.', LOWER(LastName), '@telerik.com') AS  [Full Email Addresses]
FROM [dbo].[Employees]

/***********Q6***********/
SELECT 
	DISTINCT Salary
FROM [dbo].[Employees]


/***********Q7***********/
SELECT 
	*
FROM [dbo].[Employees]
WHERE JobTitle = 'Sales Representative'

/***********Q8***********/
SELECT 
	*
FROM [dbo].[Employees]
WHERE LEFT(FirstName,2) = 'SA'

/***********Q9***********/
SELECT 
	*
FROM [dbo].[Employees]
WHERE LastName LIKE '%ei%'

/***********Q10***********/
SELECT 
	Salary
FROM [dbo].[Employees]
WHERE Salary BETWEEN '20000' AND '30000'

/***********Q11***********/
SELECT 
	Salary
FROM [dbo].[Employees]
WHERE Salary IN ('25000', '14000', '12500', '23600')

/***********Q12***********/
SELECT 
	*
FROM [dbo].[Employees]
WHERE ManagerID IS NULL OR ManagerID =''

/***********Q13***********/
SELECT 
	*
FROM [dbo].[Employees]
WHERE Salary > '50000'
ORDER BY Salary DESC

/***********Q14***********/
SELECT 
	TOP 5 *
FROM [dbo].[Employees]
ORDER BY Salary DESC

/***********Q15***********/
SELECT 
	emp.*
	,ad.AddressText
	,tw.Name
FROM [dbo].[Employees] AS emp
INNER JOIN [dbo].[Addresses] AS ad
ON emp.AddressID = ad.AddressID
INNER JOIN [dbo].[Towns] AS tw
ON ad.TownID = tw.TownID

/***********Q16***********/

SELECT [dbo].[Employees].*
	,[dbo].[Addresses].AddressText
	,[dbo].[Towns].Name
FROM [dbo].[Employees], [dbo].[Addresses], [dbo].[Towns]
WHERE [dbo].[Employees].AddressID = [dbo].[Addresses].AddressID 
and [dbo].[Addresses].TownID = [dbo].[Towns].TownID

/***********Q17***********/
SELECT 
	emp.EmployeeID
	,CONCAT (emp.FirstName, ' ', emp.MiddleName, ' ', emp.LastName) AS EmployeeName
	,CONCAT (man.FirstName, ' ', man.MiddleName, ' ', man.LastName) AS ManagerName
FROM [dbo].[Employees] emp
INNER JOIN [dbo].[Employees] man
ON emp.ManagerID = man.EmployeeID

/***********Q18***********/
SELECT 
	emp.EmployeeID
	,CONCAT (emp.FirstName, ' ', emp.MiddleName, ' ', emp.LastName) AS EmployeeName
	,CONCAT (man.FirstName, ' ', man.MiddleName, ' ', man.LastName) AS ManagerName
	,ad.AddressText
	,tw.Name
FROM [dbo].[Employees] emp
INNER JOIN [dbo].[Employees] man
ON emp.ManagerID = man.EmployeeID
INNER JOIN [dbo].[Addresses] AS ad
ON emp.AddressID = ad.AddressID
INNER JOIN [dbo].[Towns] AS tw
ON ad.TownID = tw.TownID

/***********Q19***********/
SELECT Name FROM [dbo].[Departments]
UNION
SELECT Name FROM [dbo].[Towns]

/***********Q20***********/
SELECT 
	emp.EmployeeID
	,CONCAT (emp.FirstName, ' ', emp.MiddleName, ' ', emp.LastName) AS EmployeeName
	,CONCAT (man.FirstName, ' ', man.MiddleName, ' ', man.LastName) AS ManagerName
FROM [dbo].[Employees] man
RIGHT OUTER JOIN [dbo].[Employees] emp
ON emp.ManagerID = man.EmployeeID


SELECT 
	emp.EmployeeID
	,CONCAT (emp.FirstName, ' ', emp.MiddleName, ' ', emp.LastName) AS EmployeeName
	,CONCAT (man.FirstName, ' ', man.MiddleName, ' ', man.LastName) AS ManagerName
FROM [dbo].[Employees] emp
LEFT OUTER JOIN [dbo].[Employees] man
ON emp.ManagerID = man.EmployeeID


/***********Q21***********/
SELECT 
	emp.*
FROM (SELECT * FROM	[dbo].[Employees]
		WHERE YEAR(HireDate) BETWEEN 1995 AND 2005) AS emp
INNER JOIN (SELECT DepartmentID
			FROM [dbo].[Departments]
			WHERE Name IN ('Sales','Finance')) AS dep
ON emp.DepartmentID = dep.DepartmentID