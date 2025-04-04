USE Northwind
GO

-- Versuch Nr.1 : Passiert nix => Fehler
-- Prozedur: spNeuerKunde_Test1
-- Variablen: @CustomerID = char(5), @CompanyName = varchar(40)
--			  @Country = varchar(20), @City = varchar(30)
-- Defaulte Werte:
-- Bedingung: @Country Default Wert muss mehr als 20 Zeichenketten ueberschreiben
CREATE PROCEDURE spNeuerKunde_Test1
@CustomerID char(5) = '12345', @CompanyName varchar(40) = 'Hallo123',
@Country varchar(20) = 'GermanyGermanyGermanyGermany', @City varchar(30) = 'Berlin'
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNeuerKunde_Test1
-- Fehlermeldung:
-- Zeichenfolgen- oder Binärdaten werden in Tabelle "Northwind.dbo.Customers", Spalte "Country" abgeschnitten
SELECT * FROM Customers
GO

-- Versuch Nr.2
-- Prozedur: spNeuerKunde_Test2
-- Variablen: @CustomerID = char(5), @CompanyName = varchar(40)
--			  @Country = varchar(20), @City = varchar(30)
-- OHNE DEFAULT WERTE => Bei der Ausgabe Wert überstreiten
CREATE PROCEDURE spNeuerKunde_Test2
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(20), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNeuerKunde_Test2 67890, Hallo124, GermanyGermanyGermanyGermany, Berlin
-- Zeichenfolgen- oder Binärdaten werden in Tabelle "Northwind.dbo.Customers", Spalte "Country" abgeschnitten
SELECT * FROM Customers
GO

-- Versuch Nr.3
-- Prozedur: spNeuerKunde_Test3
-- Variablen: @CustomerID = char(5), @CompanyName = varchar(40)
--			  @Country = varchar(10), @City = varchar(30)
-- OHNE DEFAULT WERTE => Bei der Ausgabe Wert überstreiten
CREATE PROCEDURE spNeuerKunde_Test3
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(10), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNeuerKunde_Test3 12345, 'ppedv ag', GermanyGermanyGermanyGermany, Berlin

SELECT * FROM Customers
GO

-- Versuch Nr.4 : 
-- Prozedur: spNeuerKunde_Test4
-- Variablen: @CustomerID = char(5), @CompanyName = varchar(40)
--			  @Country = varchar(10), @City = varchar(30)
-- Defaulte Werte:
-- Bedingung: @Country Default Wert muss mehr als 10 Zeichenketten ueberschreiben

CREATE PROCEDURE spNeuerKunde_Test4
@CustomerID char(5) = '67809', @CompanyName varchar(40) = 'Hallo123',
@Country varchar(10) = 'GermanyGermanyGermanyGermany', @City varchar(30) = 'Berlin'
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNeuerKunde_Test4

SELECT * FROM Customers
GO
