CREATE DATABASE Minions
USE Minions

CREATE TABLE Minions (
	Id INT PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL,
	Age INT,
)

CREATE TABLE Towns (
	Id INT PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL
)

ALTER TABLE Minions
ADD TownId INT FOREIGN KEY REFERENCES Towns(Id)

INSERT INTO Towns (Id, Name) 
VALUES
('1', 'Sofia'),
('2', 'Plovdiv'),
('3', 'Varna')

INSERT INTO Minions (Id, Name, Age)
VALUES
(1, 'Kevin', 22),
(2, 'Bob', 15),
(3, 'Steward', NULL)

TRUNCATE TABLE Minions
DROP TABLE Minions
DROP TABLE Towns

CREATE TABLE People (
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(200) NOT NULL,
	Picture VARBINARY(MAX) CHECK(DATALENGTH(PICTURE) > 1024 * 1024 * 2),
	Height DECIMAL(3, 2),
	[Weight] DECIMAL(5, 2),
	Gender CHAR(1) CHECK(Gender = 'm' OR GENDER = 'f') NOT NULL,
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX) 
)

INSERT INTO People (Name, Picture, Height, [Weight], Gender, Birthdate, Biography) VALUES
('Pesho Marinov', NULL, 1.80, 55.23, 'm', Convert(DateTime,'19820626', 112), 'Skilled worker'),
('Ivan Dimov', NULL, 1.75, 75.55, 'm', Convert(DateTime,'19850608', 112), 'Basketball player'),
('Todorka Peneva', NULL, 1.66, 48.55, 'f', Convert(DateTime,'19900606', 112), 'Model'),
('Dilyana Ivanova', NULL, 1.77, 52.22, 'f', Convert(DateTime,'19920705', 112), 'Fashion guru'),
('Todor Stamatov', NULL, 1.88, 98.25, 'm', Convert(DateTime,'19870706', 112), 'Master')

INSERT INTO PEOPLE 
VALUES 
('Kalin Terziev', NULL, 1.80, 1555.23, 'm', Convert(DateTime,'19920626', 112), 'Skilled worker')

--*8*--
CREATE TABLE Users (
	Id BIGINT PRIMARY KEY IDENTITY,
	Username VARCHAR(30) UNIQUE NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX),
	LastLoginTime DATETIME,
	IsDeleted BIT
)

INSERT INTO Users VALUES
('tosho92', 'toshoooo88', NULL, CONVERT(DATETIME, '22-02-2018', 103), 0),
('gosho75', 'gosho99213', NULL, CONVERT(DATETIME, '13-03-2018', 103), 0),
('petko82', 'petko443431', NULL, CONVERT(DATETIME, '24-02-2018', 103), 0),
('sasho99', 'sasho42121', NULL, CONVERT(DATETIME, '11-04-2018', 103), 0),
('marto55', 'marto21321', NULL, CONVERT(DATETIME, '15-02-2018', 103), 0)

ALTER TABLE Users
ADD CONSTRAINT CHK_ProfilePicture CHECK(DATALENGTH(ProfilePicture) <= 900 * 1024)

ALTER TABLE Users
DROP CONSTRAINT PK__Users__3214EC079508DBB2

ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY(Id, Username)

ALTER TABLE Users
ADD DEFAULT GETDATE() FOR LastLoginTime

INSERT INTO Users (Username, [Password], ProfilePicture, IsDeleted)
VALUES
('asdsa', 'toshoooo88', NULL, 0)

INSERT INTO Users (Username, [Password], ProfilePicture, LastLoginTime, IsDeleted)
VALUES
('manata', 'toshoooo88', NULL, CONVERT(DATETIME, '10-08-2018', 103), 0)

INSERT INTO Users (Username, [Password], ProfilePicture, LastLoginTime, IsDeleted)
VALUES
('peshaka', 'toshoooo88', NULL, CONVERT(DATETIME, '10/08/2018', 103), 0)

ALTER TABLE Users
ADD CONSTRAINT PSW_LENGTH CHECK(LEN([Password]) >= 5)

INSERT INTO Users (Username, [Password], ProfilePicture, IsDeleted)
VALUES
('todor', 'tosko', NULL, 0)

ALTER TABLE Users
DROP CONSTRAINT PK_Users

ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY(Id)

ALTER TABLE Users
ADD CONSTRAINT CHK_UsernameLength CHECK(LEN(Username) >= 3)

INSERT INTO Users (Username, [Password], ProfilePicture, IsDeleted)
VALUES
('pess', 'toshoooo88', NULL, 0)

--******************-----

CREATE DATABASE Movies 
USE Movies

CREATE TABLE Directors (
	Id INT PRIMARY KEY IDENTITY,
	DirectorName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(150)
)

CREATE TABLE Genres (
	Id INT PRIMARY KEY IDENTITY,
	GenreName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(150)
)

CREATE TABLE Categories (
	Id INT PRIMARY KEY IDENTITY,
	CategoryName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(150)
)

CREATE TABLE Movies (
	Id INT PRIMARY KEY IDENTITY,
	Title NVARCHAR(50) NOT NULL,
	DirectorId INT FOREIGN KEY REFERENCES Directors(Id) NOT NULL,
	CopyrightYear INT NOT NULL,
	[Length] DECIMAL(5, 2),
	GenreId INT FOREIGN KEY REFERENCES Genres(Id) NOT NULL,
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
	Rating DECIMAL(3, 2) NOT NULL,
	Notes NVARCHAR(150)
)

INSERT INTO Directors (DirectorName, Notes)
VALUES
('Todor Stankov', 'Director Stankov..'),
('Kamen Golev', 'Director Golev..'),
('Petar Panev', 'Director Panev..'),
('Samuil Cankov', 'Director Cankov..'),
('Georgi Kamenarov', 'Director Kamenarov..')

INSERT INTO Genres (GenreName)
VALUES
('Comedy'),
('Action'),
('Drama'),
('Adventure'),
('Horror')

INSERT INTO Categories (CategoryName)
VALUES
('First Category'),
('Second Category'),
('Third Category'),
('Fourth Category'),
('Fifth Category')

INSERT INTO MOVIES (Title, DirectorId, CopyrightYear, [Length], GenreId, CategoryId, Rating, Notes)
VALUES
('First Movie', 1, 2007, 125, 1, 1, 8, 'Very good movie!'),
('Second Movie', 2, 2009, 180.55, 2, 2, 8.77, 'Very good movie!'),
('Third Movie', 3, 2010, 140.15, 3, 3, 9.2, 'Very good movie!'),
('Fourth Movie', 4, 2011, 220.30, 4, 4, 7, 'Very good movie!'),
('Fifth Movie', 5, 2018, 111.11, 5, 5, 6.25, 'Very good movie!')

INSERT INTO MOVIES (Title, DirectorId, CopyrightYear, [Length], GenreId, CategoryId, Rating, Notes)
VALUES
('Seventh Movie', 1, 2007, 90, 1, 1, 8, 'Very good movie!')