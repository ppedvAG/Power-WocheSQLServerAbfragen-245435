/*
	Datentypen in SQL: In 3 große Gruppen

	1. Charakter/String Datentypen:
	- char(10) = 'Hallo     ' = 10 Byte Speicherplatz => UTF-8
	- nchar() = 1 Zeichen = 2 Byte Speicherplatz = 20 => UTF-16

	- varchar(10) = 'Hallo' = 5 Byte Speicherplatz => UTF-8
	- nvarchar() = 1 Zeichen = 2 Byte Speicherplatz = 10 => UTF-16

	Legacy: text --> mittlerweile VARCHAR(MAX) = bis zu 2 GB groß
	VARCHAR(8000) & nvarchar(4000) sind maximum
	Seite: 8192 Bytes, davon sind 132B Management Daten, 8060B


	2. Numerische Datentypen:
	- tinyint = 1 Byte = bis	-255 | +255
	- smallint = 2 Byte = bis	-32k | +32k
	- int = 4 Byte = bis		-2,14Mrd | +2,14Mrd
	- bigint = 8 Byte = bis		-9,2 Trl | +9,2Trl

	- bit = 1 oder 0 (True = 1, False = 0) => Es gibt kein Bool!

	- float(n) = 53
	- 1-24 = 7 Stellen = 4 Byte
	- 25-53 = 15 Stellen = 8 Byte

	- decimal(x, y) = x Ziffern insgesamt, davon sind y Nachkommastellen
	- decimal(10, 2) = 10 Ziffern insgesamt, davon sind 2 Nachkommstellen => 12345678,12

	- money = ca 9,2 Trillion
	- smallmoney = ca. 214K


	3. Datum/Zeit Datentypen:
	- time = hh:mm:ss.nnnnnnn
	- date = YYYY-MM-DD
	- datetime = date + time in MS = YYYY-MM-DD hh:mm:ss.mmm
	- datetime2 = YYYY-MM-DD hh:mm:ss.nnnnnnn
	- smalldatetime = präzise bis Sekunden = YYYY-MM-DD hh:mm:ss

	Andere:
	- XML
	- JSON
	- geometry
	- geography

*/