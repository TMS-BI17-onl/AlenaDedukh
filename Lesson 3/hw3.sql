-- Task 2a
SELECT Name,
CASE WHEN StandardCost = 0 AND StandardCost = NULL THEN 'Not for sale'
     WHEN StandardCost > 0 AND StandardCost < 100 THEN '<$100'
	 WHEN StandardCost >=100 AND StandardCost < 500 THEN '<$500'
	 ELSE '>=500'
END AS PriceRange
FROM Production.Product

-- Task 2b
SELECT Purchasing.ProductVendor.ProductID, Purchasing.ProductVendor.BusinessEntityID, 
Purchasing.Vendor.Name, Purchasing.ProductVendor.StandardPrice 
FROM Purchasing.ProductVendor
JOIN Purchasing.Vendor
ON Purchasing.ProductVendor.BusinessEntityID=Purchasing.Vendor.BusinessEntityID
WHERE Purchasing.ProductVendor.StandardPrice > 10
AND (Purchasing.Vendor.Name LIKE '%X%'
OR Purchasing.Vendor.Name LIKE 'N%')

-- Task 2c
SELECT Purchasing.Vendor.Name, Purchasing.Vendor.BusinessEntityID
FROM Purchasing.Vendor
LEFT JOIN Purchasing.ProductVendor
ON Purchasing.Vendor.BusinessEntityID = Purchasing.ProductVendor.BusinessEntityID
WHERE Purchasing.ProductVendor.BusinessEntityID is NULL 

--Task 3a
SELECT Production.Product.Name, Production.Product.StandardCost, Production.ProductModel.Name AS Model_Name
FROM Production.Product
JOIN Production.ProductModel
ON Production.Product.ProductModelID = Production.ProductModel.ProductModelID
WHERE Production.ProductModel.Name like 'LL%'

--Task 3b

SELECT Purchasing.Vendor.Name -- 104 rows
FROM Purchasing.Vendor
UNION
SELECT Sales.Store.Name -- 701 rows
FROM Sales.Store
ORDER BY Name

-- Task 3c
                                                          --SELECT *
                                                          --FROM Sales.SpecialOffer -- 16 rows /*


SELECT Production.Product.Name, COUNT(Sales.SpecialOfferProduct.SpecialOfferID) AS Cnt_Special_Offer
FROM Production.Product -- 538 rows
JOIN Sales.SpecialOfferProduct
ON Production.Product.ProductID = Sales.SpecialOfferProduct.ProductID  
GROUP BY Production.Product.Name
HAVING COUNT(Sales.SpecialOfferProduct.SpecialOfferID) > 1 
ORDER BY Cnt_Special_Offer
 
 --Task 4

SELECT GETDATE (), -- возвращает текущую дату БД 
	   DATENAME (year,'2023-10-30 12:15:32'),
	   DATEPART (QUARTER, '2023-10-30 12:15:32'),
	   DAY ('2023-10-30 12:15:32'),
	   MONTH ('2023-12-30 12:15:32'),
	   YEAR ('2100-12-30 12:15:32'),
	   DATEDIFF (month,'2023-01-01', '2024-01-01'),-- differents betw startdate and enddate DATEDIFF(datepart, 'startdate', 'enddate' 
	   DATEADD(day, 1, GETDATE())
	SELECT EOMONTH (GETDATE (), 1) -- возвращает последний день месяца, содержащего указанную дату, с необязательным смещением