-- Task 1a
SELECT *
FROM Sales.SalesTerritory

-- Task 1b
SELECT TerritoryID, Name
FROM Sales.SalesTerritory

-- Task 1c
SELECT *
FROM Person.Person
WHERE LastName='Norman'

-- Task 1d
SELECT *
FROM Person.Person
WHERE EmailPromotion <> 2

/* Task3 
Агрегатные функции: 
- APPROX_COUNT_DISTINCT (expression)
- STDEV (expression)
- STDEVP (expression)
- VAR (expression)
- VARP (expression)
*/
-- Task 4a
SELECT COUNT (DISTINCT PersonType) AS Unique_PersonType
FROM Person.Person
WHERE LastName LIKE 'M%'
OR EmailPromotion <> 1

-- Task 4b
SELECT TOP 3 *
FROM Sales.SpecialOffer
WHERE StartDate BETWEEN '2013-01-01' AND '2014-01-01'
ORDER BY DiscountPct DESC

--Task 4c
SELECT MIN(Weight) AS Min_Weight, MAX(Size) AS Max_Size --The table has the  data as s,m,l and ect. 
FROM Production.Product

--Task 4d
SELECT ProductSubcategoryID, MIN(Weight) AS Min_Weight, MAX(Size) AS Max_Size
FROM Production.Product
GROUP BY ProductSubcategoryID

--Task 4e
SELECT ProductSubcategoryID, MIN(Weight) AS Min_Weight, MAX(Size) AS Max_Size
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY ProductSubcategoryID