-- 1) DESIGN SCHEMA:
-- Creating the Students Database and Table
CREATE DATABASE STU_DBMS;
USE STU_DBMS;

CREATE TABLE STUDENTS (
SID INT,
SNAME VARCHAR(20),
AGE INT,
GENDER VARCHAR(20),
GRADE VARCHAR(20),
ATTENDENCE VARCHAR(20),
GPA FLOAT
);

-- -------------------------------------------------------------------------------------------------

-- 2) DATA INSERTION:
-- Inserting students data into the table
INSERT INTO STUDENTS (SID, SNAME, AGE, GENDER, GRADE, ATTENDENCE, GPA)
VALUES
(34256, 'Ammar', 23, 'Male', 'TY', '79%', 92.5),
(34258, 'Amrin', 21, 'Female', 'TY', '90%', 98),
(34261, 'Faizan', 20, 'Male', 'TY', '100%', 93.6),
(34264, 'Mahek', 22, 'Female', 'TY', '86%', 94.8),
(34266, 'Abbas', 21, 'Male', 'TY', '82%', 93),
(34263, 'Hafsa', 21, 'female', 'SY', '79%', 88.2),
(34257, 'Faraz', 22, 'Male', 'SY', '84%', 87.6),
(34262, 'Hasan', 20, 'Male', 'SY', '100%', 80),
(34267, 'Fatima', 20, 'Female', 'SY', '95%', 93.5),
(34268, 'Fahad', 22, 'Male', 'SY', '100%', 86),
(34259, 'Ayesha', 19, 'Female', 'FY', '100%', 90.2),
(34260, 'Hamad', 20, 'Male', 'FY', '100%', 79),
(34265, 'Bilal', 21, 'Male', 'FY', '96%', 82.2),
(34269, 'Nida', 20, 'Female', 'FY', '100%', 92.5),
(34270, 'Maryam', 19, 'Female', 'FY', '92%', 92.5),
(34271, 'Safwan', 21, 'Male', 'SY', '10%', NULL)
;

-- -------------------------------------------------------------------------------------------------

-- 3) DATA RETRIEVAL:
-- Retriving the names and grade who have achieved GPA more than 90%
SELECT SNAME, GRADE, GPA
FROM STUDENTS 
WHERE GPA > '90%'
; 

-- Finding the average GPA for every grades
SELECT GRADE, ROUND(AVG(GPA),2) AS Average_GPA
FROM STUDENTS
WHERE GRADE IN ('FY', 'SY', 'TY')
GROUP BY GRADE
ORDER BY GRADE
;

-- -------------------------------------------------------------------------------------------------

-- 4)DATA UPDATE:
-- Update the attendence of a student who's SID is 34263 to 89% 
UPDATE STUDENTS
SET ATTENDENCE = '89%'
WHERE SID = 34263
;

-- -------------------------------------------------------------------------------------------------

-- 5)DATA DELETION:
-- Delete a student record using ID: 34271
DELETE
FROM STUDENTS
WHERE SID = 34271
;

-- -------------------------------------------------------------------------------------------------

-- 6)JOIN OPERATIONS:
-- List all students along with their grades, using join operations.
SELECT ST1.SNAME, ST2.GRADE
FROM STUDENTS AS ST1
JOIN STUDENTS AS ST2
	ON ST1.SID = ST2.SID
ORDER BY ST1.SNAME
    ;

-- -------------------------------------------------------------------------------------------------

-- 7)SUBQUERIES:
-- Find students who have attendant 100%, using Subqueries
SELECT *
FROM STUDENTS
WHERE ATTENDENCE IN 
	(SELECT ATTENDENCE
	FROM STUDENTS
	WHERE ATTENDENCE = '100%'
    )
;

-- Highest persentage in each grade
SELECT GRADE, MAX(GPA)
FROM STUDENTS 
WHERE GRADE IN ('TY', 'SY','FY')
GROUP BY GRADE
;

-- -------------------------------------------------------------------------------------------------

-- 8) LENGTH AND CASES 
-- Find the length of students name and convert it into upper case
SELECT LENGTH(SNAME) AS LENGTH, UPPER(SNAME) AS `UPPER CASE`
FROM STUDENTS 
ORDER BY 2
;

-- -------------------------------------------------------------------------------------------------

-- 9) CONCATINATE
-- Display all the students with there GPA using Concatinate
SELECT SID, CONCAT(SNAME,' ', GPA) AS `Students GPA`
FROM STUDENTS
;

-- -------------------------------------------------------------------------------------------------

-- 10) CASE STATEMENT
-- List all the students of every grade with there related program
SELECT SNAME, CASE
	WHEN GRADE = 'FY' THEN 'Mobile Games'
    WHEN GRADE = 'SY' THEN 'Football'
	WHEN GRADE = 'TY' THEN 'Car Race'
END AS `Festival`, GRADE
FROM STUDENTS
ORDER BY 1
;

-- ---------------------------------------------------------------------------------------------------
