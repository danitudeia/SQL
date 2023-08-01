/************EXERCISE 1**************/
SELECT
	emp.first_name
	,emp.last_name
	,emp.department_id
	,dep.department_name
FROM [dbo].[employees] AS emp
LEFT JOIN [dbo].[departments] AS dep
ON emp.department_id = dep.department_id

/************EXERCISE 2**************/
SELECT
	emp.first_name
	,emp.last_name
	,dep.department_name
	,loc.city
	,loc.state_province
FROM [dbo].[employees] AS emp
LEFT JOIN [dbo].[departments] AS dep
ON emp.department_id = dep.department_id
LEFT JOIN [dbo].[locations] AS loc
ON dep.location_id = loc.location_id

/************EXERCISE 3**************/
SELECT
	emp.first_name
	,emp.last_name
	,dep.department_name
FROM [dbo].[employees] AS emp
LEFT JOIN [dbo].[departments] AS dep
ON emp.department_id = dep.department_id
WHERE emp.department_id IN ('1','2','3')

/************EXERCISE 4**************/
SELECT
	ct.country_name
FROM [dbo].[countries] AS ct
LEFT JOIN [dbo].[locations] AS loc
ON ct.country_id = loc.country_id
WHERE loc.country_id is NULL

/************EXERCISE 5**************/
SELECT
	reg.region_name
	,ct.country_name
	,loc.street_address
	,loc.city
FROM [dbo].[locations] AS loc
LEFT JOIN [dbo].[countries] AS ct
ON loc.country_id = ct.country_id
LEFT JOIN [dbo].[regions] AS reg
ON ct.region_id = reg.region_id

/************EXERCISE 6**************/
SELECT
	emp.*
FROM [dbo].[employees] AS emp
INNER JOIN (SELECT department_id FROM [dbo].[departments] 
			WHERE location_id <> '1700') AS dep
ON emp.department_id = dep.department_id


/************EXERCISE 7**************/
SELECT
	TOP 1 *
FROM [dbo].[employees]
ORDER BY salary DESC

SELECT
	emp.*
FROM [dbo].[employees] AS emp
WHERE salary = (SELECT MAX(salary) FROM [dbo].[employees])


/************EXERCISE 8**************/
SELECT
	emp.*
FROM [dbo].[employees] AS emp
WHERE salary > (SELECT AVG(salary) FROM [dbo].[employees])

/************EXERCISE 9**************/
SELECT
	first_name + ' ' + last_name as employee_name 
	,employee_id
	,salary
FROM (SELECT * FROM [dbo].[employees]
		WHERE first_name = 'Steven') AS emp


/*******EXERCISE 10*******/
SELECT
	emp.employee_id
	,emp.first_name
	,emp.last_name
	,emp.salary
	,CASE WHEN emp.salary >= (SELECT AVG(salary) FROM [dbo].[employees]) THEN 'HIGH' ELSE 'LOW' END SalaryStatus 
FROM [dbo].[employees] AS emp

/*******EXERCISE 11*******/
SELECT 
	dep.department_id
	,dep.department_name
FROM [dbo].[departments] AS dep
WHERE dep.department_id NOT IN (
  SELECT department_id
  FROM employees
  WHERE salary > 10000)
