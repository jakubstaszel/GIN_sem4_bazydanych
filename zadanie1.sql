
CREATE TABLE pracownicy(
	id_pracownika INT PRIMARY KEY,
	imie VARCHAR(50) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	adres VARCHAR(100),
	telefon VARCHAR(12)
);

CREATE TABLE godziny(
	id_godziny INT PRIMARY KEY,
	data DATE,
	liczba_godzin INT NOT NULL,
	id_pracownika INT NOT NULL
);

CREATE TABLE pensje(
	id_pensji INT PRIMARY KEY,
	stanowisko VARCHAR(50),
	kwota FLOAT NOT NULL,
	id_premii INT
);

CREATE TABLE premie(
	id_premii INT PRIMARY KEY,
	rodzaj VARCHAR(50),
	kwota FLOAT NOT NULL
);

ALTER TABLE godziny 
ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);

ALTER TABLE pensje
ADD FOREIGN KEY (id_premii) REFERENCES premie(id_premii);

INSERT INTO pracownicy VALUES (1, 'Jakub', 'Staszel', 'Krakow', '+48731480317');
INSERT INTO pracownicy VALUES (2, 'Julianna', 'Zryk', 'Wroclaw', '+48321567876');
INSERT INTO pracownicy VALUES (3, 'Konrad', 'Pawlowski', 'Male Ciche', '+48987098235');
INSERT INTO pracownicy VALUES (4, 'Marta', 'Lasak', 'Poronin', '+48456009132');
INSERT INTO pracownicy VALUES (5, 'Aleksandra', 'Fafrowicz', 'Ostrow Wielkopolski', '+48890675436');
INSERT INTO pracownicy VALUES (6, 'Franciszek', 'Zeglen', 'Krakow', '+48876456231');
INSERT INTO pracownicy VALUES (7, 'Aleksander', 'Oliwek', 'Gdansk', '+48987630154');
INSERT INTO pracownicy VALUES (8, 'Wioletta', 'Orlik', 'Olsztyn', '+48946187632');
INSERT INTO pracownicy VALUES (9, 'Karol', 'Wierzbanowski', 'Stalowa Wola', '+48759265020');
INSERT INTO pracownicy VALUES (10, 'Krzysztof', 'Zryk', 'Krakow', '+48895329704');
SELECT * FROM pracownicy;

INSERT INTO godziny VALUES (1, '2020-03-31', 8, 10);
INSERT INTO godziny VALUES (2, '2020-03-31', 6, 9);
INSERT INTO godziny VALUES (3, '2020-03-31', 8, 1);
INSERT INTO godziny VALUES (4, '2020-03-31', 8, 7);
INSERT INTO godziny VALUES (5, '2020-03-31', 7, 2);
INSERT INTO godziny VALUES (6, '2020-03-31', 8, 5);
INSERT INTO godziny VALUES (7, '2020-03-31', 6, 3);
INSERT INTO godziny VALUES (8, '2020-03-31', 8, 8);
INSERT INTO godziny VALUES (9, '2020-03-31', 7, 2);
INSERT INTO godziny VALUES (10, '2020-03-31', 8, 4);
SELECT * FROM godziny;

INSERT INTO premie VALUES (1, 'swiateczna', 120.30);
INSERT INTO premie VALUES (2, 'na dziecko', 10.80);
INSERT INTO premie VALUES (3, 'zapomoga', 200.00);
INSERT INTO premie VALUES (4, 'innowacje', 542.36);
INSERT INTO premie VALUES (5, 'teamplayer', 400.25);
INSERT INTO premie VALUES (6, 'pomoc', 158.00);
INSERT INTO premie VALUES (7, 'zmiana dzialu', 98.35);
INSERT INTO premie VALUES (8, 'staz', 685.00);
INSERT INTO premie VALUES (9, 'wyjazd', 109.98);
INSERT INTO premie VALUES (10, 'zywnosc', 104.99);
SELECT * FROM premie

INSERT INTO pensje VALUES (1, 'doradca finansowy', 3200.00, 1);
INSERT INTO pensje VALUES (2, 'ksiegowy', 3900.00);
INSERT INTO pensje VALUES (3, 'zarzad', 6200.00, 7);
INSERT INTO pensje VALUES (4, 'kierownik', 8450.50, 9);
INSERT INTO pensje VALUES (5, 'inzynier', 5900.89, 2);
INSERT INTO pensje VALUES (6, 'projektant', 5267.00, 10);
INSERT INTO pensje VALUES (7, 'hr', 4570.40, 1);
INSERT INTO pensje VALUES (8, 'dzial rozwoju', 8201.10, 6);
INSERT INTO pensje VALUES (9, 'przedstawiciel handlowy', 5230.70, 8);
INSERT INTO pensje VALUES (10, 'rekruter', 4780.00);
SELECT * FROM pensje