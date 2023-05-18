USE lectrue;
SELECT DISTINCT avg_mark
FROM students;
UPDATE students
SET lastname = 'Сидоров'
WHERE lastname = 'Петров';
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE students
MODIFY COLUMN avg_mark NUMERIC(3,1);
ALTER TABLE students
DROP CHECK avg_mark; -- не работает(( 
ALTER TABLE students
DROP INDEX avg_mark; -- не работает(( 
ALTER TABLE students
DROP CONSTRAINT avg_mark; -- не работает(( 
UPDATE students
SET avg_mark = avg_mark * 10;
UPDATE students
SET avg_mark = avg_mark + 10
WHERE avg_mark < 31;

