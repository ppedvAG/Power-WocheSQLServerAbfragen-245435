USE Northwind

-- Die Customers und die Orders Tabelle in ein Ergebnisfenster ausgeben:
SELECT * FROM Customers
SELECT * FROM Orders

/*
	Inner JOIN: => befassen uns zu 99% damit
	=> Wenn du nur übereinstimmende aus beiden Tabellen brauchst

	Left Outer JOIN 
	=> Wenn du alle Daten aus der linken Tabelle brauchst + übereinstimmende

	Right Outer JOIN 
	=> Wenn du alle Daten aus der rechten Tabelle brauchst + übereinstimmende

	Full Outer Join:
	=> Wenn du alle Daten aus beiden Tabellen brauchst, egal ob sie übereinstimmen
*/

-- Lösung: Join Abfrage:

/*
	Syntax:
	SELECT * FROM Tabelle A
	JOIN Tabelle B ON A.KeySpalte = B.KeySpalte
*/

--			  Tabelle A
SELECT * FROM Customers 
--		  Tabelle B          A.KeySpalte         B.KeySpalte
INNER JOIN Orders on Customers.CustomerID = Orders.CustomerID

-- Mehrdeutiger Spaltenname
SELECT Customers.CustomerID, Orders.CustomerID FROM Customers
INNER JOIN Orders on Customers.CustomerID = Orders.CustomerID


SELECT CompanyName FROM Customers
INNER JOIN Orders on Customers.CustomerID = Orders.CustomerID

-- Aliase
SELECT * FROM Customers as CUS
INNER JOIN Orders AS O ON CUS.CustomerID = O.CustomerID 

-- JOIN zwischen: Customers - Orders - Order Details
SELECT * FROM Customers
INNER JOIN Orders on Customers.CustomerID = Orders.CustomerID
INNER JOIN [Order Details] on Orders.OrderID = [Order Details].OrderID

-- Geht auch so
SELECT * FROM Customers
INNER JOIN Orders on Orders.CustomerID = Customers.CustomerID
INNER JOIN [Order Details] on [Order Details].OrderID = Orders.OrderID
WHERE Country = 'Germany'
ORDER BY City ASC