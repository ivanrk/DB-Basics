--1--
SELECT COUNT(*)
AS Count
FROM WizzardDeposits

--2--
SELECT MAX(MagicWandSize) 
AS LongestMagicWand
FROM WizzardDeposits

--3--
SELECT DepositGroup, MAX(MagicWandSize) 
AS LongestMagicWand
FROM WizzardDeposits
GROUP BY DepositGroup

--4--
SELECT TOP(2) DepositGroup
FROM WizzardDeposits
GROUP BY DepositGroup
ORDER BY AVG(MagicWandSize)

--5--
SELECT DepositGroup, SUM(DepositAmount)
AS TotalSum
FROM WizzardDeposits
GROUP BY DepositGroup

--6--
SELECT DepositGroup, SUM(DepositAmount) 
AS TotalSum
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup

--7--
SELECT DepositGroup, SUM(DepositAmount)
AS TotalSum
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup
HAVING SUM(DepositAmount) < 150000
ORDER BY SUM(DepositAmount) DESC

--8--
SELECT DepositGroup, MagicWandCreator, MIN(DepositCharge) 
AS MinDepositCharge
FROM WizzardDeposits
GROUP BY DepositGroup, MagicWandCreator
ORDER BY MagicWandCreator, DepositGroup

--9--
SELECT *, COUNT(*) 
AS WizardCount
FROM (
SELECT
	CASE
		WHEN Age <= 10 THEN '[0-10]'
		WHEN Age between 11 and 20 THEN '[11-20]'
		WHEN Age between 21 and 30 THEN '[21-30]'
		WHEN Age between 31 and 40 THEN '[31-40]'
		WHEN Age between 41 and 50 THEN '[41-50]'
		WHEN Age between 51 and 60 THEN '[51-60]'
		ELSE '[61+]'
	END AS AgeGroup
FROM WizzardDeposits
) AS T
GROUP BY AgeGroup
ORDER BY AgeGroup

--10--
SELECT LEFT(FirstName, 1)
AS FirstLetter
FROM WizzardDeposits
WHERE DepositGroup = 'Troll Chest'
GROUP BY LEFT(FirstName, 1)

--11--
SELECT DepositGroup, IsDepositExpired, AVG(DepositInterest)
AS AverageInterest
FROM WizzardDeposits
WHERE DepositStartDate > '01/01/1985'
GROUP BY DepositGroup, IsDepositExpired
ORDER BY DepositGroup DESC, IsDepositExpired

--12--


--13--
USE SoftUni

SELECT DepartmentID, SUM(Salary)
AS TotalSalary 
FROM Employees
GROUP BY DepartmentID

--14--
SELECT DepartmentId, MIN(Salary) 
AS MinimumSalary
FROM Employees
WHERE DepartmentID IN (2, 5, 7) AND
	  HireDate > '01/01/2000'
GROUP BY DepartmentID

--15--
SELECT * 
INTO EmployeesWithHighSalary
FROM Employees
WHERE Salary > 30000

DELETE FROM EmployeesWithHighSalary
WHERE ManagerId = 42

UPDATE EmployeesWithHighSalary
SET Salary += 5000
WHERE DepartmentID = 1

SELECT DepartmentId, AVG(Salary) 
AS AverageSalary
FROM EmployeesWithHighSalary
GROUP BY DepartmentID

--16--
SELECT DepartmentId, MAX(Salary)
AS MaxSalary
FROM Employees
GROUP BY DepartmentID
HAVING MAX(Salary) NOT BETWEEN 30000 AND 70000

--17--
SELECT COUNT(*) 
AS [Count]
FROM Employees
WHERE ManagerID IS NULL




