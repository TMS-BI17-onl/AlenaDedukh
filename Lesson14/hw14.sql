CREATE VIEW vTOP50Sellers as
SELECT TOP 50 WITH TIES FullName, SUM(Points) as Sumpoints,
RANK() OVER (ORDER BY SUM(Points) DESC) as rnk
FROM
(SELECT FullName, RentDate,
(CASE WHEN COUNT(o.OrderID) >=10 THEN 3
WHEN COUNT(o.OrderID) BETWEEN 5 AND 10 THEN 2
WHEN COUNT(o.OrderID) <5 THEN 1
END) as Points
FROM FctOrders o JOIN DimEmployees e ON O.EmployeeNumber=E.EmployeeNumber
GROUP BY FullName, RentDate) temp
GROUP BY FullName
ORDER BY Sumpoints DESC

SELECT *
FROM vTOP50Sellers

