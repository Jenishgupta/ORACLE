CREATE DATABASE temp1;
DROP DATABASE temp1;

CREATE DATABASE temp2;
DROP DATABASE temp2;

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
------------------------ (General Order)
SELECT city, name
FROM student
WHERE grade ="A"
GROUP BY city, name
HAVING MAX(marks) >85
ORDER BY city ASC;
------------- (update)
UPDATE student SET grade = "O" WHERE grade = "A";
------- (DELETE)
DELETE FROM student WHERE marks < 33;
------ 



