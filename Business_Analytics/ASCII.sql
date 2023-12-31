
SELECT ASCII('adam') as asci 
SELECT ASCII('Adam') as asci 

SELECT CHAR(97) as char 
SELECT CHAR(65) as char 

SELECT LEN('  SQLAUTHORITY'), LEN('SQLAUTHORITY ');

SELECT CONCAT ('SQL','AUTHORI','TY');
SELECT CONCAT ('SQL',NULL,'TY');
SELECT CONCAT (NULL,NULL,NULL);

SELECT LOWER('DATA ANALYSIS');
SELECT UPPER('data analysis');

SELECT LEFT ('SQLAUTHORITY', 4), LEFT ('DATAANALYSIS', 3);

SELECT RIGHT ('SQLAUTHORITY', 4), RIGHT ('DATAANALYSIS', 3);

SELECT RTRIM ('   SQLAUTHORITY  '), LEN(RTRIM('   SQLAUTHORITY  '));

SELECT LTRIM ('   SQLAUTHORITY');

SELECT SUBSTRING ('SQLAUTHORITY', 4, 3);

SELECT REVERSE('SQLAUTHORITY');

----TABLE COLUMN
USE HRDatabase
SELECT CONCAT(first_name, '', last_name) AS Full_name,
REVERSE(CONCAT(first_name, '', last_name)) AS RFull_name
FROM employees

