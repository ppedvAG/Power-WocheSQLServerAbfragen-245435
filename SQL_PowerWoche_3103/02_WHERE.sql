USE Northwind

-- WHERE: filtert Ergebniszeilen
SELECT * FROM Customers
WHERE Country = 'Germany'

-- = wird nach exakten Treffern gefiltert
SELECT * FROM Customers
WHERE Country = ' Germany'

-- alle boolschen Vergleichsoperatoren
-- (>, <, >=, != bzw <>)
SELECT * FROM Orders
WHERE Freight > 500

SELECT * FROM Customers
WHERE Country != 'Germany'

-- Kombinieren von WHERE Ausdrücken mit AND oder OR
SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'

SELECT * FROM Customers
WHERE Country = 'Germany' OR City = 'Berlin'

-- AND = "Beide Bedingungen müssen wahr sein"
-- OR = Ein Ausdruck muss wahr sein
-- Können beliebig oft kombiniert werden

SELECT * FROM Customers
WHERE (City = 'Paris' OR City = 'Berlin') AND Country = 'Germany'
-- AND "ist stärker bindenter" als OR, Notfalls Klammern setzen!

-- Randwerte mit inbegriffen
SELECT * FROM Orders
WHERE Freight >= 100 AND Freight <= 500

-- Alternativ mit Between, Randwerte inbegriffe
SELECT * FROM Orders
WHERE Freight BETWEEN 100 AND 500

SELECT * FROM Customers
WHERE Country = 'Brazil' OR Country = 'Germany' OR Country = 'France'

-- Alternativ IN (Wert1, Wert2, Wert3)
SELECT * FROM Customers
WHERE Country IN ('Brazil', 'Germany', 'France')
-- IN verbindet mehrere OR Bedingungen, aber diese beziehen sich auf die selbe SPALTE

-------------------------------------
-- Übungen:
-- 1. Alle ContactNames haben, die als Title "Owner" haben
-- Tabelle: "Customers"
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle = 'Owner'

-- 2. Alle Order Details, die die ProductID 43 haben
-- Tabelle: "[Order Details]" => Klammern weil Leerzeichen im Namen
SELECT * FROM [Order Details]
WHERE ProductID = 43

-- 3. Alle Kunden aus Paris, Berlin, Madrid und Brasilien haben
-- Tabelle: "Customers"
SELECT * FROM Customers
WHERE City IN ('Paris', 'Berlin', 'Madrid') OR Country = 'Brazil'