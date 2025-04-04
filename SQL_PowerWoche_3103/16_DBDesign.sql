/*
	Pages/Seite:
	8192 Bytes (8kB)
	132B	=> Management Daten
	8060B	=> Tatsächliche Daten
	8 Seiten => 1 Block

	Max. 700 DS pro Seite
	Datensätzen müssen komplett auf eine Seite passen
	Leerer Raum darf existieren, soltle aber minimiert werden
*/

-- dbcc: Database Console Commands
-- showcontig: Zeigt Seiteninformationen über ein Datenbankobjekt an
dbcc showcontig('Orders')

-- Messung
SET STATISTICS time, IO OFF-- Anzahl der Seiten lesen
--SELECT * FROM Orders -- Dauer in MS, Auführungszeit + CPU-Zeit

CREATE DATABASE Demo4

USE Demo4

CREATE TABLE M001_Test1
(
	id int identity(1, 1),
	test char(4100)
)

INSERT INTO M001_Test1
VALUES('XYZ')
GO 20000

SELECT * FROM M001_Test1

dbcc showcontig('M001_Test1') 
-- Seiten: 20000 
-- Seitendichte: 50.79%

CREATE TABLE M001_Test2
(
	id int identity(1, 1),
	test varchar(4100)
)

INSERT INTO M001_Test2
VALUES('XYZ')
GO 20000

SELECT * FROM M001_Test2

dbcc showcontig('M001_Test2') 
-- Seiten: 52
-- Seitendichte: 95,01%


CREATE TABLE M001_Test3
(
	id int identity(1, 1),
	test varchar(MAX)
)

INSERT INTO M001_Test3
VALUES('XYZ')
GO 20000

SELECT * FROM M001_Test3

dbcc showcontig('M001_Test3') 


CREATE TABLE M001_Test4
(
	id int identity(1, 1),
	test nvarchar(MAX)
)

INSERT INTO M001_Test4
VALUES('XYZ')
GO 20000

SELECT * FROM M001_Test4

dbcc showcontig('M001_Test4') 

-- alle Datensätze aus der Tabelle Orders aus dem Jahr 1997 (OrderDate)
-- SET STATISTICS TIME, IO ON
-- Abfragen auf CPU-Zeit, Ausführungszeit, logische Lesevorgänge
USE Northwind

SELECT * FROM Orders 
WHERE OrderDate LIKE '%1997%'
-- CPU-Zeit: 0ms, verstrichene Zeit = 50ms, logische Lesevorgänge: 22

SELECT * FROM Orders
WHERE DATEPART(YEAR, OrderDate) = 1997
GO 500
-- CPU-Zeit: 0ms, verstrichene Zeit = 47ms, logische Lesevorgänge: 22

SELECT * FROM Orders 
WHERE OrderDate BETWEEN '1.1.1997' AND '31.12.1997 23:59:59.997'
-- CPU-Zeit: 0ms, verstrichene Zeit = 61ms, logische Lesevorgänge: 22

SELECT * FROM Orders 
WHERE OrderDate BETWEEN '1.1.1997 00:00:00.000' AND '31.12.1997 23:59:59.997'
-- CPU-Zeit: 0ms, verstrichene Zeit = 55ms, logische Lesevorgänge: 22

-- Fuellgrade:
-- 70% Ok, 80% gut, 90% sehr gut
-- Seitendichte!!


