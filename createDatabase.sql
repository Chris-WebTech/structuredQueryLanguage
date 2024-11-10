-- Author: Christopher Miller
-- Relational Database - Example College
-- Create Database and Populate Tables

-- Example Database to communicate with
CREATE DATABASE IF NOT EXISTS ExampleCollege;
USE ExampleCollege;

-- --------------------------------------
-- ------ CREATE TABLES -----------------
-- --------------------------------------

-- Create Table term
create table if not exists term
(
term_id varchar(5) not null,
term_desc varchar(20),
term_start_date date,
term_end_date date,
term_active_flag boolean default 0,
constraint pk_term primary key (term_id)
);

-- Create Table scholarshiptype
create table if not exists scholarshiptype
(
scholarship_type_id varchar(10) not null,
scholarship_type_desc varchar(50),
constraint pk_scholarshiptype primary key (scholarship_type_id)
);

-- Create Table department
create table if not exists department
(
department_id varchar(10) not null,
department_desc varchar(50),
department_office varchar(20),
department_phone varchar(20),
constraint pk_department primary key (department_id)
);

-- create Table instructor
create table if not exists instructor
(
instructor_id varchar(10) not null,
instructor_last_name varchar(50) not null,
instructor_first_name varchar(50) not null,
instructor_office varchar(20),
instructor_phone varchar(20),
department_id varchar(10), 
constraint pk_instructor primary key (instructor_id),
constraint fk_instructor_department_id foreign key (department_id) references department(department_id)
);

-- Create Table student
create table if not exists student
(
student_id varchar(10) not null,
student_last_name varchar(50) not null, 
student_first_name varchar(50) not null,
student_birth_date date,
student_admit_date date,
student_email varchar(50),
constraint pk_student primary key (student_id)
);

-- Create Table course
create table if not exists course
(
course_id varchar(10) not null,
course_type varchar(10),
course_name varchar(100),
course_credits float(5,1),
course_max_enrollment integer,
instructor_id varchar(10),
course_comment text,
constraint pk_course primary key (course_id),
constraint fk_class_instructor_id foreign key (instructor_id) references instructor (instructor_id)
);

-- create scholarship table
create table if not exists scholarship
(
scholarship_id int unsigned not null auto_increment,
term_id varchar(5),
student_id varchar(10),
scholarship_amount decimal (7,2),
scholarship_type_id varchar(10),
scholarship_approved_date datetime,
constraint pk_scholarship primary key (scholarship_id),
constraint fk_scholarship_term_id foreign key (term_id) references term (term_id),
constraint fk_scholarship_student_id foreign key (student_id) references student (student_id),
constraint fk_scholarship_type_id foreign key (scholarship_type_id) references scholarshiptype(scholarship_type_id)
);

-- create enrollment table
create table if not exists enrollment
(
enrollment_id int unsigned not null auto_increment,
term_id varchar(5),
course_id varchar(10), 
student_id varchar(10),
grade varchar(2),
constraint pk_enrollment primary key (enrollment_id),
constraint fk_enrollment_term_id foreign key (term_id) references term (term_id),
constraint fk_enrollment_course_id foreign key (course_id) references course (course_id),
constraint fk_enrollment_student_id foreign key (student_id) references student (student_id)
);

-- --------------------------------------
-- ---------- POPULATE TABLES -----------
-- ******* DATA USED IS NOT REAL ********

-- populate term table
insert into term
(term_id, term_desc, term_start_date, term_end_date, term_active_flag)
values
('15FA', '2015 Fall', '2015-08-27', '2015-12-17', 0),
('16SP', '2016 Spring', '2016-01-21', '2016-05-19', 0),
('16SU', '2016 Summer', '2016-05-31', '2016-08-05', 0),
('16FA', '2016 Fall', '2016-08-25', '2016-12-15', 0),
('17SP', '2017 Spring', '2017-01-17', '2017-05-11', 1),
('17SU', '2017 Summer', '2017-05-30', '2017-08-04', 0),
('17FA', '2017 Fall', '2017-08-28', '2017-12-11', 0);

-- populate department table
insert into department
(department_id, department_desc, department_office, department_phone)
values
('DRAMA', 'Dept. of Drama', 'AT 201', '406-756-1123'),
('CULA', 'Dept. of Culinary Arts', NULL, NULL),
('PALN', 'Dept. of Paleontology', 'RH 110', '406-756-3109'),
('MKTG', 'Dept. of Marketing', 'BSS 115', '406-756-5942'),
('MUSIC', 'Dept. of Music', 'AT 150', '406-756-2468'),
('FASH', 'Dept. of Fashion', 'BC 120', '406-756-8340'),
('IT', 'Dept. of Information Technology', 'BSS 113', NULL),
('STAT', 'Dept. of Statistics', 'BSS 117', '406-756-3719'),
('BSCI', 'Dept. of Biosciences', 'RH 115', '406-756-2703');

-- populate scholarshiptype table
insert into scholarshiptype
(scholarship_type_id, scholarship_type_desc)
values
('ACAD', 'Academic Scholarship'),
('VA', 'VA Scholarship'),
('COMM', 'Community Service Scholarship'),
('FED', 'Federal Scholarship'),
('TECH', 'Technology Scholarship'),
('CREAT', 'Creative Scholarship'),
('ATHL', 'Athletic Scholarship'),
('CORP', 'Corporate Scholarship');

-- populate instructor table
insert into instructor
(instructor_id, instructor_last_name, instructor_first_name, instructor_office, instructor_phone, department_id)
values
('F001', 'Robinson', 'Mark', 'BSS 135', '653-756-5980',  'MKTG'),
('F002', 'Becker', 'Pete', NULL, NULL, 'MKTG'),
('F003', 'Leonard', 'Estelle', 'AT 206', '546-756-1333', 'DRAMA'),
('F004', 'Hobart', 'Benjamin', 'RH 121', '345-756-3709',  'PALN'),
('F005', 'Hannigan', 'Mike', 'AT 155', NULL, 'MUSIC'),
('F006', 'Stevens', 'Paul', NULL, NULL, 'CULA'),
('F007', 'Wheeler', 'Charlie', 'RH 122', '394-756-4709', 'PALN'),
('F008', 'Willick', 'Gunther', 'BC 130', '344-756-8935', 'FASH'),
('F009', 'Jones', 'Tag', 'BC 130', '983-756-8930', 'FASH'),
('F010', 'Hunter', 'Bobby', 'AT 205', '234-756-2540', 'DRAMA'),
('F011', 'Heckles', 'Tim', 'AT 155', '432-756-5611', 'MUSIC'),
('F012', 'Flay', 'Bobby', NULL, NULL, NULL),
('F013', 'Lauren', 'Ralph', NULL, NULL, NULL);

-- populate student table
insert into student
(student_id, student_last_name, student_first_name, student_birth_date, student_admit_date, student_email)
values
('A001', 'Buffay', 'Phoebe', '1985-05-11', '2015-11-20', 'phoebe@friends.edu'),
('A002', 'Bing', 'Chandler', '1984-02-09', '2015-08-01', 'chandler@friends.edu'),
('A003', 'Green', 'Rachel', NULL, '2016-05-27', NULL),
('A004', 'Geller', 'Ross', '1984-08-17', '2016-01-19', 'ross@friends.edu'),
('A005', 'Tribbiani', 'Joey', NULL, '2016-04-29', 'joey@friends.edu'),
('A006', 'Geller', 'Monica', '1985-12-05', NULL, Null),
('A007', 'Buffay', 'Ursula', '1985-05-11', '2016-10-15', 'ursula@friends.edu'),
('A008', 'Green', 'Amy', NULL, '2016-09-09', 'amy@friends.edu'),
('A009', 'Waltham', 'Emily', '1986-07-03', '2015-10-13', 'emily@friends.edu'),
('A010', 'Buffay', 'Frank', NULL, '2017-01-09', NULL),
('A011', 'Stevens', 'Elizabeth', '1994-11-02', '2017-01-22', NULL);

-- Populate course table
insert into course
(course_id, course_type, course_name, course_credits, course_max_enrollment, instructor_id, course_comment)
values
('DRAMA_101', 'Lec', 'Intro to Acting I - The Basics', 3, 15, 'F003', NULL),
('DRAMA_102', 'Lec', 'Intro to Acting II - Getting Specific', 3, 10, 'F010', NULL),
('DRAMA_150', 'Lec', 'Intro to Auditioning', 4, 10, 'F003', 'Requires instructor\'s signature'),
('DRAMA_211', 'Lec', 'Film/TV', 3, 15, 'F003', NULL),
('DRAMA_250', 'Lec', 'Improvisation', 3, 10, 'F010', NULL),
('PALN_101', 'Lec', 'Intro to Paleontology', 3, 20, 'F007', NULL),
('PALN_111', 'Lec', 'Intro to Dinosaurs', 3, 20, 'F004', NULL),
('PALN_201', 'Lab', 'Field Paleontology', 5, 10, 'F004', 'Requires add\'l fee of $75.00'),
('PALN_213', 'Lab', 'Paleontology Lab Techniques', 3, 10, 'F007', 'Requires add\'l fee of $75.00'),
('FASH_105', 'Lec', 'Fasion Design I', 3, 20, 'F009', NULL),
('FASH_111', 'Lab', 'Construction/Draping/Flat Pattern 1', 4, 10, 'F008', 'Requires add\'l fee of $50.00'),
('FASH_175', 'Lec', 'Intro to Fashion Fabrics', 3, 20, 'F009', NULL),
('FASH_205', 'Lec', 'Fashion Design II', 3, 20, 'F009', NULL),
('FASH_211', 'Lab', 'Construction/Draping/Flat Pattern 2', 4, 10, 'F008', 'Requires add\'l fee of $50.00'),
('FASH_230', 'Lec', 'Fashion Trend Analysis', 3, 25, 'F008', NULL),
('MUSIC_101', 'ssLec', 'Intro to Music Scale', 0.5, 30, 'F011', NULL),
('MUSIC_107', 'Lec', 'Intro to Music Theory', 3, 25, 'F011', NULL),
('MUSIC_121', 'Lec', 'Guitar I', 3, 10, 'F005', 'Must bring your own instrument'),
('MUSIC_221', 'Lec', 'Guitar II', 3, 10, 'F005', 'Must bring your own instrument'),
('MKTG_111', 'Lec', 'Marketing I', 3, 20, 'F001', NULL),
('MKTG_121', 'Lec', 'Marketing II', 3, 20, 'F001', NULL),
('MKTG_135', 'Lec', 'Marketing Strategy', 2, 15, 'F002', NULL),
('MKTG_165', 'Lec', 'Intro to Social Media Marketing', 3, 25, 'F001', NULL),
('MKTG_217', 'Lec', 'Digital Marketing', 3, 25, 'F002', NULL);

-- populate enrollment table
insert into enrollment
(term_id, course_id, student_id, grade)
values
('16SP', 'MUSIC_101', 'A001', 'C'),
('16FA', 'MUSIC_121', 'A001', 'B'),
('17SP', 'MUSIC_221', 'A001', NULL),
('15FA', 'MKTG_111', 'A002', 'B'),
('16SP', 'MKTG_121', 'A002', 'C'),
('16SP', 'MKTG_135', 'A002', 'B'),
('16FA', 'MKTG_165', 'A002', 'A'),
('16SU', 'PALN_101', 'A004', 'A'),
('16FA', 'PALN_111', 'A004', 'A'),
('17SP', 'PALN_201', 'A004', NULL),
('16FA', 'DRAMA_101', 'A005', 'C'), 
('16FA', 'DRAMA_150', 'A005', 'C'),
('16FA', 'MUSIC_121', 'A005', 'D'),
('17SP', 'DRAMA_102', 'A005', NULL),
('17SP', 'DRAMA_250', 'A005', NULL),
('17SP', 'DRAMA_211', 'A005', NULL),
('16FA', 'FASH_105', 'A003', 'B'),
('16FA', 'FASH_111', 'A003', 'C'),
('17SP', 'FASH_175', 'A003', NULL),
('17SP', 'FASH_205', 'A003', NULL),
('17SP', 'MKTG_111', 'A007', NULL),
('17SP', 'MKTG_135', 'A007', NULL),
('17SP', 'FASH_105', 'A008', NULL),
('16SP', 'MKTG_111', 'A009', 'B'),
('16SP', 'MKTG_135', 'A009', 'A'),
('16FA', 'MKTG_121', 'A009', 'A'),
('16FA', 'MKTG_217', 'A009', 'A'),
('17SP', 'MKTG_165', 'A009', NULL);

-- populate scholarship table
-- database time references 24 hour time
-- date YYYY-MM-DD
insert into scholarship
(term_id, student_id, scholarship_amount, scholarship_type_id, scholarship_approved_date)
values
('16FA', 'A001', 450.00, 'COMM', '2016-07-19 10:11:00'),
('17SP', 'A001', 470.50, 'COMM', '2016-11-28 14:23:00'),
('17SP', 'A001', 712.75, 'FED', '2016-12-15 18:45:00'),
('15FA', 'A002', 575.00, 'FED', '2015-09-02 09:54:00'),
('15FA', 'A002', 231.99, 'TECH', '2015-08-11 12:35:00'),
('16SP', 'A002', 890.53, 'FED', '2016-01-13 15:23:00'),
('16FA', 'A002', 726.79, 'ACAD', '2016-05-17 09:02:00'),
('16FA', 'A004', 1200.00, 'ACAD', '2016-04-30 16:49:00'),
('17SP', 'A004', 958.00, 'ACAD', '2016-12-05 10:23:00'),
('16FA', 'A005', 319.76, 'COMM', '2016-06-20 11:43:00'),
('17SP', 'A005', 469.85, 'COMM', '2017-01-05 08:36:00'),
('17SP', 'A003', 536.90, 'CREAT', '2017-01-09 09:55:00'),
('16FA', 'A009', 650.00, 'ACAD', '2016-08-29 14:45:00'),
('17SP', 'A009', 581.00, 'ACAD', '2016-11-18 15:11:00'),
('17SP', 'A009', 375.80, 'TECH', '2017-01-23 08:38:00');
