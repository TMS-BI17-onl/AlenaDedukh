DECLARE @myid uniqueidentifier = NEWID();  
SELECT CONVERT(CHAR(255), @myid) AS 'char'

DECLARE @myid uniqueidentifier ;  
SET @myid = 'A972C577-DFB0-064E-1189-0154C99310DAAC12';  
SELECT @myid;
SELECT TOP 1 ProductID, Name, ProductNumber
FROM Production.Product
ORDER BY NEWID()

--Task6
CREATE TABLE Patients
(ID           INT IDENTITY (1,1),
 FirstName    NVARCHAR (30),
 LastName     NVARCHAR (50),
 SSN		  UNIQUEIDENTIFIER DEFAULT newid(),
 Email       AS CONCAT(UPPER(LEFT(FirstName,1)), LOWER(LEFT(LastName,3)),'@gmail.com'),
 Temp		 DECIMAL (3,1),
 CreatedDate DATE)
            
SELECT *
FROM dbo.Patients

--Task 7
INSERT INTO dbo.Patients (FirstName, LastName, Temp, CreatedDate) 
VALUES ('Max', 'Maximov', 36.8, '2023-01-10'),
	   ('Alex', 'Alexeev', 38.1, '2023-01-11'),
	   ('Kris', 'Kireeva', 37, '2023-01-11'),
	   ('Anna', 'Annaeva', 36.6, '2023-01-15')

-- Task 8
ALTER TABLE dbo.Patients
ADD TempType AS
CASE
    WHEN Temp<37 THEN '<37°C' --при выполнении запроса вместо С выдает вопросительный знак
	WHEN Temp>37 THEN '>37°C'
	ELSE '37°C'
END

--Task 9

CREATE VIEW Patients_v AS
SELECT ID, FirstName, LastName, SSN, Email, (Temp*9/5+32) AS F_temp
FROM dbo.Patients

SELECT *
FROM Patients_v

--Task 10
CREATE FUNCTION udfTemp_F (@Temp FLOAT)
RETURNS FLOAT
AS 
BEGIN
RETURN @Temp*9/5+32
END

--output finction
SELECT dbo.udfTemp_F(40.5) as Temp_F

--Task 11 -- 

/*SELECT CASE 
        WHEN DATENAME(WEEKDAY, dateadd(mm, DATEDIFF(MM, 0, getdate()), 0)) = 'Saturday'
            THEN dateadd(mm, DATEDIFF(MM, 0, getdate()), 0) + 2 
        WHEN DATENAME(WEEKDAY, dateadd(mm, DATEDIFF(MM, 0, getdate()), 0)) = 'Sunday'
            THEN dateadd(mm, DATEDIFF(MM, 0, getdate()), 0) + 1
        ELSE dateadd(mm, DATEDIFF(MM, 0, getdate()), 0) 
        END, DATENAME(WEEKDAY, dateadd(mm, DATEDIFF(MM, 0, getdate()), 0)) as DateName*/

		DECLARE @firstdayofmonth DATETIME 
SET @firstdayofmonth=dateadd (month, datediff (month, 0, getdate()), 0)
SELECT 
CASE 
WHEN datename (weekday, @firstdayofmonth) = 'Saturday'
THEN @firstdayofmonth
WHEN datename (weekday, @firstdayofmonth) = 'Sunday'
THEN @firstdayofmonth + 1
ELSE @firstdayofmonth
END

