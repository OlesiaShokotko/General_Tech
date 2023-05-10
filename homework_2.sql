USE hr;
SELECT 
	salary
FROM employees
WHERE
	first_name = 'Lex' 
AND
	last_name = 'De Haan';
SELECT 
	*
FROM employees
WHERE
	job_id = 'FI_ACCOUNT'
AND
	salary < 8000;
SELECT 
	* 
FROM employees
WHERE
	last_name LIKE '%kk%' OR
    last_name LIKE '%ll%';
SELECT
	* 
FROM employees
WHERE 
	commission_pct IS NULL;
SELECT
	*
FROM employees
WHERE
	department_id NOT IN(80, 110);
SELECT
	*
FROM employees
WHERE
	salary BETWEEN 5000 AND 7000;
CREATE DATABASE airport;
USE airport;
SELECT 
	model_name,
CASE
	WHEN range_value BETWEEN 1001 AND 2500
		THEN 'short-haul'
	WHEN range_value BETWEEN 2501 AND 6000
		THEN 'medium-haul'
	WHEN range_value > 6000
		THEN 'long-haul'
END AS category
FROM airliners;
SELECT 
	model_name,
CASE
	WHEN range_value BETWEEN 1001 AND 2500
		THEN 'short-haul'
	WHEN range_value BETWEEN 2501 AND 6000
		THEN 'medium-haul'
	WHEN range_value > 6000
		THEN 'long-haul'
	ELSE 'UNDEFINED'
END AS category
FROM airliners;