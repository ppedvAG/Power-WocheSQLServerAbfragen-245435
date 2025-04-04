-- MAXDOP
-- Maximum Degree of Parallelism
-- Steuerung der Anzahl der Prozessorkerne PRO Abfrage
-- Parallelisierung passiert von alleine

SET STATISTICS TIME, IO ON

SELECT Freight, FirstName, LastName 
FROM M005_Index
WHERE Freight > (SELECT AVG(Freight) FROM M005_Index)
-- Diese Abfrage wird Parallelisiert durch die Zwei Schwarzen Pfeile in dem Gelben Kreis

SELECT Freight, FirstName, LastName 
FROM M005_Index
WHERE Freight > (SELECT AVG(Freight) FROM M005_Index)
OPTION (MAXDOP 1)
-- CPU-Zeit = 469ms, verstrichene Zeit = 1047ms

SELECT Freight, FirstName, LastName 
FROM M005_Index
WHERE Freight > (SELECT AVG(Freight) FROM M005_Index)
OPTION (MAXDOP 2)
-- CPU-Zeit = 718ms, verstrichene Zeit = 1895ms

SELECT Freight, FirstName, LastName 
FROM M005_Index
WHERE Freight > (SELECT AVG(Freight) FROM M005_Index)
OPTION (MAXDOP 4)
-- CPU-Zeit = 766ms, verstrichene Zeit = 1661ms

SELECT Freight, FirstName, LastName 
FROM M005_Index
WHERE Freight > (SELECT AVG(Freight) FROM M005_Index)
OPTION (MAXDOP 8)
-- CPU-Zeit = 1154ms, verstrichene Zeit = 1691ms
