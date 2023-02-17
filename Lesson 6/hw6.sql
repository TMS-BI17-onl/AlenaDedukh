--Task 3
CREATE PROCEDURE HumanResources_sp_Update_ID
@BusinessEntityID int,
@NationalIDNumber varchar(100)
AS
UPDATE HumanResources.Employee
SET NationalIDNumber=@NationalIDNumber
WHERE BusinessEntityID=@BusinessEntityID

DROP PROCEDURE HumanResources_sp_Update_ID

EXEC HumanResources_sp_Update_ID @BusinessEntityID=15, @NationalIDNumber=879341111

/*SELECT *
FROM HumanResources.Employe*/