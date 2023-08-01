/***********Q1**************/
SELECT
	emp.first_name
	,emp.last_name
	,emp.salary
	,job.job_title
FROM [dbo].[employees] AS emp
LEFT JOIN [dbo].[jobs] AS job
ON emp.job_id = job.job_id
ORDER BY emp.last_name ASC

/***********Q2**************/
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

/***********Q3**************/
SELECT
	emp.first_name
	,emp.last_name
	,dep.department_id
	,dep.department_name
FROM [dbo].[employees] AS emp
LEFT JOIN [dbo].[departments] AS dep
ON emp.department_id = dep.department_id
WHERE emp.department_id IN ('5','7')


/***********Q4**************/
SELECT
	emp.first_name
	,emp.last_name
	,emp.salary
FROM [dbo].[employees] AS emp
WHERE salary < (SELECT salary FROM [dbo].[employees] WHERE employee_id = '116')

/***********Q5**************/
SELECT
	emp.employee_id
	,CONCAT(emp.first_name, ' ', emp.last_name) AS name
	,emp.hire_date
	,CASE WHEN YEAR(hire_date) <= '1994' THEN 'Senior' 
		WHEN YEAR(hire_date) > '1994' THEN 'Junior' ELSE NULL END experience
FROM [dbo].[employees] AS emp

/***********Q6**************/
SELECT 
	emp.first_name
	,emp.last_name
	,emp.employee_id
	,emp.manager_id
	,emp.hire_date
FROM [dbo].[Employees] emp
INNER JOIN (SELECT * FROM [dbo].[Employees] 
			WHERE first_name = 'Neena') man
ON emp.manager_id = man.employee_id

/***********Q7**************/
SELECT
	emp.first_name
	,emp.last_name
	,emp.employee_id
	,job.job_title
FROM [dbo].[employees] AS emp
LEFT JOIN [dbo].[jobs] AS job
ON emp.job_id = job.job_id
INNER JOIN [dbo].[departments] AS dep
ON emp.department_id = dep.department_id 
WHERE dep.location_id = (SELECT location_id FROM [dbo].[locations] WHERE city = 'London')


/***********Q8**************/
SELECT
	reg.region_name
	,COUNT(*)
FROM [dbo].[regions] AS reg
GROUP BY region_name


/*********Q9**********/
SELECT
	emp.department_id
	,emp2.total_amt
	,emp2.number_of_employees
	,CASE WHEN emp2.number_of_employees >= '4' THEN 'Big' 
		WHEN emp2.number_of_employees < '4' THEN 'Small' ELSE NULL END size
FROM [dbo].[employees] AS emp
INNER JOIN (SELECT COUNT(1) AS number_of_employees, SUM(salary) AS total_amt, department_id FROM [dbo].[employees] GROUP BY department_id) AS emp2
ON emp.department_id = emp2.department_id
GROUP BY 	
	emp.department_id
	,emp2.total_amt
	,emp2.number_of_employees
	,CASE WHEN emp2.number_of_employees >= '4' THEN 'Big' 
		WHEN emp2.number_of_employees < '4' THEN 'Small' ELSE NULL END