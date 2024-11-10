-- Author: Christopher Miller
-- Relational Database
-- Selecting From Tables

-- Select all of the student data in the student table. 
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

-- Select student ID, student last name, student first name and admitted date 
--      from the student table. 
SELECT  student_id,
	student_last_name,
	student_first_name,
        student_admit_date
FROM    student;

-- Select all of the student data in the student table and
SELECT  *
FROM    student
-- sorts the result by student birth date in ascending order.
ORDER BY student_birth_date;

-- Select all students with last name of 'Buffay' from the student table. 
SELECT  student_id,
	student_last_name,
        student_first_name,
        student_email,
        student_admit_date
FROM    student
WHERE   student_last_name = 'Buffay'
-- Sort the result by student last name and then student first name.
ORDER BY student_admit_date asc;

-- Select all of the students who are admitted after Jan. 1, 2017 in the student table.
-- Show only the student ID, student last name, student first name and the admitted date. 
SELECT  student_id              AS 'Student ID',
	student_last_name       AS 'Last Name',
	student_first_name      AS 'First Name',
        student_admit_date      AS 'Admited'
FROM    student 
WHERE   student_admit_date       > '2017-01-01'
-- Sort the result by admitted date in descending order. 
ORDER BY student_admit_date     desc;

-- Select the Department ID of 'MKTG' record in the department table.
SELECT  department_id           AS 'Depatment ID',
        department_desc         AS 'Description',
        department_office       AS 'Office',
        department_phone        AS 'Phone Number'
FROM    department              
WHERE   Department_ID            =  'MKTG';

-- Select all of the term data (term table). 
-- Show only the term description, term start date and end date. 
SELECT  term_desc,
        term_start_date,
        term_end_date               
FROM    term                   
-- Sort the result by term start date in descending order. 
ORDER BY    term_start_date      desc;

-- Select all instructors with office located in 'BC 130' (instructor table). 
-- Show all fields and rename the output columns as following:
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

-- Select all of the instructor data in the instructor table.
-- Show only the instructor ID, instructor last name, instructor first name and the department ID.
SELECT  instructor_id           AS 'Instructor ID',
        instructor_last_name    AS 'Last Name',
        instructor_first_name   AS 'First Name',
        department_id           AS 'Department'
FROM    instructor
-- Sort the result by department ID in ascending order, instructor last name in descending order 
--      and then first name in ascending order. 
ORDER BY instructor_last_name   DESC,
         instructor_first_name  ASC,
         department_id          DESC;

-- Select all instructors who are in PALN department in the instructor table. 
SELECT  *
FROM    instructor
WHERE   department_id    = 'PALN';

-- Select all instructors who are not in DRAMA department in the instructor table. 
SELECT  *
FROM    instructor
WHERE   department_id    != 'DRAMA';

-- Select the course ID of 'MUSIC_221' record in the Course table. 
SELECT  course_id,
        course_name,
        course_credits,
        course_max_enrollment,
        instructor_id,
        course_comment
FROM    course
WHERE   course_id         = 'MUSIC_221';

-- Select all the courses that are taught by instructor ID = 'F004' in the course table. 
SELECT  *
FROM    course 
WHERE   instructor_id     = 'F004'
ORDER BY course_id      ASC;

-- Select all courses that can have 20 or more students enrolled in the course table. 
-- Show only the course ID, course name, course credits and course max enrollment. 
SELECT  course_id,
        course_name,
        course_credits,
        course_max_enrollment
FROM    course
WHERE   course_max_enrollment >= 20
-- Sort the result by course max enrollment in descending order.
ORDER BY course_max_enrollment DESC;

-- Select all courses that are 2 credits or less in the course table. 
-- Show only the course ID, coures type, course name and course credits. 
SELECT  course_id,
        course_type,
        course_name,
        course_credits
FROM    course
WHERE   course_credits      <= '2';
