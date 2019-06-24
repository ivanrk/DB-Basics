CREATE DATABASE Relations
USE Relations

--1--
CREATE TABLE Passports (
	PassportID INT IDENTITY(101, 1),
	PassportNumber NVARCHAR(30) NOT NULL
)

CREATE TABLE People (
	PersonID INT IDENTITY,
	FirstName NVARCHAR(20) NOT NULL,
	Salary DECIMAL(15, 2) NOT NULL,
	PassportID INT NOT NULL
)

INSERT INTO Passports
VALUES
('N34FG21B'),
('K65LO4R7'),
('ZE657QP2')

INSERT INTO People
VALUES
('Roberto', 43300.00, 102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101)

ALTER TABLE People
ADD CONSTRAINT PK_People
PRIMARY KEY(PersonID)

ALTER TABLE Passports
ADD CONSTRAINT PK_Passports
PRIMARY KEY(PassportID)

ALTER TABLE People
ADD CONSTRAINT FK_People_Passports
FOREIGN KEY(PassportID)
REFERENCES Passports(PassportID)

--2--
CREATE TABLE Manufacturers (
	ManufacturerID INT IDENTITY,
	[Name] NVARCHAR(30) NOT NULL,
	EstablishedOn DATETIME
	
	CONSTRAINT PK_Manufacturers
	PRIMARY KEY(ManufacturerID)
)

CREATE TABLE Models (
	ModelID INT IDENTITY(101, 1),
	[Name] NVARCHAR(30) NOT NULL,
	ManufacturerID INT NOT NULL

	CONSTRAINT PK_Models
	PRIMARY KEY(ModelID)

	CONSTRAINT FK_Models_Manufacturers
	FOREIGN KEY(ManufacturerID)
	REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Manufacturers
VALUES
('BMW', '07/03/1916'),
('Tesla', '01/01/2003'),
('Lada', '01/05/1966')

INSERT INTO Models
VALUES
('X1', 1),
('i6', 1),
('Model S', 2),
('Model X', 2),
('Model 3', 2),
('Nova', 3)

--3--
CREATE TABLE Students (
	StudentID INT IDENTITY,
	[Name] NVARCHAR(30)

	CONSTRAINT PK_Students
	PRIMARY KEY(StudentID)
)

CREATE TABLE Exams (
	ExamID INT IDENTITY(101, 1),
	[Name] NVARCHAR(30)

	CONSTRAINT PK_Exams
	PRIMARY KEY(ExamID)
)

CREATE TABLE StudentsExams (
	StudentID INT NOT NULL,
	ExamID INT NOT NULL

	CONSTRAINT PK_StudentsExams
	PRIMARY KEY(StudentID, ExamID),

	CONSTRAINT FK_StudentsExams_Students
	FOREIGN KEY(StudentID)
	REFERENCES Students(StudentID),

	CONSTRAINT FK_StudentsExams_Exams
	FOREIGN KEY(ExamID)
	REFERENCES Exams(ExamID)
)

INSERT INTO Students
VALUES
('Mila'),
('Toni'),
('Ron')

INSERT INTO Exams
VALUES
('SpringMVC'),
('Neo4j'),
('Oracle 11g')

INSERT INTO StudentsExams
VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103)

--4--
CREATE TABLE Teachers (
	TeacherID INT IDENTITY(101, 1),
	[Name] NVARCHAR(30) NOT NULL,
	ManagerID INT

	CONSTRAINT PK_Teachers
	PRIMARY KEY(TeacherID)

	CONSTRAINT FK_Teachers
	FOREIGN KEY(ManagerID)
	REFERENCES Teachers(TeacherID)
)

INSERT INTO Teachers
VALUES
('John', NULL),
('Maya', 106),
('Silvia', 106),
('Ted', 105),
('Mark', 101),
('Greta', 101)

--5--
CREATE DATABASE OnlineStore
USE OnlineStore

CREATE TABLE Cities (
	CityID INT NOT NULL,
	[Name] VARCHAR(50) NOT NULL

	CONSTRAINT PK_Cities
	PRIMARY KEY(CityID)
)

CREATE TABLE Customers (
	CustomerID INT NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	Birthday DATE,
	CityID INT NOT NULL

	CONSTRAINT PK_Customers
	PRIMARY KEY(CustomerID)

	CONSTRAINT FK_Customers_Cities
	FOREIGN KEY(CityID)
	REFERENCES Cities(CityID)
)

CREATE TABLE Orders (
	OrderID INT NOT NULL,
	CustomerID INT NOT NULL

	CONSTRAINT PK_Orders
	PRIMARY KEY(OrderID)

	CONSTRAINT FK_Orders_Customers
	FOREIGN KEY(CustomerID)
	REFERENCES Customers(CustomerID)
)

CREATE TABLE ItemTypes (
	ItemTypeID INT NOT NULL,
	[Name] VARCHAR(50) NOT NULL

	CONSTRAINT PK_ItemTypes
	PRIMARY KEY(ItemTypeID)
)

CREATE TABLE Items (
	ItemID INT NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	ItemTypeID INT NOT NULL

	CONSTRAINT PK_Items
	PRIMARY KEY(ItemID)

	CONSTRAINT FK_Items_ItemTypes
	FOREIGN KEY(ItemTypeID)
	REFERENCES ItemTypes(ItemTypeID)
)

CREATE TABLE OrderItems (
	OrderID INT NOT NULL,
	ItemID INT NOT NULL

	CONSTRAINT PK_OrderItems
	PRIMARY KEY(OrderID, ItemID)

	CONSTRAINT FK_OrderItems_Orders
	FOREIGN KEY(OrderID)
	REFERENCES Orders(OrderID),

	CONSTRAINT FK_OrderItems_Items
	FOREIGN KEY(ItemID)
	REFERENCES Items(ItemID)
)

--6--
CREATE DATABASE University
USE University

CREATE TABLE Majors (
	MajorID INT NOT NULL,
	[Name] VARCHAR(50)

	CONSTRAINT PK_Majors
	PRIMARY KEY(MajorID)
)

CREATE TABLE Students (
	StudentID INT NOT NULL,
	StudentNumber VARCHAR(50) NOT NULL,
	StudentName VARCHAR(50) NOT NULL,
	MajorID INT NOT NULL

	CONSTRAINT PK_Students
	PRIMARY KEY(StudentID)

	CONSTRAINT PK_Students_Majors
	FOREIGN KEY(MajorID)
	REFERENCES Majors(MajorID)
)

CREATE TABLE Payments (
	PaymentID INT NOT NULL,
	PaymentDate DATE NOT NULL,
	PaymentAmount DECIMAL(15, 2),
	StudentID INT NOT NULL

	CONSTRAINT PK_Payments
	PRIMARY KEY(PaymentID)

	CONSTRAINT FK_Payments_Students
	FOREIGN KEY(StudentID)
	REFERENCES Students(StudentID)
)

CREATE TABLE Subjects (
	SubjectID INT NOT NULL,
	SubjectName VARCHAR(50) NOT NULL

	CONSTRAINT PK_Subjects
	PRIMARY KEY(SubjectID)
)

CREATE TABLE Agenda (
	StudentID INT NOT NULL,
	SubjectID INT NOT NULL

	CONSTRAINT PK_Agenda
	PRIMARY KEY(StudentID, SubjectID),

	CONSTRAINT FK_Agenda_Students
	FOREIGN KEY(StudentID)
	REFERENCES Students(StudentID),

	CONSTRAINT FK_Agenda_Subjects
	FOREIGN KEY(SubjectID)
	REFERENCES Subjects(SubjectID)
)

--9--
USE Geography

SELECT m.MountainRange, p.PeakName, p.Elevation 
FROM Mountains AS m
JOIN Peaks AS p
ON p.MountainID = m.Id
WHERE m.MountainRange = 'Rila'
ORDER BY p.Elevation DESC