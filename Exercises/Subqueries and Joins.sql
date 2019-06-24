USE SoftUni

--1--
    SELECT TOP(5) e.EmployeeID, e.JobTitle, e.AddressID, a.AddressText 
	  FROM Employees AS e
INNER JOIN Addresses AS a
		ON a.AddressID = e.AddressID
  ORDER BY AddressID

--2--
	SELECT TOP(50) e.FirstName, e.LastName, t.Name AS Town, a.AddressText 
	  FROM Employees AS e
INNER JOIN Addresses AS a
		ON a.AddressID = e.AddressID
INNER JOIN Towns AS t
		ON t.TownID = a.TownID
  ORDER BY FirstName, LastName

--3--
	SELECT emp.EmployeeID, emp.FirstName, emp.LastName, dep.Name
	  FROM Employees AS emp
INNER JOIN Departments AS dep
		ON dep.DepartmentID = emp.DepartmentID AND dep.Name = 'Sales'
  ORDER BY emp.EmployeeID

--4--
	SELECT TOP(5) e.EmployeeID, e.FirstName, e.Salary, d.Name AS DepartmentName
	  FROM Employees AS e
INNER JOIN Departments AS d
		ON d.DepartmentID = e.DepartmentID AND e.Salary > 15000
  ORDER BY d.DepartmentID

--5--
   SELECT TOP(3) e.EmployeeID, e.FirstName
	 FROM Employees AS e
LEFT JOIN EmployeesProjects AS p
	   ON p.EmployeeID = e.EmployeeID
	WHERE p.EmployeeID IS NULL
 ORDER BY e.EmployeeID

--6--
	SELECT e.FirstName, e.LastName, e.HireDate, d.Name AS DeptName
	  FROM Employees AS e
INNER JOIN Departments AS d
		ON d.DepartmentID = e.DepartmentID AND e.HireDate > '1.1.1999' AND d.Name IN ('Sales', 'Finance')
  ORDER BY e.HireDate

--7--
	SELECT TOP(5) e.EmployeeID, e.FirstName, p.Name AS ProjectName
	  FROM Employees AS e
INNER JOIN EmployeesProjects AS empPr
		ON empPr.EmployeeID = e.EmployeeID
INNER JOIN Projects as p
		ON p.ProjectID = empPr.ProjectID AND p.StartDate > '2002-08-13' AND p.EndDate IS NULL
  ORDER BY e.EmployeeID

--8--
	SELECT e.EmployeeID, e.FirstName,
	  CASE 
			WHEN DATEPART(YEAR, p.StartDate) >= 2005 THEN NULL
			ELSE p.Name
	END AS ProjectName
	  FROM Employees AS e
INNER JOIN EmployeesProjects AS empPr
		ON empPr.EmployeeID = e.EmployeeID AND e.EmployeeID = 24
INNER JOIN Projects as p
		ON p.ProjectID = empPr.ProjectID 

--9--
	SELECT e.EmployeeID, e.FirstName, e.ManagerID, e2.FirstName AS ManagerName
	  FROM Employees AS e
INNER JOIN Employees as e2
		ON e2.EmployeeID = e.ManagerID AND e.ManagerID IN (3, 7)
  ORDER BY e.EmployeeID

--10--
	SELECT TOP(50) e.EmployeeID,
				   CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, 
				   CONCAT(m.FirstName, ' ', m.LastName) AS ManagerName,
				   d.Name AS DepartmentName
	  FROM Employees AS e
INNER JOIN Employees AS m
		ON m.EmployeeID = e.ManagerID
INNER JOIN Departments AS d
		ON d.DepartmentID = e.DepartmentID
  ORDER BY e.EmployeeID

--11--
SELECT MIN(AvgSalaries.AvgSalary) AS MinAverageSalary FROM
		( 
			  SELECT AVG(Salary) AS AvgSalary
				FROM Employees
			GROUP BY DepartmentID
		) AS AvgSalaries

--12--
USE Geography

	SELECT mc.CountryCode, m.MountainRange, p.PeakName, p.Elevation
	  FROM Mountains AS m
INNER JOIN MountainsCountries AS mc
		ON mc.MountainId = m.Id AND mc.CountryCode = 'BG'
INNER JOIN Peaks AS p
		ON p.MountainId = m.Id AND p.Elevation > 2835
  ORDER BY p.Elevation DESC

--13--
	SELECT mc.CountryCode, COUNT(m.MountainRange) AS MountainRanges
	  FROM Mountains AS m
INNER JOIN MountainsCountries AS mc
		ON mc.MountainId = m.Id AND mc.CountryCode IN ('US', 'RU', 'BG')
  GROUP BY mc.CountryCode

--14--
	SELECT TOP(5) c.CountryName, r.RiverName 
	  FROM Rivers AS r
INNER JOIN CountriesRivers AS cr
		ON cr.RiverId = r.Id
RIGHT JOIN Countries AS c
		ON c.CountryCode = cr.CountryCode 
	 WHERE c.ContinentCode = 'AF'
  ORDER BY c.CountryName

--16--
SELECT COUNT(*)
FROM MountainsCountries AS mc
INNER JOIN Mountains AS m
ON m.Id = mc.MountainId
RIGHT JOIN Countries AS c
ON c.CountryCode = mc.CountryCode
GROUP BY c.CountryCode
