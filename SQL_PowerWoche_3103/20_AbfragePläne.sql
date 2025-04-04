dbcc freeproccache
USE Northwind

-- Pläne werden als Hashwert gespeichert ... blöd, wenn man mal groß und klein schreibt...

-- 1.
SELECT * FROM orders WHERE customerid = 'HANAR'

SELECT * FROM orders WHERE Customerid = 'HANAR'

SELECT * FROM Orders WHERE customerID = 'HANAR'


select usecounts, cacheobjtype,[TEXT] from
	sys.dm_exec_cached_plans p CROSS APPLY
	sys.dm_exec_sql_text(plan_handle)
	where cacheobjtype = 'Compiled PLan'
		AND [TEXT] not like '%dm_exec_cached_plans%'

SELECT * FROM Orders WHERE OrderID = 10

SELECT * FROM Orders WHERE OrderID = 300

SELECT * FROM Orders WHERE OrderID = 50000