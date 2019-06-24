USE SoftUni

---*1*---
Select FirstName, LastName
FROM Employees
WHERE Left(FirstName, 2) = 'Sa'

---*2*----
SELECT FirstName, LastName
FROM Employees
WHERE LastName LIKE '%ei%'

---*3*----
SELECT FirstName
FROM Employees
WHERE DepartmentID IN (3, 10) AND 
	  DATEPART(YEAR, HireDate) BETWEEN 1995 AND 2005

---*4*----
SELECT FirstName, LastName
FROM Employees
WHERE JobTitle NOT LIKE '%engineer%'

---*5*----
SELECT Name
FROM Towns
WHERE LEN(Name) IN (5, 6)
ORDER BY Name

---*6*----
SELECT *
FROM Towns
WHERE LEFT(Name, 1) IN ('M', 'K', 'B', 'E')
--WHERE NAME LIKE '[MKBE]%'
ORDER BY Name

---*7*----
SELECT *
FROM Towns
WHERE NAME LIKE '[^RBD]%'
ORDER BY Name

---*8*---
GO
CREATE VIEW V_EmployeesHiredAfter2000 AS
SELECT FirstName, LastName
FROM Employees
WHERE DATEPART(YEAR, HireDate) > 2000
GO

SELECT * 
FROM V_EmployeesHiredAfter2000

---*9*---
SELECT FirstName, LastName
FROM Employees
WHERE LEN(LastName) = 5


USE [Geography]

---*10*---
SELECT CountryName, IsoCode
FROM Countries
WHERE LEN(CountryName) - LEN(REPLACE(CountryName, 'A', '')) >= 3
ORDER BY IsoCode

---*11*---
SELECT p.PeakName, r.RiverName, LOWER(p.PeakName + SUBSTRING(r.RiverName, 2, LEN(r.RiverName) - 1)) AS Mix 
FROM Peaks AS p
JOIN Rivers AS r
ON RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix

---*12*---
USE Diablo

SELECT TOP(50) Name, FORMAT(Start, 'yyyy-MM-dd') 
AS Start
FROM Games
WHERE DATEPART(YEAR, Start) IN (2011, 2012)
ORDER BY Start, Name

---*13*---
SELECT Username, SUBSTRING(Email, CHARINDEX('@', Email, 1) + 1, LEN(Email)) 
AS [Email Provider]
FROM Users
ORDER BY [Email Provider], Username

---*14*---
SELECT Username, IpAddress 
AS [Ip Address]
FROM Users
WHERE IpAddress LIKE '___.1%.%.___'
ORDER BY Username
