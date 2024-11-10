-- Author: Christopher Miller
-- Relational Database
-- Using ExampleCollege Database
-- Joining Tables

-- Select instructor and department information on instructors.
-- Show the instructor ID, instructor name (last and first),
-- department description, department office and phone #. 
SELECT      i.instructor_id,
            i.instructor_last_name, 
            i.instructor_first_name,
            d.department_desc,
            d.department_office,
            d.department_phone
FROM        instructor i
INNER JOIN  department d 
                ON i.department_id 
                    = d.department_id
-- Sort the result by department description, instructor last name
--      and first name. 
ORDER BY    d.department_desc, 
            i.instructor_last_name, 
            i.instructor_first_name;
-----------------------------------------------------------------

-- Retrieve instructor and department information on instructors 
--      who are in DRAMA or MUSIC department.
-- Show the department description, 
-- instructor ID and instructor name (last and first).
SELECT      d.department_desc,
            i.instructor_id,
            i.instructor_last_name,
            i.instructor_first_name
FROM        instructor i
INNER JOIN  department d 
                ON i.department_id 
                    = d.department_id
WHERE       d.department_desc 
                LIKE '%DRAMA%' 
                    OR '%MUSIC%'
-- Sort the result by department description, instructor last 
--      name and then first name. 
ORDER BY    d.department_desc,
            i.instructor_last_name,
            i.instructor_first_name;
-----------------------------------------------------------------

-- Retrieve instructor and course informationo n instructors 
--      teaching MUSIC courses.
-- Display the instructor ID, instructor name as last/first,
-- instructor phone#, course ID and course name. 
SELECT      i.instructor_id,
            CONCAT(i.instructor_last_name, ', ', i.instructor_first_name) 
                AS instructor_name,
            i.instructor_phone,
            c.course_id,
            c.course_name
FROM        instructor i
INNER JOIN  course c 
                ON i.instructor_id 
                    = c.instructor_id
WHERE       c.course_id 
                LIKE 'MUSIC%'
-- Sort the result by instructor last name and then first name.
ORDER BY    i.instructor_last_name, 
            i.instructor_first_name;
-----------------------------------------------------------------

-- Retrieve course and instructor information on courses that are 
--      taught by instructor Mark Robinson.
-- Show the course ID, course name, credits and
-- instructor name.
SELECT      c.course_id,
            c.course_name,
            c.course_credits,
            i.instructor_last_name,
            i.instructor_first_name
FROM        course c
INNER JOIN  instructor i 
                ON c.instructor_id 
                    = i.instructor_id
WHERE       i.instructor_first_name    
                = 'Mark' 
                    AND i.instructor_last_name 
                        = 'Robinson';
-----------------------------------------------------------------

-- Retrieve course and instructor information on the Lab type 
--      courses with 4 credits or more. 
-- Show the course ID, course type, course name, credits
-- and instructor name. 
SELECT      c.course_id,
            'Lab' 
                AS course_type,
            c.course_name,
            c.course_credits,
            CONCAT(i.instructor_last_name, ', ', i.instructor_first_name) 
                AS instructor_name
FROM        course c
INNER JOIN  instructor i 
                ON c.instructor_id 
                    = i.instructor_id
WHERE       c.course_type 
                = 'Lab' 
                    AND c.course_credits >= 4
-- Sort the result by course ID. 
ORDER BY    c.course_id;
-----------------------------------------------------------------

-- Retrieve student and course information on students who are 
--      enrolled in 17SP term. 
-- Show the student ID, student name,
-- course ID, course name and credits. 
SELECT      s.student_id,
            CONCAT(s.student_last_name, ', ', s.student_first_name) 
                AS student_name,
            e.course_id,
            c.course_name,
            c.course_credits
FROM        student s
INNER JOIN  enrollment e 
                ON s.student_id 
                    = e.student_id
INNER JOIN  course c 
                ON e.course_id 
                    = c.course_id
WHERE       e.term_id 
                = '17SP'
-- Sort the result by student last name, first name and course ID. 
ORDER BY    s.student_last_name, 
            s.student_first_name, 
            e.course_id;
-----------------------------------------------------------------

-- Retrieve student and course information on all enrollments for
--      student Emily Waltham.
-- Display the course ID, course name, credits, grade and 
--      student name (last and first). 
SELECT      e.course_id,
            c.course_name,
            c.course_credits,
            e.grade,
            s.student_last_name,
            s.student_first_name
FROM        student s
INNER JOIN  enrollment e   
                ON s.student_id 
                    = e.student_id
INNER JOIN  course c    
                ON e.course_id  
                    = c.course_id
WHERE       s.student_last_name     
                = 'Waltham' 
                    AND s.student_first_name 
                        = 'Emily'
-- Sort the result by course ID. 
ORDER BY e.course_id;
-----------------------------------------------------------------

-- Retrieve distinct student information on students who have 
--      received scholarships. 
-- Show only the student ID and name.
SELECT      DISTINCT s.student_id,
            CONCAT(s.student_last_name, ', ', s.student_first_name) 
                AS student_name
FROM        student s
INNER JOIN  scholarship sc 
                ON s.student_id 
                    = sc.student_id
ORDER BY    student_name;
-----------------------------------------------------------------

-- Retrieve student and scholarship information on students who 
--      have received scholarships less than $500.
-- Show only the student ID, student name, scholarship type 
--      description and scholarship amount.
SELECT      s.student_id,
            CONCAT(s.student_last_name, ', ', s.student_first_name) 
                AS student_name,
            st.scholarship_type_desc,
            sc.scholarship_amount
FROM        student s
INNER JOIN  scholarship sc 
                ON s.student_id 
                    = sc.student_id
INNER JOIN  scholarshiptype st 
                ON sc.scholarship_type_id 
                    = st.scholarship_type_id
WHERE       sc.scholarship_amount < 500
-- Sort the result by student last name, first name, 
-- and scholarship amount in descending order.
ORDER BY    s.student_last_name,
            s.student_first_name DESC, 
            sc.scholarship_amount DESC;
-----------------------------------------------------------------

-- Retrieve student and scholarship information on students who
--      have received Academic or Technology scholarships.
-- Display the term description, student ID, 
-- student name, scholarship type description,
-- and scholarship amount. 
SELECT      e.term_id,
            s.student_id,
            CONCAT(s.student_last_name, ', ', s.student_first_name) AS student_name,
            st.scholarship_type_desc,
            sc.scholarship_amount
FROM        student s
INNER JOIN  scholarship sc 
                ON s.student_id 
                    = sc.student_id
INNER JOIN  scholarshiptype st 
                ON sc.scholarship_type_id 
                    = st.scholarship_type_id
INNER JOIN  enrollment e 
                ON s.student_id 
                    = e.student_id
WHERE       st.scholarship_type_desc 
				= 'Academic' 
					OR st.scholarship_type_desc 
						= 'Technology'
-- Sort the result by term start date in descending order
-- and then student last name and first name.
GROUP BY    e.term_id, 
            s.student_id, 
            student_name, 
            st.scholarship_type_desc, 
            sc.scholarship_amount
ORDER BY    e.term_id DESC,
            s.student_last_name, 
            s.student_first_name;
-----------------------------------------------------------------
