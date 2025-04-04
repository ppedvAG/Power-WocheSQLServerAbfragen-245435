-- Kompression

-- Daten verkleinern
---> Wenn weniger Daten geladen werden, beim komprimieren wird CPU-Leistung verwendet

-- Zwei verschieden Typen
-- Row Compression: bis zu 50% komprimieren
-- Page Compression: bis zu 75% komprimieren
-- Page Compression enthält sogar die Row Compression

USE Northwind;
SELECT  Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, Orders.Freight, Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.ContactTitle, Customers.Address, Customers.City, 
        Customers.Region, Customers.PostalCode, Customers.Country, Customers.Phone, Orders.OrderID, Employees.EmployeeID, Employees.LastName, Employees.FirstName, Employees.Title, [Order Details].UnitPrice, 
        [Order Details].Quantity, [Order Details].Discount, Products.ProductID, Products.ProductName, Products.UnitsInStock
INTO Demo4.dbo.M004_Kompression
FROM    [Order Details] INNER JOIN
        Products ON Products.ProductID = [Order Details].ProductID INNER JOIN
        Orders ON [Order Details].OrderID = Orders.OrderID INNER JOIN
        Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
        Customers ON Orders.CustomerID = Customers.CustomerID

USE Demo4

SELECT * FROM M004_Kompression

INSERT INTO M004_Kompression
SELECT * FROM M004_Kompression
GO 8

-- Rechtsklick auf Tabelle => Speicher => Komprimierung Verwalten

SET STATISTICS TIME, IO ON

SELECT * FROM M004_Kompression
-- Ohne Compression: logische Lesevorgänge: 28288
-- CPU-Zeit: 1171ms, verstrichene Zeit = 8440ms

SELECT * FROM M004_Kompression

USE [Demo4]
ALTER TABLE [dbo].[M004_Kompression] REBUILD PARTITION = ALL
WITH
(DATA_COMPRESSION = ROW)
-- Row Compression: logische Lesevorgänge: 15841
-- CPU-Zeit: 1843ms, verstrichene Zeit = 8817ms

SELECT * FROM M004_Kompression

USE [Demo4]
ALTER TABLE [dbo].[M004_Kompression] REBUILD PARTITION = ALL
WITH
(DATA_COMPRESSION = PAGE)
-- Row Compression: logische Lesevorgänge: 7562
-- CPU-Zeit: 2718ms, verstrichene Zeit = 9560ms

-- Kompression mit Partitionen ausgeben
SELECT OBJECT_NAME(OBJECT_ID), * FROM sys.dm_db_index_physical_stats(DB_ID(), 0, -1, 0, 'DETAILED')
WHERE compressed_page_count != 0