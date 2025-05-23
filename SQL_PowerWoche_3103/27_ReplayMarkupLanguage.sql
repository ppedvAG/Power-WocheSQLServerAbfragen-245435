/*
	Die Replay Markup Language (RML) f�r SQL Server ist eine Sammlung von Tools und Diensten, 
	die verwendet werden, um SQL Server-Workloads zu analysieren und �nachzuspielen�. 
	Sie erm�glicht es Administratoren, SQL Server-Abfragen und -Befehle zu erfassen, 
	erneut auszuf�hren und zu untersuchen, um Probleme mit der Abfrageleistung und dem 
	Ressourcenverbrauch zu identifizieren und zu beheben.

	Funktionen und Hauptmerkmale des RML-Dienstes:
	1. Workload-Replay: zuvor erfasste Workload erneut abzuspielen (z.b aus Profiler-Trace)

	2. Leistungsanalyse und Vergleich: RML Workloads vor und nach �nderungen 
	   (z. B Index�nderungen oder Abfrageoptimierungen) abspielen und die Leistung vergleichen

	3. Ermittlung problematischer Abfragen: Zeit und Ressourcen der Abfragen

	4. Benutzer- und Sitzungs�berwachung:
	 - Kann Abfragen einzelnen Benutzern und Sitzungen zuordnen
	 => Hilfreich um zu analysieren, wie bestimmte Benutzer oder 
	    Anwendungen die SQL Server-Instanz belasten

	5. Parallelisierung und Lasttests:
	 - Unterst�tzt das parallele Abspielen von Workloads, was sich f�r Lasttests eignen

	 Anwendungsf�lle des RML-Dienstes:
	 
	 Migrationstests:
	 - Beim verschieben der Datenbank auf eine neue Serverversion oder konfiguration, sorgt der
	   RML-Dienst das die Leistung erhalten bleibt oder verbessert wird

	Troubleshooting und Performance Tuning: 
	 - Durch erneutes Abspielen und Analysieren von Workloads lassen 
	   sich Leistungsprobleme erkennen und gezielt angehen.

	Kapazit�tsplanung und Skalierbarkeit: 
	 - Unternehmen k�nnen simulieren, wie ihre Workloads auf gr��eren Servern 
	   oder anderen Hardwarekonfigurationen laufen w�rden, 
	   um die Skalierbarkeit zu bewerten.
	https://learn.microsoft.com/de-de/troubleshoot/sql/tools/replay-markup-language-utility

*/