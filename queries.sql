-- SELECT

-- 1
SELECT *
FROM students
WHERE YEAR(date_of_birth) = 1990;

-- 2
SELECT *
FROM courses
WHERE cfu > 10;

-- 3
SELECT *
FROM students
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 30

-- 4
SELECT *
FROM courses
WHERE period = 'I semestre' AND year = 1;

-- 5
SELECT *
FROM exams
WHERE date = '2020-06-20' AND HOUR(hour) >= 14;

-- 6
SELECT *
FROM degrees
WHERE level = 'magistrale';

-- 7
SELECT COUNT(*) AS numero_dipartimenti
FROM departments;

-- 8
SELECT COUNT(*) AS insegnanti_senza_telefono
FROM teachers
WHERE phone IS NULL OR phone = '';


-- GROUP BY

-- 1
SELECT YEAR(`enrolment_date`), COUNT(id)
FROM `students`
GROUP BY YEAR(enrolment_date)

-- 2
SELECT `office_address`,COUNT(id)
FROM `teachers`
GROUP BY `office_address`


-- 3

-- 4


-- JOIN

-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
