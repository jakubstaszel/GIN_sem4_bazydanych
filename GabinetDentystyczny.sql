CREATE SCHEMA GabinetDentystyczny;

CREATE TABLE GabinetDentystyczny.Pracownicy(
	IDPracownika VARCHAR(5) PRIMARY KEY,
	ImieLekarza VARCHAR(50) NOT NULL,
	NazwiskoLekarza VARCHAR(50) NOT NULL
);

INSERT INTO GabinetDentystyczny.Pracownicy VALUES ('S1011', 'Maria', 'Nowak');
INSERT INTO GabinetDentystyczny.Pracownicy VALUES ('S1024', 'Jan', 'Kowalski');
INSERT INTO GabinetDentystyczny.Pracownicy VALUES ('S1045', 'Anna', 'Jabłońska');
INSERT INTO GabinetDentystyczny.Pracownicy VALUES ('S1034', 'Marek', 'Potocki');
SELECT * FROM GabinetDentystyczny.Pracownicy;

CREATE TABLE GabinetDentystyczny.Pacjenci(
	IDPacjenta VARCHAR(4) PRIMARY KEY,
	ImiePacjenta VARCHAR(50) NOT NULL,
	NazwiskoPacjenta VARCHAR(50) NOT NULL
);

INSERT INTO GabinetDentystyczny.Pacjenci VALUES ('P100', 'Anna', 'Jeleń');
INSERT INTO GabinetDentystyczny.Pacjenci VALUES ('P105', 'Jarosław', 'Nicpoń');
INSERT INTO GabinetDentystyczny.Pacjenci VALUES ('P108', 'Joanna', 'Nosek');
INSERT INTO GabinetDentystyczny.Pacjenci VALUES ('P120', 'Jan', 'Kałuża');
INSERT INTO GabinetDentystyczny.Pacjenci VALUES ('P130', 'Jerzy', 'Lis');
INSERT INTO GabinetDentystyczny.Pacjenci VALUES ('P123', 'Olga', 'Nowacka');
SELECT * FROM GabinetDentystyczny.Pacjenci;

CREATE TABLE GabinetDentystyczny.Zabiegi(
	IDZabiegu VARCHAR(4) PRIMARY KEY,
	NazwaZabiegu VARCHAR(50) NOT NULL
);

INSERT INTO GabinetDentystyczny.Zabiegi VALUES ('Z500', 'Borowanie');
INSERT INTO GabinetDentystyczny.Zabiegi VALUES ('Z496', 'Lakowanie');
INSERT INTO GabinetDentystyczny.Zabiegi VALUES ('Z503', 'Usuwanie kamienia');
SELECT * FROM GabinetDentystyczny.Zabiegi;

CREATE TABLE GabinetDentystyczny.Wizyty(
	IDPracownika VARCHAR(5) REFERENCES GabinetDentystyczny.Pracownicy(IDPracownika),
	IDPacjenta VARCHAR(4) REFERENCES GabinetDentystyczny.Pacjenci(IDPacjenta),
	DataWizyty DATE,
	GodzinaWizyty TIME(0),
	IDZabiegu VARCHAR(4) REFERENCES GabinetDentystyczny.Zabiegi(IDZabiegu),
	CONSTRAINT Wizyta PRIMARY KEY (IDPracownika,IDPacjenta,DataWizyty,GodzinaWizyty,IDZabiegu)
);

INSERT INTO GabinetDentystyczny.Wizyty VALUES ('S1011', 'P100', '2020-03-12', '10:00:00', 'Z500');
INSERT INTO GabinetDentystyczny.Wizyty VALUES ('S1011', 'P105', '2020-03-12', '13:00:00', 'Z496');
INSERT INTO GabinetDentystyczny.Wizyty VALUES ('S1011', 'P108', '2020-03-14', '10:00:00', 'Z500');
INSERT INTO GabinetDentystyczny.Wizyty VALUES ('S1024', 'P108', '2020-03-16', '17:00:00', 'Z503');
INSERT INTO GabinetDentystyczny.Wizyty VALUES ('S1045', 'P120', '2020-03-18', '09:00:00', 'Z500');
INSERT INTO GabinetDentystyczny.Wizyty VALUES ('S1034', 'P130', '2020-03-20', '08:00:00', 'Z496');
INSERT INTO GabinetDentystyczny.Wizyty VALUES ('S1034', 'P123', '2020-03-12', '15:00:00', 'Z503');
SELECT * FROM GabinetDentystyczny.Wizyty;