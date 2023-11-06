-- Commenting is with "--"

-- CREATING A TABLE
CREATE TABLE EmployeeDemographic
(EmployeeId int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int
)

-- QUERYING TO SEE TABLE

SELECT * FROM SQLTutorial..EmployeeDemographic 

SELECT * FROM SQLTutorial..EmployeeSalary

-- FILLING IN THE TABLE WITH INFORMATION

INSERT INTO EmployeeDemographic VALUES
(1001, 'Andres', 'Jimenez', 30, 'Male'),
(1002, 'Edward', 'Ruiz', 21, 'Male'),
(1003, 'Daniel', 'Scott', 43, 'Male'),
(1004, 'Rosa', 'Harrison', 34, 'Female'),
(1005, 'Jeronimo', 'Perez', 22, 'Male'),
(1006, 'Marisol', 'Lapenta', 25, 'Female'),
(1007, 'Beatriz', 'Rodriguez', 23, 'Female'),
(1008, 'Alberto', 'Fernandez', 34, 'Male'),
(1009, 'Benjamin', 'Alvarez', 51, 'Male'),
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, 'NULL'),
(1013, 'Darryl', 'Philbil', NULL, 'Male')

INSERT INTO EmployeeSalary VALUES
(1001, 'Data Analyst', 75000),
(1002, 'Recepcionist', 36000),
(1003, 'Salesman', 60000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)
(1010, NULL, 47000),
(NULL, 'Salesman', 43000)

-- DELETING INFORMATION FROM TABLE

DELETE FROM EmployeeDemographic
WHERE EmployeeId = 1001

-- SELECTING ONLY 5, 8, 10... X RECORDS                          SELECT STATEMENTS - TOP, DISTINCT, COUNT, AS, MAX, MIN, AVG

SELECT TOP 5 *
FROM EmployeeDemographic

SELECT DISTINCT(EmployeeId)				     --SHOWS THE UNIQUE VALUES, NOT REPEATED
FROM EmployeeDemographic

SELECT DISTINCT(Gender)					     --SHOWS THE UNIQUE VALUES, NOT REPEATED
FROM EmployeeDemographic 

SELECT COUNT(LastName) AS LastNameCount      --RETURNS THE COUNT OF EVERY VALID ROW, NOT NULL
FROM EmployeeDemographic

SELECT MAX(Salary) AS Max_Salary
FROM EmployeeSalary

SELECT MIN(Salary) AS Min_Salary
FROM EmployeeSalary

SELECT *							     	  --CHOOSE TO SEE ANOTHER DATABASE USING DOTS .DBO ..
FROM SQLTutorial.dbo.EmployeeSalary

-- ANOTHER STATEMENTS											 WHERE STATEMENT, GROUP, =, <>,  <, >, AND, OR, LIKE, NULL, NOT NULL, IN

SELECT *
FROM EmployeeDemographic
WHERE FirstName = 'ANDRES'

SELECT *
FROM EmployeeDemographic  
WHERE FirstName <> 'ANDRES'

SELECT *
FROM EmployeeDemographic
WHERE Age >= 30 AND Gender = 'MALE'

SELECT *
FROM EmployeeDemographic
WHERE Age >= 30 OR Gender = 'MALE'

SELECT *										--Wild card '%'  LIKE
FROM EmployeeDemographic
WHERE LastName LIKE 'A%'

SELECT *										--Wild card '%'
FROM EmployeeDemographic
WHERE LastName LIKE 'S%O%'

SELECT *										--Wild card '%'
FROM EmployeeDemographic
WHERE LastName LIKE 'S%O'

SELECT *
FROM EmployeeDemographic
WHERE LastName IS NOT NULL

SELECT *											-- IN (EQUAL FOR MULTIPLE THINGS)
FROM EmployeeDemographic
WHERE FirstName in ('ANDRES', 'CARLOS', 'BEATRIZ')

--																		GROUP BY, ORDER BY

SELECT DISTINCT(GENDER)							 -- DIFERENT OF GROUP BY
FROM EmployeeDemographic

SELECT *
FROM EmployeeDemographic

SELECT Gender, COUNT(GENDER)
FROM EmployeeDemographic
GROUP BY Gender


SELECT Gender, Age, COUNT(GENDER)
FROM EmployeeDemographic
GROUP BY Gender, Age

SELECT Gender, COUNT(GENDER) AS COUNT_GENDER			
FROM EmployeeDemographic
WHERE AGE > 31
GROUP BY Gender						-- HAVE TO PUT THE SAME AMOUNT OF ROWS, WITHOUT THE DERIVATIVES MAX, MIN, SUM, COUNT
ORDER BY COUNT_GENDER DESC			-- ASC FOR DEFAULT

SELECT *
FROM EmployeeDemographic
ORDER BY 4 DESC, Gender ASC		-- YOU CAN USE NUMBERS FOR COLUMNS


			--        INTERMEDIATE SQL SERIE		--  INNER JOINS, FULL, LEFT, RIGHT, OUTER JOINS

-- A WAY TO COMBINE MULTIPLE TABLES AT ONCE JOINING THEM THROUGH A SIMILAR FIELD, MAINLY UNIQUE

SELECT *					
FROM SQLTutorial.dbo.EmployeeDemographic
INNER JOIN SQLTutorial.dbo.EmployeeSalary											    	-- JOIN IS INNER DEFAULT
	ON EmployeeDemographic.EmployeeId = EmployeeSalary.EmployeeID							-- INNER SHOWS ONLY IF EMPLOYEE ID MATCHS

SELECT *					
FROM SQLTutorial.dbo.EmployeeDemographic
FULL OUTER JOIN SQLTutorial.dbo.EmployeeSalary												-- FULL SHOWS ALL THE VALUES FROM TABLE A AND B
	ON EmployeeDemographic.EmployeeId = EmployeeSalary.EmployeeID							
	

SELECT *					
FROM SQLTutorial.dbo.EmployeeDemographic
LEFT OUTER JOIN SQLTutorial.dbo.EmployeeSalary												-- LEFT SHOWS ALL THE VALUES FROM TABLE A 
	ON EmployeeDemographic.EmployeeId = EmployeeSalary.EmployeeID							-- SHOWS NULL IF DOESNT NOTHING TO MATCH IN TABLE B		

SELECT *					
FROM SQLTutorial.dbo.EmployeeDemographic
RIGHT OUTER JOIN SQLTutorial.dbo.EmployeeSalary												-- RIGHT SHOWS ALL THE VALUES FROM TABLE B 
	ON EmployeeDemographic.EmployeeId = EmployeeSalary.EmployeeID							-- SHOWS NULL IF DOESNT NOTHING TO MATCH IN TABLE A (IN THIS CASE EMPLOYEEID)

SELECT EmployeeDemographic.EmployeeId, FirstName, LastName, JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeDemographic
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographic.EmployeeId = EmployeeSalary.EmployeeID

SELECT A.EmployeeId, FirstName, LastName, Salary
FROM SQLTutorial..EmployeeDemographic A
JOIN SQLTutorial..EmployeeSalary B
	ON A.EmployeeId = B.EmployeeID
WHERE FirstName <> 'Marisol'
ORDER BY Salary DESC

SELECT JobTitle, Salary
FROM EmployeeDemographic as A
FULL OUTER JOIN EmployeeSalary as B
	ON A.EmployeeId = B.EmployeeID
WHERE JobTitle = 'SALESMAN'
--GROUP BY JobTitle

SELECT JobTitle, AVG(Salary)
FROM EmployeeDemographic A
FULL OUTER JOIN EmployeeSalary B
	ON A.EmployeeId = B.EmployeeID
WHERE JobTitle = 'SALESMAN'
GROUP BY JobTitle


--														UNION

CREATE TABLE WarehouseEmployeeDemographics
(EmployeeId int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

INSERT INTO WarehouseEmployeeDemographics VALUES
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female'),
(1013, 'Darryl', 'Philbin', NULL, 'Male')


SELECT *
FROM EmployeeDemographic
UNION											-- UNION COMBINES THE 2 TABLES IN THE SAME COLUMN WITHOUT DUPLICATES
SELECT *										
FROM WarehouseEmployeeDemographics

SELECT *
FROM EmployeeDemographic
UNION ALL										-- UNION COMBINES THE 2 TABLES IN THE SAME COLUMN REGARDLESS OF THE DUPLICATES
SELECT *										-- IS USEFULL ONLY WITH THE SAME COLUMNS
FROM WarehouseEmployeeDemographics
ORDER BY EmployeeId



--												CASE STATEMENTS
-- ITS WHEN A CONDITION IS MET, WHAT DO YOU WANT TO RETURN

SELECT FirstName, LastName, Age,
CASE										-- SQL TAKES IT LIKE ANOTHER COLUMN
	WHEN AGE > 30 THEN 'Old'
	WHEN AGE BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END AS Description_People
FROM SQLTutorial..EmployeeDemographic
WHERE AGE IS NOT NULL
ORDER BY AGE


SELECT A.FirstName, A.LastName, B.JobTitle, B.Salary,  
CASE 
	WHEN A.FirstName = 'Andres' THEN 'Boss'
	ELSE 'Employee'
END as Piramid,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary*(1+.10)
	WHEN JobTitle = 'Data Analyst' THEN Salary*(1+.30)
	ELSE Salary*(1+.07)
END as Bonification
FROM SQLTutorial..EmployeeDemographic A
INNER JOIN SQLTutorial..EmployeeSalary B
	ON A.EmployeeId = B.EmployeeID

--                                  HAVING CLAUSE

SELECT B.JobTitle, COUNT(B.JobTitle)
FROM SQLTutorial..EmployeeDemographic A
JOIN SQLTutorial..EmployeeSalary B
	ON A.EmployeeId = B.EmployeeID
GROUP BY JobTitle
HAVING COUNT(B.JobTitle) > 1	-- HAVING ALWAYS HAS TO BE AFTER THE GROUP BY

SELECT JobTitle, AVG(B.Salary) AS AVG_SALARY
FROM SQLTutorial..EmployeeDemographic A
JOIN SQLTutorial..EmployeeSalary B
	ON A.EmployeeId = B.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) BETWEEN 45000 AND 60000		-- BETWEEN GROUP BY AND ORDER BY
ORDER BY AVG(Salary)


--  UPDATING AND DELETING DATA

SELECT *
FROM SQLTutorial..EmployeeDemographic

UPDATE SQLTutorial..EmployeeDemographic
SET EmployeeId = 1012
WHERE FirstName = 'HOLLY' AND LastName = 'FLAX'

UPDATE SQLTutorial..EmployeeDemographic
SET Age = 31, Gender = 'Female'
WHERE FirstName = 'HOLLY' AND LastName = 'FLAX'


DELETE FROM SQLTutorial..EmployeeDemographic   --DELETE A COMPLETELY ROW
WHERE EmployeeId = 1013


-- ALIASING IS RENAMING COLUMNS

SELECT FirstName + ' ' + LastName as FullName
FROM SQLTutorial..EmployeeDemographic

SELECT Demo.EmployeeId, Sal.Salary					-- CLEANER STATEMENT
FROM SQLTutorial..EmployeeDemographic AS Demo
JOIN SQLTutorial..EmployeeSalary AS Sal
	ON Demo.EmployeeId = Sal.EmployeeID


SELECT A.EmployeeId, A.FirstName, A.LastName, B.JobTitle, C.Age	-- CONFUSING, WHAT IS A,B,C
FROM SQLTutorial.dbo.EmployeeDemographic A
LEFT JOIN SQLTutorial.dbo.EmployeeSalary B
	ON A.EmployeeId = B.EmployeeID
LEFT JOIN SQLTutorial.dbo.WarehouseEmployeeDemographics C
	ON A.EmployeeId = C.EmployeeId


SELECT Demo.EmployeeId, Demo.FirstName, Demo.LastName, Sal.JobTitle, Ware.Age	-- CONFUSING, WHAT IS A,B,C
FROM SQLTutorial.dbo.EmployeeDemographic Demo
LEFT JOIN SQLTutorial.dbo.EmployeeSalary Sal
	ON Demo.EmployeeId = Sal.EmployeeID
LEFT JOIN SQLTutorial.dbo.WarehouseEmployeeDemographics Ware
	ON Demo.EmployeeId = Ware.EmployeeId

-- PARTITION BY 

-- DOESNT REDUCE THE NUMBER OF ROWS

/*


*/

SELECT Demo.FirstName, Demo.LastName, Demo.Gender, Sal.Salary,
COUNT(Demo.Gender) OVER (PARTITION BY Gender) as Total_Gender
FROM SQLTutorial..EmployeeDemographic Demo
JOIN SQLTutorial..EmployeeSalary Sal
	ON Demo.EmployeeId = Sal.EmployeeID


/* CTEs */					-- THEY DOESNT STORE ANYWHERE, YOU HAVE TO RUN IT EVERY TIME

WITH CTE_Employee as
(SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM SQLTutorial..EmployeeDemographic emp
JOIN SQLTutorial..EmployeeSalary Sal
	ON emp.EmployeeId = SAL.EmployeeID
WHERE Salary > 45000
)

SELECT *			-- YOU HAVE TO PUT THE SELECT STATEMENT RIGHT AFTER THE CTE
FROM CTE_Employee


/*     TEMP TABLES    */

DROP TABLE IF EXISTS #temp_Employee

CREATE TABLE #temp_Employee (
EmployeeID int,
Jobtitle varchar(100),
Salary int
)


--INSERT INTO #temp_Employee VALUES(
--'1001', 'HR', '45000'
--)


INSERT INTO #temp_Employee 
SELECT * 
FROM SQLTutorial..EmployeeSalary

SELECT *
FROM #temp_Employee

DELETE 
FROM #temp_Employee


-- STRING FUNCTIONS , TRIM, ETC -- 

DROP TABLE IF EXISTS EmployeeErrors

CREATE TABLE EmployeeErrors(
EmployeeID varchar(50),
FirstName varchar(50),
LastName varchar(50)
)

INSERT INTO EmployeeErrors VALUES
('1001   ', 'Jimbo', 'Harlbert'),
('   1002', 'Pamela', 'Beasely'),
('1005', 'TOby', 'Flenderson-Fired')

DELETE FROM EmployeeErrors

SELECT *
FROM EmployeeErrors


-- USING TRIM, LTRIM, RTRIM  

SELECT EmployeeID, TRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, LTRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, RTRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

-- USING REPLACE

SELECT LastName, REPLACE(LastName, '-FIRED', '') as LastNameFixed
FROM EmployeeErrors

-- USING SUBSTRINGS

SELECT SUBSTRING(FirstName,1,3)
FROM EmployeeErrors

SELECT FirstName, LastName
FROM EmployeeErrors

SELECT FirstName, LOWER(FirstName), UPPER(FirstName)
FROM EmployeeErrors


/*   STORED PROCEDURES  */

CREATE PROCEDURE TEST			-- CREATING A STORED PROCEDURA THAT HELP US TO SAVE TIME AND PERFORMANCE
AS 
SELECT *
FROM EmployeeDemographic


EXEC TEST                       -- EXECUTING THE STORED PROCEDURE 


CREATE PROCEDURE Temp_Employee
as
CREATE TABLE #temp_Employee (
Jobtitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #temp_Employee 
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM SQLTutorial..EmployeeDemographic emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeId = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_Employee

EXEC Temp_Employee 
@JobTitle = 'Salesman'

/*			SUBQUERIES			*/

SELECT *
FROM EmployeeSalary


-- SUBQUERY IN SELECT

SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AVGSALARY
FROM EmployeeSalary

-- SUBQUERY IN PARTITION BY

SELECT EmployeeID, Salary, AVG(Salary) OVER () AS ALLAGSALARY
FROM EmployeeSalary

-- SUBQUERY IN FROM STATEMENT

SELECT *
FROM (SELECT EmployeeID, Salary, AVG(Salary) OVER () AS ALLAGSALARY
FROM EmployeeSalary)

-- IN WHERE

SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
WHERE EmployeeID in (
		SELECT EmployeeId
		FROM EmployeeDemographic
		where age > 30)
