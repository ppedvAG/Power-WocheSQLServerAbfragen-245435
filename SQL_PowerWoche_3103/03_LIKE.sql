USE Northwind
-- LIKE: Für ungenaue Filterung/Suche können wir LIKE verwenden
-- (statt Vergleichsoperator)

SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE 'Manager'

-- Wildcards
-- "%"-Zeichen: Beliebige Symbol, beliebig viele davon
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Manager%'

-- "_"-Zeichen: Ein beliebiges Symbol
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '_l%'

-- "[]"-Zeichen: Alles in den Klammern ist ein gültiges Symbol für diese Stelle
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[012345]%'

-- "[a-z] oder Gegenteil mit ^ [^a-z] = Carot
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[0-3]%'

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[^123]%'

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[1-3 a-g]%'

-- Sonderfälle: % '
SELECT * FROM Customers
WHERE CompanyName LIKE '%['']%'

SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'

-- Übung:
-- 1. Alle ShipPostalCodes anzeigen lässt, die mit 0,2 oder 4 beginnen
SELECT ShipPostalCode FROM Orders
WHERE ShipPostalCode LIKE '[0,2,4]%'

-- Auch möglich..
SELECT ShipPostalCode FROM Orders
WHERE ShipPostalCode LIKE '[0]%' OR ShipPostalCode LIKE '[2]%' OR ShipPostalCode LIKE '[4]%'
