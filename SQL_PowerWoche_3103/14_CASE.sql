USE Northwind

-- CASE - unterscheiden wir definierte Fälle, die die Ausgabe abändern

-- Wenn ein Fall gefunden wird, dann passiert xyz, wenn nicht dann ist das Ergebnis NULL

-- Wenn die UnitsInStock kleiner sind als 10 => "Nachbestellen"
-- Wenn Die UnitsInStock größer-gleich sind als 10 => "Passt."
-- Wenn die UnitsInStock nix vom beidem sind => "Fehler!"

SELECT UnitsInStock,
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock >= 10 THEN 'Passt.'
END as Pruefung
FROM Products

-- Alternativ mit ELSE einen "Notausgang" definieren:
SELECT UnitsInStock,
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock > 10 THEN 'Passt.'
	ELSE 'Fehler!'
END as Pruefung
FROM Products

-- Funktioniert auch mit UPDATE
UPDATE Customers
SET City =
CASE	
	WHEN Country = 'Germany' THEN 'Berlin'
	WHEN Country = 'France' THEN 'Paris'
	ELSE City
END


-- GROUP BY
SELECT SUM(UnitsInStock),
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock > 10 THEN 'Passt.'
	ELSE 'Fehler!'
END as Pruefung
FROM Products
GROUP BY
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock > 10 THEN 'Passt.'
	ELSE 'Fehler!'
END