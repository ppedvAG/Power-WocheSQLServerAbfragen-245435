USE Northwind

-- String Funktionen bzw. Text-Datentypen manipulieren

-- LEN gibt die laenge des Strings zurück 
SELECT CompanyName, LEN(CompanyName) FROM Customers

-- LEFT/RIGHT geben die "linken" oder "rechten" Character zurück
SELECT CompanyName, LEFT(CompanyName, 5) FROM Customers
SELECT CompanyName, RIGHT(CompanyName, 5) FROM Customers

-- SUBSTRING(Spalte, x, y) springt mir zu Position x in einem String und gibt mir y Zeichen aus
SELECT SUBSTRING(CompanyName, 5, 5), CompanyName FROM Customers

-- STUFF(Spalte, x, y, replace) ersetzt y Zeichen eines Strings ab Position x mit
-- "replace Wert" (optional)
SELECT STUFF(Phone, LEN(Phone) - 4, 5, 'XXXXX') FROM Customers	

-- CONCAT fügt mehrere Strigs in die Selbe Spalte hinzu
SELECT CONCAT(FirstName, ' ', LastName, ' Supertyp') FROM Employees
SELECT FirstName + ' ' + LastName FROM Employees

-- Datumsfunktionen

SELECT GETDATE() --aktuelle Systemzeit aufrufen
SELECT CURRENT_TIMESTAMP

-- Zeitintervalle rausziehen
SELECT YEAR(OrderDate) as Jahr, MONTH(OrderDate) as Monat, DAY(OrderDate) AS Tag,
OrderDate
FROM Orders

-- DATEPART - Zeitintervall rausziehen
SELECT
DATEPART(YEAR, OrderDate) as JAHR,
DATEPART(QUARTER, OrderDate) as Quartal,
DATEPART(WEEK, OrderDate) as KW,
DATEPART(WEEKDAY, OrderDate) as Wochentag,
DATEPART(HOUR, OrderDate) as Stunde
FROM Orders

-- Zieht ein IntervallNamen aus einem Datum
SELECT DATENAME(MONTH, OrderDate), DATENAME(WEEKDAY, OrderDate),
OrderDAte FROM Orders

-- Intervall zu einem Datum addieren/subtrahiern
SELECT DATEADD(DAY, 14, GETDATE())
SELECT DATEADD(DAY, -14, GETDATE())

-- Diffferenz in Intervall xy zwischen 2 Datum
SELECT DATEDIFF(YEAR, '20050213', GETDATE())
SELECT DATEDIFF(YEAR, OrderDate, GETDATE()), OrderDate FROM Orders


-- Übungen:
-- BSP. Alle Bestellungen (Orders) aus Q2 in 1997
SELECT * FROM Orders
WHERE DATEPART(YEAR, OrderDate) = 1997 AND DATEPART(QUARTER, OrderDate) = 2

-- ODER
SELECT * FROM Orders
WHERE OrderDate BETWEEN '01.04.1997' AND '30.06.1997' -- Format: DD.MM.YYY ODER YYYYMMDD


-- 1. Alle Bestellungen (Orders) aus den USA (Customers Country) die im Jahr 1997 aufgegeben wurden
-- (OrderDate in Orders)
--> Customers - Orders
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'USA' AND DATEPART(YEAR, OrderDate) = 1997

-- 2. Welches Produkt (ProductName) hatte die groeßte Bestellmenge (Quantity in OD) im Februar 1998?
SELECT TOP 1 ProductName FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE DATEPART(YEAR, OrderDate) = 1998 AND DATEPART(MONTH, OrderDate) = 2
ORDER BY Quantity DESC

-- Mehrere Funktion
-- CAST oder CONVERT, wandeln Datentypen in der Ausgabe um
-- datetime => date
SELECT CAST(OrderDate as date) FROM Orders
SELECT CONVERT(date, OrderDate) FROM Orders

-- Format: Datumskonvertierung mit Formatierung kombinieren
DECLARE @d AS DATE = '08/09/2024';

SELECT FORMAT(@d, 'd', 'en-US') AS 'US English',
       FORMAT(@d, 'd', 'en-gb') AS 'British English',
       FORMAT(@d, 'd', 'de-de') AS 'German',
       FORMAT(@d, 'd', 'zh-cn') AS 'Chinese Simplified (PRC)';

SELECT FORMAT(@d, 'D', 'en-US') AS 'US English',
       FORMAT(@d, 'D', 'en-gb') AS 'British English',
       FORMAT(@d, 'D', 'de-de') AS 'German',
       FORMAT(@d, 'D', 'zh-cn') AS 'Chinese Simplified (PRC)';

SELECT TOP 5 Freight,
	FORMAT(Freight, 'N', 'de-de'),
	FORMAT(Freight, 'G', 'de-de'),
	FORMAT(Freight, 'C', 'de-de')
FROM Orders

-- ISNULL prüft Null Werte, und kann diese Ersetzen
SELECT * FROM Customers
SELECT ISNULL(Fax, 'Nicht vorhanden!') as KeineFax, Fax FROM Customers

-- REPLACE(x, y, z) => "y" sucht in "x" den String um Ihn mit "z" zu ersetzen
SELECT REPLACE('Hallo Welt!', 'Welt!', 'und Willkommen')

-- REPLICATE(x, y) => Setze "y" mal die "x" vor der Spalte 
SELECT REPLICATE('0', 3) + Phone FROM Customers