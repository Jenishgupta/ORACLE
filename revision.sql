CREATE DATABASE temp1;
DROP DATABASE temp1;

CREATE DATABASE temp2;
DROP DATABASE temp2;

-- single line comment
/* multiple line 
comments */

CREATE TABLE student (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);

INSERT INTO student VALUES (1, "JENISH", 23);
INSERT INTO student VALUES (2, "DHIRAJ", 24);
INSERT INTO student VALUES (3, "ABHISHEK", 24);
INSERT INTO student VALUES (4, "PRIYA", 22);

SELECT * FROM student;

SHOW DATABASES;
SHOW TABLES;
DROP TABLE student;
---------------------------------
CREATE DATABASE college;
USE college;

CREATE TABLE student (
	rollno INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO student VALUES (1, "JENISH");
INSERT INTO student VALUES (2, "DHIRAJ");
INSERT INTO student VALUES (3, "ABHI");
INSERT INTO student VALUES (4, "RAM");

INSERT INTO student (rollno, name) VALUES (5, "MARCOS"), (6, "JON"), (7, "JENNY");
INSERT INTO student VALUES (5, "MARCOS"), (6, "JON"), (7, "JENNY");
-- both case work
SELECT *FROM student;

------ practise question_1
CREATE DATABASE Nexi;
CREATE TABLE Emp (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT NOT NULL
);
INSERT INTO Emp VALUES (1, "ADAM", 25000);
INSERT INTO Emp (id, name, salary) VALUES (2, "BOB", 30000), (3, "CASLEY", 40000);
SELECT * FROM Emp;
------------ done
USE Nexi;
SHOW TABLES;
DESCRIBE Emp;
SELECT * FROM Emp;
--- work if appln close--

---- default constraint 
CREATE TABLE temp (
	id INT,
    salary INT DEFAULT 25000
    );
INSERT INTO temp VALUES (1, 30000);
INSERT INTO temp (id) VALUES (2);
SELECT * FROM temp;

---- check constraint
CREATE TABLE temp1 (
	id INT PRIMARY KEY,
    age INT CHECK (age>=18)
    );
INSERT INTO temp1 VALUES (1, 17); -- not run
INSERT INTO temp1 VALUES (1, 19); -- run
SELECT * FROM temp1;

USE college;
SHOW tables;
DROP TABLE emp;
SELECT * FROM student;
RENAME TABLE student TO tempstudent; -- for rename

------ creating new list/ table
CREATE TABLE student (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(2),
    city VARCHAR(30)
);
INSERT INTO student (rollno, name, marks, grade, city) VALUES
(1, "DEV", 78, "A", "Pune"),
(2, "Aarav", 85, "A", "Mumbai"),
(3, "Ishita", 72, "B", "Delhi"),
(4, "Rohan", 66, "C", "Bengaluru"),
(5, "Meera", 90, "A", "Hyderabad"),
(6, "Aditya", 59, "D", "Kolkata"),
(7, "Simran", 81, "A", "Chennai"),
(8, "Karan", 70, "B", "Ahmedabad"),
(9, "Priya", 65, "C", "Jaipur"),
(10, "Vikram", 88, "A", "Lucknow");
-----------------------------------------------
SELECT * FROM student; -- to all view
SELECT name,city FROM student; -- to selected view
SELECT DISTINCT city FROM student; -- TO show only unique city(remove duplicate)
--------------------------------------------------
SELECT * FROM student WHERE marks > 80;
SELECT * FROM student WHERE city ="mumbai";
SELECT * FROM student WHERE marks+20 > 100;
SELECT * FROM student WHERE marks > 80 AND city ="mumbai";
SELECT * FROM student WHERE marks > 80 OR city ="mumbai";
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student WHERE city IN ("mumbai", "Delhi");
SELECT * FROM student WHERE city NOT IN ("mumbai", "Delhi");
----------------------------------------------------
SELECT * FROM student LIMIT 3;
SELECT * FROM student WHERE marks > 75 LIMIT 3;
-----------------------------------------------------
USE college; -- (reuse table after exit:)
SELECT * FROM student ORDER BY city ASC; -- for ascending order
SELECT * FROM student ORDER BY marks DESC; -- for descending order
SELECT * FROM student ORDER BY city ASC LIMIT 3; -- for ascending and limit clause
-------------------------------------------------
SELECT marks FROM student; -- show only marks
SELECT COUNT(name) FROM student; -- total count
SELECT MAX(marks) FROM student; -- for max fun
SELECT MIN(marks) FROM student; -- forn min fun
SELECT SUM(marks) FROM student; -- sum of all marks
SELECT AVG(marks) FROM student; -- average of all marks
---------------------------
SELECT city, COUNT(city) FROM student GROUP BY city; -- for city
SELECT grade, COUNT(grade) FROM student GROUP BY grade; -- for grade
SELECT city, COUNT(grade) FROM student GROUP BY city; -- for city -grade
SELECT city, COUNT(rollno) FROM student GROUP BY city; -- for city - rollno
SELECT city, name, COUNT(city) FROM student GROUP BY city, name; -- show city, name and count(city)
SELECT city, AVG(marks) FROM student GROUP BY city; -- for get avg in every city
SELECT city, AVG(marks), COUNT(city)  FROM student GROUP BY city; -- show city, avg marks, city count
-----------------------------
--  Q1-(Query to find avg marks in each city in ascending order)
SELECT city, AVG(marks) FROM student GROUP BY city ORDER BY city ASC;
-----------------------------------
SELECT city, COUNT(city) FROM student GROUP BY city HAVING MAX(marks) >85;

------------------------ (General Order) -----------------------------------
SELECT city, name
FROM student
WHERE grade ="A"
GROUP BY city, name
HAVING MAX(marks) >85
ORDER BY city ASC; 
-------------------------------
------------ (update) ----
UPDATE student SET grade = "O" WHERE grade = "A";

------- (DELETE) -----
DELETE FROM student WHERE marks < 33;

------ Foreign key ----
CREATE TABLE dept (
id INT PRIMARY KEY,
name VARCHAR (50)
);
CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);
DROP TABLE teacher; -- for drop table
INSERT INTO dept (id, name) VALUES
(101,"Science"),
(102,"English"),
(103,"Hindi");
INSERT INTO teacher (id, name, dept_id) VALUES
(101,"Adam", 101),
(102,"Bob", 103),
(103,"Casey", 102),
(104,"Marley", 102);
UPDATE dept SET id = 104 WHERE id = 102; -- update id no. for checked cascade
SELECT * FROM dept;
SELECT * FROM teacher;

------- ALTER -------
ALTER TABLE student ADD COLUMN age INT; -- for add column
ALTER TABLE student DROP COLUMN age; -- for drop column
ALTER TABLE student ADD COLUMN age INT;
UPDATE student SET age = 18 WHERE rollno = 1;
UPDATE student SET age = 20 WHERE rollno = 2;
UPDATE student SET age = 18 WHERE rollno = 3;
UPDATE student SET age = 19 WHERE rollno = 4;
UPDATE student SET age = 17 WHERE rollno = 5;
UPDATE student SET age = 21 WHERE rollno = 6;
UPDATE student SET age = 20 WHERE rollno = 7;
UPDATE student SET age = 18 WHERE rollno = 8;
UPDATE student SET age = 19 WHERE rollno = 9;
UPDATE student SET age = 17 WHERE rollno = 10;

ALTER TABLE student MODIFY COLUMN age INT AFTER name; -- for arrange Row in sequences.
ALTER TABLE student DROP COLUMN age; -- to drop specific column 

ALTER TABLE student RENAME TO vidyarthi; -- to change table name
SELECT * FROM vidyarthi;
ALTER TABLE vidyarthi RENAME TO student; -- for rename table
SELECT * FROM student; -- to revert 

ALTER TABLE student CHANGE COLUMN age umar INT; -- to change column(rename)
ALTER TABLE student CHANGE COLUMN umar age INT;

---- create table jeni and (add, drop, rename, change column, modify column) ---
CREATE TABLE jeni (
id INT,
name VARCHAR(50),
age INT
);
SELECT * FROM jeni;
ALTER TABLE jeni ADD COLUMN Address VARCHAR(50); -- ADD
ALTER TABLE jeni DROP COLUMN Address; -- DROP
ALTER TABLE jeni RENAME TO jenish;-- Rename table
SELECT * FROM jenish; -- to view table
ALTER TABLE jenish CHANGE COLUMN age roll INT; -- column change
ALTER TABLE jenish MODIFY roll TINYINT PRIMARY KEY; -- modify column
SELECT * FROM jenish;
DROP TABLE jenish; -- to drop

------- TRUNCATE (to delete table data)-------
CREATE TABLE jeni (
id INT,
name VARCHAR(50),
age INT
);
INSERT INTO jeni (id,name,age) VALUES 
(1,"jenish",24),
(2,"jishika",22),
(3,"john",23),
(4,"BOB",21);
SELECT * FROM jeni;
TRUNCATE TABLE jeni; -- to delete table data
DROP TABLE jeni; -- to drop

--------- JOINS -----------
-- inner join --
CREATE TABLE know (
    id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);
INSERT INTO know (id, name) VALUES (101, "Jenish"), (102, "Bob"), (103, "Marley");
SELECT * FROM know;

CREATE TABLE course (
    id INT PRIMARY KEY,
    course VARCHAR(20) NOT NULL
);
INSERT INTO course (id, course) VALUES (102, "English"), (103, "Science"), (105, "Maths"), (107, "Hindi");
SELECT * FROM course;
---- INNER JOIN ----
SELECT * FROM know INNER JOIN course ON know.id = course.id; -- INNER JOIN
SELECT * FROM know LEFT JOIN course ON know.id = course.id; -- LEFT JOIN
SELECT * FROM know RIGHT JOIN course ON know.id = course.id; -- RIGHT JOIN
--- FULL JOIN (UNION) ---
SELECT * FROM know 
LEFT JOIN course 
ON know.id = course.id
UNION
SELECT * FROM know 
RIGHT JOIN course 
ON know.id = course.id; 

---- LEFT EXCLUSIVE JOIN ---
SELECT * FROM know LEFT JOIN course ON know.id = course.id WHERE course.id IS NULL;
--- RIGHT EXCLUSIVE JOIN ---
SELECT * FROM know RIGHT JOIN course ON know.id = course.id WHERE know.id IS NULL;

--- SELF JOIN ---
CREATE TABLE employee(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee (id, name, manager_id) VALUES(101, "adam", 103),(102, "bob", 104),(103, "casey", NULL),(104, "donald", 103);
SELECT * FROM employee;
SELECT * 
FROM employee AS a
JOIN employee AS b
ON a.id = b.manager_id; -- self join

SELECT a.name AS Manager_name, b.name
FROM employee AS a
JOIN employee AS b
ON a.id = b.manager_id; -- self join showing manger name via name.

---- UNION ---
SELECT name FROM know
UNION
SELECT course FROM course;

SELECT name FROM know
UNION ALL
SELECT course FROM course; -- show duplicate by (UNION ALL)

------ SUB QUERIES ----
SELECT * FROM student;
SELECT AVG(marks) FROM student; -- average of all marks
SELECT name, marks FROM student WHERE marks > 76.400; -- for above avg marks

SELECT name, marks FROM student WHERE marks > (SELECT AVG(marks) FROM student); --- for sub_query --
SELECT * FROM student WHERE marks > (SELECT AVG(marks) FROM student); --- for sub_query --

SELECT rollno FROM student WHERE rollno % 2 = 0;
SELECT name, rollno FROM student WHERE rollno IN  (SELECT rollno FROM student WHERE rollno % 2 = 0); -- for even

--- VIEW (for virtual table) ---
SELECT * FROM student;
CREATE VIEW jeni AS SELECT name, rollno, age FROM student; -- create virtual table
SELECT * FROM jeni; -- virtual table show
DROP VIEW jeni; -- to drop

-------------------------------------------------------------
