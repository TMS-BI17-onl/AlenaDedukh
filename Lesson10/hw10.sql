SELECT *
FROM Production.WorkOrder

SELECT Year, December, January,  February -- можно ли  значения NULL заменить на 0 
FROM (
SELECT YEAR (DueDate) AS Year, DATENAME (Month, DueDate) AS Month, OrderQty
FROM Production.WorkOrder) AS SourseTable
PIVOT
(SUM (OrderQty) FOR Month IN (December, January, February)) AS PivotTable
ORDER BY Year

