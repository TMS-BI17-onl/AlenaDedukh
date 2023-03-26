--1 	Покажите всех менеджеров, которые имеют в подчинении больше 6-ти сотрудников.

SELECT m.Firstname, m.Lastname, COUNT(e.Employee_ID) AS CNT_Emp_ID
FROM Employees  e JOIN Employees m ON e.Employee_ID=m.Manager_ID
GROUP BY m.Firstname, m.Lastname
HAVING COUNT(e.Employee_ID) > 6

--2 	Вывести min и max зарплату с вычетом commission_pct для каждого департамента. (commission_pct на базе указывается в процентах)

SELECT Department_Name, MIN (Salary-(Salary * commission_pct / 100)) AS Min_Salary
                        MAX (Salary-(Salary * commission_pct / 100)) AS Max_Salary
FROM Departmens d JOIN Employees e ON d.Department_ID=e.Department_ID
GROUP BY Department_Name

--3		Вывести только регион, где работают больше всего людей.

SELECT TOP 1 WITH TIES Region_Name, COUNT(Employee_ID) AS CNT_Emp_ID
FROM Regions r 
JOIN Countries c ON r.Region_ID=s.Region_ID
JOIN Locations l ON c.Country_ID=l.Country_ID
JOIN Departmens d ON l.Location_ID=d.Location_ID
JOIN Employees e ON d.Department_ID=e.Department_ID
GROUP BY Region_Name
ORDER BY COUNT(Employee_ID) DESC

-- 4	Найдите разницу в процентах между средней зп по каждому департаменту от общей средней (по всем департаментам).

SELECT Department_Name, (AVG(e.Salary OVER (PARTITION BY Department_Name))/(AVG(Salary) OVER ())*100 AS Different_btw_salary 
FROM Department_Name d JOIN Employees e ON D.Department_ID=e.Department_ID
GROUP BY Department_Name

-- 5	Найдите людей, кто проработал больше, чем 10 лет в одном департаменте. 

SELECT First_Name, Last_Name 
FROM Employees e JOIN Job_History j ON e.Employee_ID=j.Employee_ID
WHERE DATEDIFF (YEAR, Start_Date, End_Date) > 10

-- 6	Найдите людей, кто занимает 5-10 место по размеру зарплаты

SELECT First_Name, Last_Name
FROM (
SELECT First_Name, Last_Name, Salary, DENSE_RANK () OVER (ORDER BY Salary DESC) AS rnk) as rnk_emp
WHERE rnk BETWEEN 5 AND 10