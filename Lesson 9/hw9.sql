CREATE TABLE People
(
ID INT IDENTITY (1,1),
FirstName NVARCHAR (20),
ParentName NVARCHAR (20),
LastName NVARCHAR (20),
ID_Father INT,
ID_Mother INT)

SELECT *
FROM People

INSERT INTO People (FirstName, ParentName, LastName,ID_Father, ID_Mother)
VALUES ('Dmitriy', 'Vladimir', 'Petrov', 1, 10),
       ('Sergei', 'Alexandr', 'Sergeev', 3, 8),
	   ('Dmitriy', 'Vitaly', 'Ivanov', 2, 1)



DROP Table People
	   
	   SELECT CONCAT(P1.LastName,' ',P1.FirstName) AS FI_Child,   
	          CONCAT(P2.LastName,' ',P2.ParentName) AS FI_Father
FROM People P1 LEFT JOIN People P2 ON P1.ID_Father=P2.ID
WHERE P1.FirstName = 'Dmitriy'
