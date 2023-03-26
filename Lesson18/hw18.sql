--1 	�������� ���� ����������, ������� ����� � ���������� ������ 6-�� �����������.

SELECT m.Firstname, m.Lastname, COUNT(e.Employee_ID) AS CNT_Emp_ID
FROM Employees  e JOIN Employees m ON e.Employee_ID=m.Manager_ID
GROUP BY m.Firstname, m.Lastname
HAVING COUNT(e.Employee_ID) > 6

--2 	������� min � max �������� � ������� commission_pct ��� ������� ������������. (commission_pct �� ���� ����������� � ���������)

SELECT Department_Name, MIN (Salary-(Salary * commission_pct / 100)) AS Min_Salary
                        MAX (Salary-(Salary * commission_pct / 100)) AS Max_Salary
FROM Departmens d JOIN Employees e ON d.Department_ID=e.Department_ID
GROUP BY Department_Name

--3		������� ������ ������, ��� �������� ������ ����� �����.

SELECT TOP 1 WITH TIES Region_Name, COUNT(Employee_ID) AS CNT_Emp_ID
FROM Regions r 
JOIN Countries c ON r.Region_ID=s.Region_ID
JOIN Locations l ON c.Country_ID=l.Country_ID
JOIN Departmens d ON l.Location_ID=d.Location_ID
JOIN Employees e ON d.Department_ID=e.Department_ID
GROUP BY Region_Name
ORDER BY COUNT(Employee_ID) DESC

-- 4	������� ������� � ��������� ����� ������� �� �� ������� ������������ �� ����� ������� (�� ���� �������������).

SELECT Department_Name, (AVG(e.Salary OVER (PARTITION BY Department_Name))/(AVG(Salary) OVER ())*100 AS Different_btw_salary 
FROM Department_Name d JOIN Employees e ON D.Department_ID=e.Department_ID
GROUP BY Department_Name

-- 5	������� �����, ��� ���������� ������, ��� 10 ��� � ����� ������������. 

SELECT First_Name, Last_Name 
FROM Employees e JOIN Job_History j ON e.Employee_ID=j.Employee_ID
WHERE DATEDIFF (YEAR, Start_Date, End_Date) > 10

-- 6	������� �����, ��� �������� 5-10 ����� �� ������� ��������

SELECT First_Name, Last_Name
FROM (
SELECT First_Name, Last_Name, Salary, DENSE_RANK () OVER (ORDER BY Salary DESC) AS rnk) as rnk_emp
WHERE rnk BETWEEN 5 AND 10