-- 1. Haben wir Produkteinheiten im Lager (UnitsInStock), die aber nicht
-- mehr verkauft werden (Discontinued)? Wenn ja, wieviel "Geld" liegt dort im Lager?
-- Rechnung: UnitsInStock * UnitPrice
SELECT ProductName, UnitsInStock * UnitPrice as Wert FROM Products
WHERE Discontinued = 1 AND UnitsInStock != 0
ORDER BY Wert

-- 2. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce"
-- (CategoryName in Categories)
--> Products - Categories Tables
SELECT * FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName IN ('Beverages', 'Produce')

-- 3. Alle Bestellungen (Orders) bei denen ein Produkt verkauft wurde, das nicht mehr gefuehrt wird
-- (Discontinued = 1 in Products)
--> Orders - Order Details - Products
SELECT * FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE Discontinued = 1 AND ShippedDate IS NOT NULL