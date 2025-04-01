USE Northwind
GO -- Batchtrennzeichen

-- Views: Ansichten: Erzeugen eine "Virtuelle Tabelle", deren Inhalt durch eine Abfrage definiert wird
/*
	Vorteile:
	- Um komplexere Abfragen zu speichern
	- Sicherheit: User erlauben nur die View zu lesen, nicht zu verändern
	- Views sind immer aktuell (aktuelle Daten)
		=> beim Aufruf einer View wird das hinterlegt Statement ausgeführt
*/

CREATE VIEW vRechnungsDaten AS
SELECT
Orders.OrderID, 
Customers.CustomerID, Customers.CompanyName, Customers.Country, Customers.City, Customers.PostalCode, Customers.Address,
Orders.Freight, Orders.OrderDate,
Employees.LastName,
CAST(SUM((UnitPrice * Quantity) * (1 - Discount)) + Freight as decimal(10,2)) as SummeBestPosi 
FROM [Order Details]
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.OrderID, 
Customers.CustomerID, Customers.CompanyName, Customers.Country, Customers.City, Customers.PostalCode, Customers.Address,
Orders.Freight, Orders.OrderDate,
Employees.LastName
GO

-- Aufrufen der View
SELECT * FROM vRechnungsDaten
GO


-- View abändern 
ALTER VIEW vRechnungsDaten AS
SELECT
Orders.OrderID, 
Customers.CustomerID, Customers.CompanyName, Customers.Country, Customers.City, Customers.PostalCode, Customers.Address,
Orders.Freight, Orders.OrderDate,
Employees.LastName,
CAST(SUM((UnitPrice * Quantity) * (1 - Discount)) + Freight as decimal(10,2)) as SummeBestPosi 
FROM [Order Details]
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.OrderID, 
Customers.CustomerID, Customers.CompanyName, Customers.Country, Customers.City, Customers.PostalCode, Customers.Address,
Orders.Freight, Orders.OrderDate,
Employees.LastName
GO

-- Löschen der View
DROP VIEW vRechnungsDaten
GO

-- Das umbasteln zur View
CREATE VIEW vTestAnsicht AS
SELECT CategoryName, SUM(Quantity) as SummeQuantity FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.ProductID
GROUP BY  CategoryName
GO

SELECT * FROM vTestAnsicht