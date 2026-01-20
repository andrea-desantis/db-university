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
SELECT `exam_id`, AVG(`vote`)
FROM `exam_student`
GROUP BY `exam_id`;

-- 4


-- JOIN

-- 1
SELECT *
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

-- 2
SELECT *
FROM `degrees`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze'
AND `degrees`.`level` = 'magistrale';

-- 3
SELECT *
FROM `courses`
INNER JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`id` = 44;

-- 4
SELECT `students`.`surname`, `students`.`name`, `degrees`.`name`, `departments`.`name`
FROM `students`
INNER JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname`, `students`.`name`;

-- 5
SELECT `degrees`.`name`, `courses`.`name`,`teachers`.`surname` ,`teachers`.`name`
FROM `degrees`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
ORDER BY `degrees`.`name`

-- 6
SELECT `teachers`.`surname`, `teachers`.`name`
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Matematica';

-- 7

