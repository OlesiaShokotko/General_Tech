USE hr;
SELECT 
department_id, 
MAX(CASE WHEN salary > 10000 THEN 1 ELSE 0 END) AS has_high_earners
FROM employees
GROUP BY department_id;

SELECT 
department_id, 
MIN(CASE WHEN salary < 10000 THEN 0 ELSE 1 END) AS all_high_earners
FROM employees
GROUP BY department_id;

SELECT 
* 
FROM employees
ORDER BY last_name;

SELECT 
* 
FROM employees
ORDER BY salary DESC;

SELECT 
* 
FROM employees
WHERE department_id IN (60,90,110)
ORDER BY last_name;

SELECT 
* 
FROM employees
WHERE job_id = 'ST_CLERK'
ORDER BY salary DESC;

SELECT 
* 
FROM employees
WHERE first_name LIKE 'D%'
ORDER BY last_name;

CREATE DATABASE airport;
USE airport;
SELECT 
	id,
    service_class,
    price
FROM tickets
WHERE service_class IN ('Economy', 'PremiumEconomy', 'Business')
AND
CASE
	WHEN service_class = 'Economy' THEN price BETWEEN 10000 AND 11000
    WHEN service_class = 'PremiumEconomy' THEN price BETWEEN 20000 AND 30000
    WHEN service_class = 'Business' THEN price > 100000
END;

SELECT 
	side_number,
CASE
	WHEN production_year < 2000 THEN 'Old'
    WHEN production_year BETWEEN 2000 AND 2010 THEN 'Mid'
	ELSE 'New'
END AS age
FROM airliners
WHERE range_value < 10000;

SELECT 
	id,
    trip_id,
CASE
	WHEN service_class = 'Economy'
		THEN price * 0.85
	WHEN service_class = 'Business'
		THEN price * 0.9
	WHEN service_class = 'PremiumEconomy'
		THEN price * 0.8
END AS new_price
FROM tickets
WHERE trip_id IN ('LL4S1G8PQW', '0SE4S0HRRU', 'JQF04Q8I9G');

CREATE TABLE goods (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128) NOT NULL,
    quantity INTEGER
    );
ALTER TABLE goods
ADD COLUMN price INTEGER DEFAULT 0;
SELECT * FROM goods;
ALTER TABLE goods
DROP COLUMN title;
ALTER TABLE goods
MODIFY COLUMN price NUMERIC;
ALTER TABLE goods
ADD COLUMN title VARCHAR(128) NOT NULL;
DROP TABLE goods;
CREATE TABLE goods (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128) NOT NULL,
    price INTEGER,
    quantity INTEGER
    );
INSERT INTO goods(title, price, quantity) VALUES ('Ролики', 3000, 10),
											     ('Самокат', 4500, 12),
                                                 ('Велосипед', 3000, 10);
CREATE TABLE goods_2 AS
	SELECT
		*
	FROM goods
    WHERE 1=0;
