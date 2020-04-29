CREATE SCHEMA Sklep;

CREATE TABLE Sklep.Produkty(
	NazwaProduktu VARCHAR(50) PRIMARY KEY,
	CenaNetto FLOAT NOT NULL,
	VAT FLOAT NOT NULL
);

INSERT INTO Sklep.Produkty VALUES ('Makaron Nitki', 130.00, 0.05);
INSERT INTO Sklep.Produkty VALUES ('Keczup Pikantny', 200.00, 0.08);
INSERT INTO Sklep.Produkty VALUES ('Sos Pomidorowy', 89.00, 0.23);
SELECT * FROM Sklep.Produkty;

CREATE TABLE Sklep.Ceny(
	CenaNetto FLOAT NOT NULL,
	VAT FLOAT NOT NULL,
	CenaBrutto FLOAT NOT NULL,
	CONSTRAINT CenaVAT PRIMARY KEY (CenaNetto,VAT) 
);

INSERT INTO Sklep.Ceny VALUES (130.00, 0.05, 136.5);
INSERT INTO Sklep.Ceny VALUES (200.00, 0.08, 216.00);
INSERT INTO Sklep.Ceny VALUES (89.00, 0.23, 109.47);
SELECT * FROM Sklep.Ceny;

CREATE TABLE Sklep.Miasta(
	Poczta VARCHAR(6) PRIMARY KEY,
	Miasto VARCHAR(50) NOT NULL
);

INSERT INTO Sklep.Miasta VALUES ('31-435', 'Kraków');
INSERT INTO Sklep.Miasta VALUES ('04-242', 'Lublin');
INSERT INTO Sklep.Miasta VALUES ('31-342', 'Kraków');
INSERT INTO Sklep.Miasta VALUES ('30-243', 'Tarnów');
INSERT INTO Sklep.Miasta VALUES ('35-434', 'Nowy Targ');
SELECT * FROM Sklep.Miasta;

CREATE TABLE Sklep.Dostawcy(
	NazwaDostawcy VARCHAR(50) PRIMARY KEY,
	UlicaDostawcy VARCHAR(20) NOT NULL,
	NrDostawcy VARCHAR(10) NOT NULL,
	PocztaDostawcy VARCHAR(6) REFERENCES Sklep.Miasta(Poczta) 
);

INSERT INTO Sklep.Dostawcy VALUES ('Makarony Polskie', 'Turystyczna', '40', '31-435');
INSERT INTO Sklep.Dostawcy VALUES ('Lubelski Makaron', 'Piłsudskiego', '332a', '04-242');
INSERT INTO Sklep.Dostawcy VALUES ('Polskie Przetwory', 'Wojska Polskiego', '44a', '31-342');
INSERT INTO Sklep.Dostawcy VALUES ('Przetwory Pomidorowe', 'Rolnicza', '22/4', '30-243');
INSERT INTO Sklep.Dostawcy VALUES ('Małopolskie smaki', 'Mickiewicza', '223/7', '35-434');
SELECT * FROM Sklep.Dostawcy;

CREATE TABLE Sklep.Zamowienia(
	NazwaDostawcy VARCHAR(50) REFERENCES Sklep.Dostawcy(NazwaDostawcy),
	NazwaProduktu VARCHAR(50) REFERENCES Sklep.Produkty(NazwaProduktu)
);

INSERT INTO Sklep.Zamowienia VALUES ('Makarony Polskie', 'Makaron Nitki');
INSERT INTO Sklep.Zamowienia VALUES ('Lubelski Makaron', 'Makaron Nitki');
INSERT INTO Sklep.Zamowienia VALUES ('Polskie Przetwory', 'Keczup Pikantny');
INSERT INTO Sklep.Zamowienia VALUES ('Przetwory Pomidorowe', 'Keczup Pikantny');
INSERT INTO Sklep.Zamowienia VALUES ('Polskie Przetwory', 'Sos Pomidorowy');
INSERT INTO Sklep.Zamowienia VALUES ('Małopolskie smaki', 'Sos Pomidorowy');
SELECT * FROM Sklep.Zamowienia