/* 
-- CSCI 240 Databases and SQL
-- SQL Homework 4 - SQL - Select Intro
-- Name: CHRISTOPHER MILLER
----------------------------------------------------
-- Instructions:
-- 1) Run the homework db/data setup file
--    The SQL file contains SQL statements to create and populate tables needed for the Homework.
--    Make sure you select a database before running the setup file.
-- 2) Write SQL statements to the following questions. 
--    Run the SQL statements to make sure they are producing the correct result. 
-- 3) Submit your file as a .sql file. 
--    Please make sure the filename is in the following format:
--       SQLhomework4_lastname_firstname.txt
-------------------------------------------------------
*/


--1. Write a query that selects all of the student data in the student table. 
SELECT  student_id,
	student_last_name,
	student_first_name,
        student_birth_date,
        student_admit_date,
        student_email
FROM    student;


/*
--or--

SELECT  *
FROM    student;

*/

-- 2. Write a query that selects student ID, student last name, student first name and admitted date 
--    from the student table. 
SELECT  student_id,
	student_last_name,
	student_first_name,
        student_admit_date
FROM    student;


-- 3. Write a query that selects all of the student data in the student table and
--    sorts the result by student birth date in ascending order.
SELECT  *
FROM    student
ORDER BY student_birth_date;


-- 4. Write a query that selects all students with last name of 'Buffay' from the student table. 
--    Sort the result by student last name and then student first name (in ascending order).
SELECT  student_id,
	student_last_name,
        student_first_name,
        student_email,
        student_admit_date
FROM    student
WHERE   student_last_name = 'Buffay'
ORDER BY student_admit_date asc;


-- 5. Write a query that selects all of the students who are admitted after Jan. 1, 2017 in the student table.
--    Show only the student ID, student last name, student first name and the admitted date. 
--    Sort the result by admitted date in descending order. 
SELECT  student_id              AS 'Student ID',
	student_last_name       AS 'Last Name',
	student_first_name      AS 'First Name',
        student_admit_date      AS 'Admited'
FROM    student 
WHERE   student_admit_date       > '2017-01-01'
ORDER BY student_admit_date     desc;


-- 6. Write a query that selects the Department ID of 'MKTG' record in the department table. 
--    Show all fields. 
SELECT  department_id           AS 'Depatment ID',
        department_desc         AS 'Description',
        department_office       AS 'Office',
        department_phone        AS 'Phone Number'
FROM    department              
WHERE   Department_ID            =  'MKTG';

        
-- 7. Write a query that selects all of the term data in the term table. 
--    Show only the term description, term start date and end date. 
--    Sort the result by term start date in descending order. 
SELECT  term_desc,
        term_start_date,
        term_end_date               
FROM    term                   
ORDER BY    term_start_date      desc;


-- 8. Write a query that selects all instructors with office located in 'BC 130' in the instructor table. 
--    Show all fields and rename the output columns as following:
--      instructor_id => Instructor ID
--      instructor_last_name => Last Name
--      instructor_first_name => First Name
--      instructor_office => Office
--      instructor_phone => Phone
--      department_id => Department

SELECT  instructor_id           AS 'Instructor ID',
        instructor_last_name    AS 'Last Name',
        instructor_first_name   AS 'First Name',
        instructor_office       AS 'Office',
        instructor_phone        AS 'Phone',
        department_id           AS 'Department'
FROM    instructor              
WHERE   instructor_office        = 'BC 130';


-- 9. Write a query that selects all of the instructor data in the instructor table.
--    Show only the instructor ID, instructor last name, instructor first name and the department ID.
--    Sort the result by department ID in ascending order, instructor last name in descending order 
--    and then first name in ascending order. 
SELECT  instructor_id           AS 'Instructor ID',
        instructor_last_name    AS 'Last Name',
        instructor_first_name   AS 'First Name',
        department_id           AS 'Department'
FROM    instructor
ORDER BY instructor_last_name   DESC,
         instructor_first_name  ASC,
         department_id          DESC;


-- 10. Write a query that selects all instructors who are in PALN department in the instructor table. 
--     Show all fields. 
SELECT  *
FROM    instructor
WHERE   department_id    = 'PALN';



-- 11. Write a query that selects all instructors who are not in DRAMA department in the instructor table. 
--     Show all fields. 
SELECT  *
FROM    instructor
WHERE   department_id    != 'DRAMA';


-- 12. Write a query that selects the course ID of 'MUSIC_221' record in the Course table. 
--     Show only the course ID, course name, credits, max enrollment, instructor ID and comment.
SELECT  course_id,
        course_name,
        course_credits,
        course_max_enrollment,
        instructor_id,
        course_comment
FROM    course
WHERE   course_id         = 'MUSIC_221';


-- 13. Write a query that selects all the courses that are taught by instructor ID = 'F004' in the course table. 
--     Show all fields and sort the result by course ID in ascending order. 
SELECT  *
FROM    course 
WHERE   instructor_id     = 'F004'
ORDER BY course_id      ASC;


-- 14. Write a query that selects all courses that can have 20 or more students enrolled in the course table. 
--     Show only the course ID, course name, course credits and course max enrollment. 
--     Sort the result by course max enrollment in descending order.
SELECT  course_id,
        course_name,
        course_credits,
        course_max_enrollment
FROM    course
WHERE   course_max_enrollment >= 20
ORDER BY course_max_enrollment DESC;


-- 15. Write a query that selects all courses that are 2 credits or less in the course table. 
--     Show only the course ID, coures type, course name and course credits. 
SELECT  course_id,
        course_type,
        course_name,
        course_credits
FROM    course
WHERE   course_credits      <= '2';


-- 16. Write a query that selects all of the students who have received and are receiving ACAD scholarship in the scholarship table. 
--     Show only the term ID, student ID and scholarship amount. 
SELECT  term_id,
        student_id,
        scholarship_amount
FROM    scholarship
WHERE   scholarship_type_id  = 'ACAD';


-- 17. Write a query that selects all of the students who have received a scholarship over $850.00 in the scholarship table.
--     Show all fields and sort the result by scholarship amount in descending order. 
SELECT  *
FROM    scholarship
WHERE   scholarship_amount   > '850.00'
ORDER BY scholarship_amount DESC;


-- 18. Write a query that selects all of the enrollment records for student ID of A005 in the enrollment table. 
--     Show all fields. 
--     Sort the result by term id in descending order and then course id in ascending order. 
SELECT  *
FROM    enrollment
WHERE   student_id           = 'A005'
ORDER BY term_id DESC,
         course_id ASC;


-- 19. Write a query that selects all of the enrollment records for students who have taken and are currently taking MKTG_135 course from the enrollment table. 
--     Show only the term id, student ID and the grade.
SELECT  term_id,
        student_id,
        grade
FROM    enrollment
WHERE   course_id            = 'MKTG_135';


-- 20. Write a query that selects all of the enrollment records for students who are taking classes in 17SP term. 
--     Show only the course ID and Student ID. 
--     Sort the result by Course ID in ascending order.
SELECT  course_id,
        student_id
FROM    enrollment
WHERE   term_id                  = '17SP'
ORDER BY course_id ASC;
