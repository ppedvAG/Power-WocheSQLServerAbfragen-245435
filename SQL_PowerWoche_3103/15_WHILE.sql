USE Northwind

-- Variablen allgemein

-- Beides zusammen ausführen, damit der Speicher beides kennt
DECLARE @OrderID INT = 10250 

SELECT * FROM Orders
WHERE OrderID = @OrderID

SET @OrderID = 10251

SELECT * FROM Orders
WHERE OrderID = @OrderID


-- WHILE - Schleifenanweisung

DECLARE @Counter INT = 0

WHILE @Counter <= 5
BEGIN
SELECT 'Hallo'
SET @Counter += 1
END

-- Endlossschleife, aufpassen auf deinen Computer
WHILE 5=5
BEGIN
SELECT 'Hallo'
END

-- Zusatz: IF Prüfung innerhalb der WHILE

DECLARE @CounterTwo INT = 0

WHILE @CounterTwo <= 5
BEGIN

IF @CounterTwo = 2 
	BEGIN
		SELECT 'Bin bei Zwei'
	END
ELSE
	BEGIN
		SELECT @CounterTwo END
SET @CounterTwo += 1
END
