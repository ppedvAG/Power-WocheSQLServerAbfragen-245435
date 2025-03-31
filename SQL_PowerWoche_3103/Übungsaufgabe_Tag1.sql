-- Übungen
-- 1. Welche Produkte (ProductName) hat "Leverling" bisher verkauft?
-- Tabelle: Employees - Orders - Order Details - Products
SELECT ProductName, LastName FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE LastName = 'Leverling'

-- 2. Wieviel Bestellungen haben Kunden aus Argentinien aufgegeben 
-- Tabelle: Customers - Orders
SELECT OrderID FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Argentina'

-- 3. Was war die größte Bestellmenge (Quantity) von Chai Tee (ProductName)
-- Tabelle: Order Details - Products
SELECT TOP 1 ProductName, Quantity FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Chai'
ORDER BY Quantity DESC

-- 4. Bestellungen die Herr King bearbeitet
-- Tabelle: Orders - Employees
SELECT * FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'King'

------------------------------------------------
-- OUTER Joins: LEFT/RIGHT und FULL OUTER geschichte

-- LEFT
-- Alle Datensätze aus der Linken Tabelle, auch wenn es keine Passende Verknüpfung gibt
-- HÄTTEN: Bestellungen, wo kein Kunde hinterlegt ist
SELECT * FROM Orders 
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID

-- RIGHT: Z.189 & Z.502
-- Alle Datensätze aus der Rechten Tabelle, auch wenn es keine Passende Verknüpfung gibt
-- Kunden ohne Bestellunngen
SELECT * FROM Orders 
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID

-- FULL OUTER:
SELECT * FROM Orders 
FULL OUTER JOIN Customers ON Orders.CustomerID = Customers.CustomerID

-- JOIN "invertieren", d.h keine Schnittmenge anzeigen
SELECT * FROM Orders 
FULL OUTER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderID IS NULL OR Customers.CustomerID IS NULL

-- CROSS JOIN: Erstellt karthesisches Produkt zweier Tabelle (A x B)
SELECT * FROM Orders CROSS JOIN Customers -- (830 x 91) = 75.530

-- SELF JOIN
SELECT E1.EmployeeID, E1.LastName as Vorgesetzte, E2.EmployeeID, E2.LastName AS Mitarbeiter 
FROM Employees as E1
JOIN Employees as E2 ON E1.EmployeeID = E2.ReportsTo