-- Author: Christopher Miller
-- Relational Database
-- Database and SQL Injection
-- Example College Select nd Count

-- Select instructors in.
-- Show the department ID and the count. 
SELECT  department_id
        count(*)
FROM    instructor;
GROUP   BY department_id 

-- Count the number of instructors for MUSIC and MKTG.
-- Show the department ID and the count.
SELECT  count(department_id)
FROM    instructor;
WHERE   department_id LIKE '%Music%'
OR      department_id LIKE '%MKTG%'
GROUP   BY department_id 

-- Count the number of courses for each 
--    course type in the Course table.
-- Show the course type and count. 
SELECT  course_type, 
        COUNT(*) AS 'count'
FROM    course
GROUP   BY course_type;

-- Count the number of courses per
--    course credits in the Course table.
-- Show the course credits and count. 
SELECT  DISTINCT course_credits,
        COUNT(*) as 'count'
FROM    course
GROUP   BY course_credits

-- Count all enrollments per student
-- Show the student ID and count.
SELECT *,
        COUNT(student_id) AS 'count'
FROM    Enrollment
GROUP   BY student_id 