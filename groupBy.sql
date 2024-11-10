-- Author: Christopher Miller
-- Relational Database
-- Using ExampleCollege Database
-- SQL Views - Group By

-- View retrieves names and email addresses of all
--      students
-- Display last name, first name, and email address. 
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
--------------------------------------------------------------

-- Retrieve all records from the View v_emailListSContact
-- Sort the result by last name and then first name. 
SELECT      *
FROM 		v_emailListOne
ORDER BY 	StudentLname,
            StudentFname;
--------------------------------------------------------------

-- View that retrieves the following information
--    for each student in scholarship table:
--    - student ID
--    - count the number of scholarships the student received
--    - retrieve the sum amount of scholarship the student 
--      received
--  Display the student ID, count of scholarships and the 
--      total scholarship amount. 
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
--------------------------------------------------------------

-- Retrieve all records from the view 
--    v_studentScholarshipAmount; 
--  Display All fields.
SELECT      *
FROM        v_studentScholarshipAmount
ORDER BY    studentID,
--------------------------------------------------------------

-- Filter records with total amount greater than $2000. 
-- Show only the student ID and the total amount.
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
--------------------------------------------------------------

-- View that joins the Student table and the 
--      v_studentScholarshipAmount view.
CREATE OR   REPLACE VIEW v_studentScholarshipAmount
            (studentID,SchCount,TotalAmount)

AS
--  Display the student ID,  student name, 
--      student admitted date, 
--  the count of scholarships and the total scholarship amount.
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
--------------------------------------------------------------

-- Retrieve all records from the 
--     v_studentScholarshipAmount v INNER JOIN student s
--  Display student ID, Name, admitted date,
SELECT      s.student_id, 
            s.student_last_name, 
            s.student_first_name, 
            s.student_admit_date, 
            v.SchCount, 
            v.TotalAmount
FROM        v_studentScholarshipAmount v INNER JOIN student s
ON          v.StudentID = s.student_id
--  Sort the result by the total amount in descending order.
ORDER BY    TotalAmount desc;
--------------------------------------------------------------

