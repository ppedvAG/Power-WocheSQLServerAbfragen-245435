USE Northwind
GO

-- Stored Procedures / gespeicherte Prozeduren

/*
	- Sind gespeichert SQL Anweisungen (nicht nur SELECT, sondern auch alles andere)
	- Arbeiten mit Variablen
	- Werden als DB Objekt auf der DB gespeichert
	- Praktisch zum automatiseren von Code
	- Prozeduren verwenden Ihren QueryPlan jedes mal wieder
*/

CREATE PROCEDURE spByOrderID @OrderID INT
AS
SELECT * FROM Orders
WHERE OrderID = @OrderID

-- Prozedur ausführen
EXEC spByOrderID 10248
GO


-- Prozedur für Neue Kunden
CREATE PROCEDURE spNewCustomer
@CustomerID char(5), @CompanyName VARCHAR(40),
@Country varchar(30), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomer 'ALDIS', 'ppedv AG', 'Germany', 'Burghausen'
EXEC spNewCustomer LIDLI, ppedvAG, Germany, Burghausen

SELECT * FROM Customers
GO

-- Default Werte
CREATE PROCEDURE spKundeLandCity 
@Country varchar(50) = 'Germany', @City varchar(30) = 'Berlin'
AS
SELECT * FROM Customers
WHERE Country = @Country AND City = @City
GO

EXEC spKundeLandCity DEFAULT, Köln