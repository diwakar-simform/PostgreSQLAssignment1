-- Current Database : assignment1

-- Table 1 : trainee 
CREATE TABLE trainee(
	trainee_id SERIAL PRIMARY KEY,
	trainee_name VARCHAR(150),
	trainee_stack VARCHAR(150)
);

-- Inserting data into trainee table
INSERT INTO trainee	
	(trainee_name,trainee_stack)
VALUES
	('Diwakar','java'),
	('Kamran','React'),
	('Hemaxi','PHP'),
	('Laxmi','Blockchain'),
	('Gowtham','Blockchain');

-- viewing all data of trainee table
SELECT * FROM trainee;


-- Table 2 : employee
CREATE TABLE employee(
	employee_id SERIAL PRIMARY KEY,
	employee_name VARCHAR(150),
	employee_stack VARCHAR(100),
	employee_salary BIGINT
);

-- Inserting data into employee table
INSERT INTO employee
	(employee_name,employee_stack,employee_salary)
VALUES
	('Rohan','React',50000),
	('Mohit','Java',40000),
	('Rajesh','Mean',50000),
	('Rahul','.net',60000),
	('Sahul','Python',70000);

-- Viewing data of employee table
SELECT * FROM employee;

-- Created a databse : Assignment1
CREATE DATABASE Assignment1
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
		
--Current database : Assignment1

-- Creating table : course
CREATE TABLE course(
	course_id SERIAL PRIMARY KEY,
	course_name VARCHAR(150),
	course_fee BIGINT
);

-- INSERT INTO : course table
INSERT INTO course
	(course_name,course_fee)
VALUES
	('JAVA',12000),
	('HTML',5000),
	('CSS',6000),
	('Java Script',8000),
	('Spring Boot',15000),
	('Hibernate',10000),
	('Unit Testing',12000),
	('React',50000),
	('MEAN',40000),
	('IOT',30000);

-- VIEWING ALL DATA : course table
SELECT * FROM course;

-- CREATING TABLE : student table
CREATE TABLE student(
	student_id SERIAL PRIMARY KEY,
	student_name VARCHAR(150) NOT NULL,
	student_age INT NOT NULL,
	student_email VARCHAR(150) UNIQUE,
	student_course_id INT,
	
	FOREIGN KEY(student_course_id) REFERENCES course(course_id)
);

-- INSERTING DATA : student table
INSERT INTO student
	(student_name,student_age,student_email,student_course_id)
VALUES
	('Diwakar Kumar',23,'diwakar@gmail.com',5),
	('Hinal Pachori',22,'hinal@gmail.com',1),
	('Nimit Mandaviya',23,'nimit@gmail.com',6),
	('Shruti Pandey',25,'shruti@gmail.com',7),
	('Shailesh Darji',23,'shailesh@gmail.com',7),
	('Arpit Panchal',21,'arpit@gmail.com',6),
	('Parth Solanki',22,'parth@gmail.com',6),
	('Yash Tailor',26,'yash@gmail.com',1),
	('Hardeek Bhatia',23,'hardeek@gmail.com',1),
	('Likita Rai',22,'likita@gmail.com',5);

-- VIEWING DATA : student table
SELECT * FROM student;

-- CREATING A VIEW : student table
CREATE OR REPLACE VIEW v_student_name AS
SELECT
	student_name
FROM student;

-- VIEWING DATA FROM : v_student_name VIEW
SELECT * FROM v_student_name;

-- PERFORMING INNER JOIN : student,course table
SELECT
	s.student_id,
	s.student_name,
	s.student_email,
	
	c.course_name as "assigned_course",
	c.course_fee as "course_fee"
FROM student s
INNER JOIN course c ON c.course_id = s.student_course_id;
