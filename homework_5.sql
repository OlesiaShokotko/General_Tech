CREATE DATABASE university;

USE university;

CREATE TABLE students (
				id INTEGER PRIMARY KEY AUTO_INCREMENT,
                name VARCHAR(128) NOT NULL,
                age INTEGER
                );
                
CREATE TABLE teachers (
				id INTEGER PRIMARY KEY AUTO_INCREMENT,
                name VARCHAR(128) NOT NULL,
                age INTEGER
                );
                
CREATE TABLE competencies (
				id INTEGER PRIMARY KEY AUTO_INCREMENT,
                title VARCHAR(128) NOT NULL
                );
                
CREATE TABLE teachers2Competencies (
				id INTEGER PRIMARY KEY AUTO_INCREMENT,
                teacher_id INTEGER,
                competencies_id INTEGER
                );
                
CREATE TABLE courses (
				id INTEGER PRIMARY KEY AUTO_INCREMENT,
                teacher_id INTEGER,
                title VARCHAR(128) NOT NULL,
                headman_id INTEGER
                );
                
CREATE TABLE students2Courses (
				id INTEGER PRIMARY KEY AUTO_INCREMENT,
                student_id INTEGER,
                course_id INTEGER
                );
                
INSERT INTO students(name, age) VALUES ("Анатолий", 29),
									   ("Олег", 25),
									   ("Семен", 27),
									   ("Олеся", 28),
									   ("Ольга", 31),
									   ("Иван", 22);
				
INSERT INTO teachers(name, age) VALUES ("Петр", 39),
									   ("Максим", 35),
									   ("Антон", 37),
									   ("Всеволод", 38),
									   ("Егор", 41),
									   ("Светлана", 32);
                                       
INSERT INTO competencies(title) VALUES ("Математика"),
									   ("Информатика"),
									   ("Программирование"),
									   ("Графика");
                                       
INSERT INTO teachers2Competencies(teacher_id, competencies_id) VALUES (1, 1),
									                                  (2, 1),
									                                  (2, 3),
																	  (3, 2),
									                                  (4, 1),
									                                  (5, 3);
                                       
INSERT INTO courses(teacher_id, title, headman_id) VALUES (1, "Алгебра логики", 2),
														  (2, "Математическая статистика", 3),
									                      (4, "Высшая математика", 5),
									                      (5, "Javascript ", 1),
									                      (5, "Базовый Python", 1);
								
INSERT INTO students2Courses(student_id, course_id) VALUES (1, 1),
														   (2, 1),
														   (3, 2),
														   (3, 3),
														   (4, 5);
													
SELECT 
	t1.name,
    t2.title
FROM students t1
INNER JOIN students2Courses t3
ON t1.id = t3.student_id
INNER JOIN courses t2 
ON t2.id = t3.course_id;

SELECT 
	t1.name,
    t2.title
FROM teachers t1
LEFT JOIN teachers2Competencies t3
ON t1.id = t3.teacher_id
LEFT JOIN competencies t2
ON t2.id = t3.competencies_id;

SELECT 
	t1.name
FROM teachers t1
LEFT JOIN teachers2Competencies t2
ON t1.id = t2.teacher_id
WHERE t2.teacher_id is NULL;

SELECT
	t1.name
FROM students t1
LEFT JOIN students2Courses t2
ON t1.id = t2.student_id
WHERE t2.student_id IS NULL;

SELECT
	t1.id,
    t1.title
FROM courses t1
LEFT JOIN students2Courses t2
ON t1.id = t2.course_id
WHERE t2.course_id IS NULL;

SELECT
	t1.id,
    t1.title
FROM competencies t1
LEFT JOIN teachers2Competencies t2
ON t1.id = t2.competencies_id
WHERE t2.competencies_id IS NULL;

SELECT
	t1.title,
    t2.name
FROM courses t1
INNER JOIN students t2
ON t1.headman_id = t2.id;

SELECT
	t1.name AS student_name,
    t3.name AS headman_name
FROM students t1
INNER JOIN students2Courses t2
ON t1.id = t2.student_id
INNER JOIN courses t4
ON t2.course_id = t4.id     
INNER JOIN students t3
ON t4.headman_id = t3.id;


                
                