/* 
-- CSCI 240 Databases and SQL
-- Homework 11 - SQL - View


-- Name: 
----------------------------------------------------
-- Instructions:
-- 1) Run the homework-Views-DBCreation.sql file
--    The SQL file contains SQL statements to create and populate tables needed for Homework #11.
--    Make sure you select a database before running the homework11.sql file.
-- 2) Write SQL statements to the following questions. 
--    Run the SQL statements to make sure they are producing the correct result. 
-- 3) Submit your file as a .txt file. 
--    Please make sure the filename is in the following format:
--       homework11_lastname_firstname.txt
-------------------------------------------------------
*/

-- 1. Create a view that retrieves names and email addresses 
--     of all students and instructors. 
--  The view should display last name,  first name and 
--  the email address. 

CREATE VIEW v_emailListOne
            (StudentFname,StudentLname,StudentEmail)
AS          
SELECT      student_first_name,
            student_last_name,
            student_email
FROM        student
GROUP BY    student_last_name,
            student_first_name,
            student_email;
SELECT      *
FROM v_emailListOne;

-- 2. Write a query to retrieve all records from the View 
--    created from Question #1. 
--   Show all fields (name and email). 
--   Sort the result by last name and then first name. 

SELECT      *
FROM 		v_emailListOne
ORDER BY 	StudentLname,
            StudentFname;

-- 3. Create a view that retrieves the following information
--    for each student in scholarship table:
--    (a) student ID
--    (b) count the number of scholarships the student received
--    (c) retrieve the total amount of scholarship the student received

--  The View should display the student ID, 
--  the count of scholarships and the total scholarship amount. 
CREATE VIEW v_studentScholarshipAmount
            (studentID,SchCount,TotalAmount)

AS
SELECT      student_id, 
            COUNT(*),
            SUM(scholarship_amount)
FROM        scholarship
GROUP BY    student_id;

SELECT      *
FROM        v_studentScholarshipAmount;



-- 4. Write a query to retrieve all records from the view 
--    created from Question #3. 
--  Show all fields - student ID, count and the total amount. 

SELECT      *
FROM        v_studentScholarshipAmount
ORDER BY    studentID,

-- 5. Modify the query from Question #4 to retrieve 
--    only records with total amount greater than $2000. 
--  Show only the student ID and the total amount.

CREATE OR   REPLACE VIEW v_studentScholarshipAmount
            (studentID,SchCount,TotalAmount)

AS
SELECT      student_id, 
            COUNT(*),
            SUM(scholarship_amount)
FROM        scholarship
GROUP BY    student_id
HAVING      SUM(scholarship_amount) > 2000;

Select *
From v_studentScholarshipAmount;

-- 6. Create a view that joins the Student table and 
--    the view created from Question #3. 
--  The final view should display the student ID, 
--  student name (last and first), student admitted date, 
--  the count of scholarships and the total scholarship amount.

CREATE OR   REPLACE VIEW v_studentScholarshipAmount
            (studentID,SchCount,TotalAmount)

AS
SELECT      student_id, 
            COUNT(scholarship_id),
            SUM(scholarship_amount)
FROM        scholarship
GROUP BY    student_id;

SELECT      s.student_id, 
            s.student_last_name, 
            s.student_first_name, 
            s.student_admit_date, 
            v.SchCount, 
            v.TotalAmount
FROM        v_studentScholarshipAmount v INNER JOIN student s
ON          v.StudentID = s.student_id
ORDER BY    s.student_last_name;

-- 7.  Write a query to retrieve all records from the 
--     view created from Question #6. 
--  Show all fields - student ID, Name, admitted date, 
--  count and the total amount. 
--  Sort the result by the total amount in descending order.

SELECT      s.student_id, 
            s.student_last_name, 
            s.student_first_name, 
            s.student_admit_date, 
            v.SchCount, 
            v.TotalAmount
FROM        v_studentScholarshipAmount v INNER JOIN student s
ON          v.StudentID = s.student_id
ORDER BY    TotalAmount desc;

