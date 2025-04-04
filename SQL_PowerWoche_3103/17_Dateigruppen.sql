/*
	Dateigruppen:
	Datenbank aufteilen auf mehrere Dateien, und verschiedene Datenträger in weiterer Folge
	[Primary]: Hauptgruppe, existiert immer, enthält standardmäßig alle Files

	Das Hauptfile hat die Endung .mdf
	Weitere Files haben die Endung .ndf
	Log Files haben die Endung .ldf
*/

Use Demo4

/*
	Rechtsklick auf die DB -> Eigenschaften
	Dateigruppen
		- Hinzufügen, Name vergeben
	Dateien
		- Hinzufügen, Name, Dateigruppe, Pfad
*/

-- Wie verschiebe ich eine Tabelle auf eine Dateigruppe?
CREATE TABLE M002_FG
(
	id int identity,
	test char(4100)
)

INSERT INTO M002_FG
VALUES('XYZ')
GO 20000

-- Neue Tabelle erstellen, Daten verschieben, Alte Tabelle löschen
CREATE TABLE M002_FG_2
(
	id int identity,
	test char(4100)
) ON [NeueDateigruppe]

INSERT INTO M002_FG_2
SELECT * FROM M002_FG

-- Identity entfernen per Designer
-- Extras => Options => Designer => Speichern von Änderungen verhindern, die die Neuerstellung der Tabelle erfordern

SELECT * FROM M002_FG_2

-- Salamitaktik
-- Große Tabellen in kleinere Tabellen aufzuteilen
-- Mit Partionierter Sicht

CREATE TABLE M002_Umsatz
(
	datum date,
	umsatz float
)

BEGIN TRAN
DECLARE @i int = 0
WHILE @i < 100000
BEGIN
	INSERT INTO M002_Umsatz 
	VALUES (DATEADD(DAY, FLOOR(RAND()*1095), '01.01.2021'), RAND()*1000)
	SET @i += 1
END 
COMMIT

SELECT * FROM M002_Umsatz
ORDER BY datum DESC

SELECT * FROM M002_Umsatz
WHERE YEAR(datum) = 2021

-- Umsatz 2021
CREATE TABLE M002_Umsatz2021
(
	datum date,
	umsatz float
)

INSERT INTO M002_Umsatz2021
SELECT * FROM M002_Umsatz
WHERE YEAR(datum) = 2021

----------------------------------------------

-- Umsatz 2022
CREATE TABLE M002_Umsatz2022
(
	datum date,
	umsatz float
)

INSERT INTO M002_Umsatz2022
SELECT * FROM M002_Umsatz
WHERE YEAR(datum) = 2022

----------------------------------------------

-- Umsatz 2023
CREATE TABLE M002_Umsatz2023
(
	datum date,
	umsatz float
)

INSERT INTO M002_Umsatz2023
SELECT * FROM M002_Umsatz
WHERE YEAR(datum) = 2023

SELECT * FROM M002_Umsatz2021
SELECT * FROM M002_Umsatz2022
SELECT * FROM M002_Umsatz2023
GO

CREATE VIEW UmsatzGesamt
AS
SELECT * FROM M002_Umsatz2021
UNION ALL
SELECT * FROM M002_Umsatz2022
UNION ALL
SELECT * FROM M002_Umsatz2023

SELECT * FROM UmsatzGesamt


SELECT * FROM UmsatzGesamt
WHERE YEAR(datum) = 2021
-- Operatorkosten = 0,36%

SELECT * FROM M002_Umsatz
WHERE YEAR(datum) = 2021
-- Operatorkosten 0,31%