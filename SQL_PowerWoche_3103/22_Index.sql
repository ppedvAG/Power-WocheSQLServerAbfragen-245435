-- Index

/*
	Table Scan: Durchsucht die gesamte Tabelle (langsam)
	Index Scan: Durchsuche bestimmte Teile der Tabelle (besser)
	Index Seek: Geht in bestimmten Index rein um Daten rauszuholen (am besten)

	Clustered Index:
	- Ein Index der sich selber sortiert nach physischen Daten
	- bei Insert/Update werden die daten neu sortiert
	- Kann nur einmal pro tabelle existieren
	- Standardm‰ﬂig auf PK

	Wann brauch ich den Gruppierten Index?:
	- Sehr gut bei Abfragen mit Bereichen und rel. Groﬂe Ergebnismengen: <, >, between, like


	Non-Clusterd Index:
	- Zwei Komponenten: Schl¸sselspalte (Das was abgefragt wird im Where)
						inkludierten Spalten (Das was im Select abgefragt wird)
	Anhand der Inkludierten Spalten, entscheidet dann SQL welchen Index er verwendet

	Wann brauchen wir den einen Nicht-gruppierten Index:
	- Sehr gut bei Abfragen mit kleinen Ergebnismengen und rel. eindeutige Werte
	- Kann bis zu 999-Mal verwendet werden
*/

SELECT * INTO M005_Index
FROM M004_Kompression

SET STATISTICS TIME, IO ON


SELECT * FROM M005_Index

SELECT * FROM M005_Index
WHERE OrderID >= 11000
-- Table Scan
-- Cost: 21,13, logische Lesevorg‰nge: 28321, CPU-Zeit: 483ms, verstrichene Zeit = 966ms

-- Neuen Index: NCIX_OrderID

SELECT * FROM M005_Index
WHERE OrderID >= 11000
-- Index Seek
-- Cost: 2,18 , logische Lesevorg‰nge: 2890, CPU-Zeit: 188ms, verstrichene Zeit = 1115ms

-- Indizes anschauen
SELECT OBJECT_NAME(OBJECT_ID), index_level, page_count
FROM sys.dm_db_index_physical_stats(DB_ID(), 0, -1, 0, 'DETAILED')
WHERE OBJECT_NAME(object_id) = 'M005_Index'

SELECT CompanyName, ContactName, ProductName, Quantity * UnitPrice
FROM M005_Index
WHERE ProductName = 'Chocolade'
--Table Scan
-- Cost: 21,24 , logische Lesevorg‰nge: 28321, CPU-Zeit = 94ms, verstrichene Zeit = 92ms

-- NCIX_ProductName
--Index Seek
-- Cost: 0,02 , logische Lesevorg‰nge: 26, CPU-Zeit = 0ms, verstrichene Zeit = 77ms

-- Selbe Abfrage, bloﬂ ContactName
SELECT CompanyName, ProductName, Quantity * UnitPrice
FROM M005_Index
WHERE ProductName = 'Chocolade'

-- Alle Included Columns werden geholt + ein Lookup auf die fehlenden Daten gemacht
SELECT CompanyName, ContactName, ProductName, Quantity * UnitPrice, Freight
FROM M005_Index
WHERE ProductName = 'Chocolade'
GO

-- Indizierte Sicht:
-- View mit Index
-- WITH SCHEMABINDING: Solange die View existiert, kann die Tabellenstruktur nicht ver‰ndert werden
ALTER TABLE M005_Index ADD id int identity
GO

CREATE VIEW Adressen WITH SCHEMABINDING
AS
SELECT id, CompanyName, Address, City, Region, PostalCode, Country
FROM dbo.M005_Index

-- Gruppierter Index
SELECT * FROM Adressen

-- Abfrage die hinter der View liegt
SELECT id, CompanyName, Address, City, Region, PostalCode, Country
FROM dbo.M005_Index

SELECT * FROM M005_Index

-- Insert in die M005_INDEX
INSERT INTO M005_Index (CompanyName, Address, City, Region, PostalCode, Country, CustomerID, OrderID, EmployeeID, ProductID)
VALUES ('PPEDV', 'Eine Straﬂe', 'Irgendwo', NULL, NULL, NULL, 'PPEDV', 10000, 1, 2)

-- Delete von dem neu hinzugef¸gten Datensatz
DELETE FROM M005_Index
WHERE id = 551681
  and CompanyName = 'PPEDV'
  and Address = 'Eine Straﬂe'
  and City = 'Irgendwo'
  and Region IS NULL
  and PostalCode IS NULL
  and Country IS NULL