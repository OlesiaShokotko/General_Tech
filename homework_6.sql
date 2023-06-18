USE hr;

SELECT 
	COUNT(*) AS employees_cnt,
	department_id
FROM employees
GROUP BY department_id;

SELECT 
	t1.department_name, 
    t2.employees_cnt
FROM departments t1
INNER JOIN (
SELECT 
	COUNT(*) AS employees_cnt,
	department_id
FROM employees
GROUP BY department_id
) t2
ON t1.department_id = t2.department_id;

SELECT
	manager_id,
    COUNT(*) AS employees_cnt
FROM employees
GROUP BY manager_id;

SELECT
	t1.first_name,
    t1.last_name,
    t2.employees_cnt
FROM employees t1
INNER JOIN (
SELECT
	manager_id,
    COUNT(*) AS employees_cnt
FROM employees
GROUP BY manager_id
) t2
ON t1.employee_id = t2.manager_id;

SELECT
	department_id,
    MAX(salary) AS max_salary
FROM employees
GROUP BY department_id;

SELECT 
	t1.first_name,
    t1.last_name,
    t2.max_salary
FROM employees t1
INNER JOIN (
SELECT
	department_id,
    MAX(salary) AS max_salary
FROM employees
GROUP BY department_id
) t2
ON t1.department_id = t2.department_id
AND t1.salary = t2.max_salary;



    
    
    
    

