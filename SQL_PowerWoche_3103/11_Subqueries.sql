USE Northwind

-- Subqueries / Unterabfragen / nested Queries

/*
	- Muessen eigenständig fehlerfrei ausführbar sein!
	- Können überall in eine Abfrage eingebaut (wenn es Sinn macht)
	- Abfragen werden von "innen nach außen" der Reihe nach ausgeführt
*/

-- Zeige mir alle Orders an, deren Freight Wert üer dem Durchschnitt liegen
SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

-- 1. Eine Abfrage, um eine Produktliste
-- (ID, Name, Stückpreis) mit einem überdurchschnittlichen Stückpreis zu erhalten
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)