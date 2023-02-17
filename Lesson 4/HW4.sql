/*Task 3. 
Functions Row Number, Rank, Dense Rank return the same result when the column values are unique*/

-- Task 4a

SELECT *
FROM Production.UnitMeasure

SELECT *
FROM Production.UnitMeasure
WHERE UnitMeasureCode like 'T%' 

SELECT  count (distinct UnitMeasureCode) as count_dictinct_UMC
FROM Production.UnitMeasure

INSERT INTO Production.UnitMeasure (UnitMeasureCode, Name, ModifiedDate)
VALUES ('TT1', 'Test 1', '2020-09-09')
INSERT INTO Production.UnitMeasure (UnitMeasureCode, Name, ModifiedDate)
VALUES ('TT2', 'Test 2', getdate ())

SELECT*
FROM Production.UnitMeasure
WHERE UnitMeasureCode like 'T%'

--Task 4b

SELECT UnitMeasureCode, Name, ModifiedDate
INTO Production.UnitMeasureTest
FROM Production.UnitMeasure
WHERE UnitMeasureCode like 'T%'

SELECT *
FROM Production.UnitMeasureTest

INSERT INTO Production.UnitMeasureTest (UnitMeasureCode, Name, ModifiedDate)
SELECT UnitMeasureCode, Name, ModifiedDate 
FROM Production.UnitMeasure
WHERE UnitMeasureCode='CAN'

SELECT *
FROM Production.UnitMeasureTest
ORDER BY UnitMeasureCode

--Task 4c

UPDATE Production.UnitMeasureTest
SET UnitMeasureCode='TTT'

SELECT *
FROM Production.UnitMeasureTest


--Task 4d
DELETE 
FROM Production.UnitMeasureTest

SELECT *
FROM Production.UnitMeasureTest

-- Task 4e

SELECT *
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (43659, 43664)

SELECT SalesOrderID, 
MAX (LineTotal) OVER (partition by SalesOrderID) as MAX,
MIN (LineTotal) OVER (partition by SalesOrderID) as MIN,
AVG (LineTotal) OVER (partition by SalesOrderID) as AVG
FROM Sales.SalesOrderDetail

--Task 4f
SELECT *
FROM Sales.vSalesPerson

SELECT FirstName, LastName,SalesYTD,TerritoryGroup,
DENSE_RANK() OVER(ORDER BY SalesYTD DESC) as Rating,
concat (upper (substring (FirstName, 1,3)), 'login', isnull(TerritoryGroup, ' ')) as login
FROM Sales.vSalesPerson

SELECT FirstName, LastName,SalesYTD,SalesLastYear,
DENSE_RANK() OVER(ORDER BY SalesLastYear DESC) as LastYear_Rating
FROM Sales.vSalesPerson

-- the first place - Linda Mitchell, the first place by SalesLastYear - Ranjit Varkey Chudukatil

--Task 4g-- i asked Google :( I  need to learn the time function better

SELECT CASE 
        WHEN DATENAME(WEEKDAY, dateadd(mm, DATEDIFF(MM, 0, getdate()), 0)) = 'Saturday'
            THEN dateadd(mm, DATEDIFF(MM, 0, getdate()), 0) + 2 
        WHEN DATENAME(WEEKDAY, dateadd(mm, DATEDIFF(MM, 0, getdate()), 0)) = 'Sunday'
            THEN dateadd(mm, DATEDIFF(MM, 0, getdate()), 0) + 1
        ELSE dateadd(mm, DATEDIFF(MM, 0, getdate()), 0) 
        END, DATENAME(WEEKDAY, dateadd(mm, DATEDIFF(MM, 0, getdate()), 0)) 

-- Task 5
count (1) - 4
count (name) - 2
count (id) - 4
count (*) - 4
