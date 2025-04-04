USE Demo4

/*
	Erstelle mir eine Partitionsfunktion "pf_Datum"
	- Partitionsschema: sch_Datum

	|--------------------------------|--------------------------------|
	2021						   2022								2023
*/
CREATE PARTITION FUNCTION pf_Datum(Date) AS 
RANGE LEFT FOR VALUES ('31.12.2021', '31.12.2022', '31.12.2023')


CREATE PARTITION SCHEME sch_Datum AS
PARTITION pf_Datum TO (P1_Datum, P2_Datum, P3_Datum, P4_Datum)


CREATE TABLE M003_Umsatz
(
	datum date,
	umsatz float
) on sch_Datum(datum)

INSERT INTO M003_Umsatz
SELECT * FROM M002_Umsatz

select * FROM sys.partition_schemes
select * FROM sys.dm_db_index_physical_stats(DB_ID(), 0, -1, 0, 'DETAILED')
select * FROM sys.partition_range_values

SELECT * FROM M003_Umsatz t
JOIN
(
	SELECT name, ips.partition_number
	FROM sys.filegroups fg --Name

	JOIN sys.allocation_units au
	ON fg.data_space_id = au.data_space_id

	JOIN sys.dm_db_index_physical_stats(DB_ID(), 0, -1, 0, 'DETAILED') ips
	ON ips.hobt_id = au.container_id

	WHERE OBJECT_NAME(ips.object_id) = 'M003_Umsatz'
) x
ON $partition.pf_Datum(t.datum) = x.partition_number