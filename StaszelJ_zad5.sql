
CREATE DATABASE firma;
CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy(
	id_pracownika INT PRIMARY KEY,
	imie VARCHAR(50) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	adres VARCHAR(100),
	telefon VARCHAR(12)
);
COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela z danymi pracowników.';
INSERT INTO ksiegowosc.pracownicy VALUES (1, 'Jakub', 'Staszel', 'Krakow', '+48731480317');
INSERT INTO ksiegowosc.pracownicy VALUES (2, 'Julianna', 'Zryk', 'Wroclaw', '+48321567876');
INSERT INTO ksiegowosc.pracownicy VALUES (3, 'Konrad', 'Pawlowski', 'Male Ciche', '+48987098235');
INSERT INTO ksiegowosc.pracownicy VALUES (4, 'Marta', 'Lasak', 'Poronin', '+48456009132');
INSERT INTO ksiegowosc.pracownicy VALUES (5, 'Aleksandra', 'Fafrowicz', 'Ostrow Wielkopolski', '+48890675436');
INSERT INTO ksiegowosc.pracownicy VALUES (6, 'Franciszek', 'Zeglen', 'Krakow', '+48876456231');
INSERT INTO ksiegowosc.pracownicy VALUES (7, 'Aleksander', 'Oliwek', 'Gdansk', '+48987630154');
INSERT INTO ksiegowosc.pracownicy VALUES (8, 'Wioletta', 'Orlik', 'Olsztyn', '+48946187632');
INSERT INTO ksiegowosc.pracownicy VALUES (9, 'Karol', 'Wierzbanowski', 'Stalowa Wola', '+48759265020');
INSERT INTO ksiegowosc.pracownicy VALUES (10, 'Krzysztof', 'Zryk', 'Krakow', '+48895329704');
SELECT * FROM ksiegowosc.pracownicy;

CREATE TABLE ksiegowosc.godziny(
	id_godziny INT PRIMARY KEY,
	data DATE,
	liczba_godzin INT NOT NULL,
	id_pracownika INT NOT NULL REFERENCES ksiegowosc.pracownicy(id_pracownika)
);
COMMENT ON TABLE ksiegowosc.godziny IS 'Tabela z godzinami przepracowanymi w danym miesiącu przez danego pracownika.';
INSERT INTO ksiegowosc.godziny VALUES (1, '2020-03-31', 80, 10);
INSERT INTO ksiegowosc.godziny VALUES (2, '2020-03-31', 600, 9);
INSERT INTO ksiegowosc.godziny VALUES (3, '2020-03-31', 123, 1);
INSERT INTO ksiegowosc.godziny VALUES (4, '2020-03-31', 98, 7);
INSERT INTO ksiegowosc.godziny VALUES (5, '2020-03-31', 162, 2);
INSERT INTO ksiegowosc.godziny VALUES (6, '2020-03-31', 192, 5);
INSERT INTO ksiegowosc.godziny VALUES (7, '2020-03-31', 240, 3);
INSERT INTO ksiegowosc.godziny VALUES (8, '2020-03-31', 123, 8);
INSERT INTO ksiegowosc.godziny VALUES (9, '2020-03-31', 243, 2);
INSERT INTO ksiegowosc.godziny VALUES (10, '2020-03-31', 106, 4);
SELECT * FROM ksiegowosc.godziny;

CREATE TABLE ksiegowosc.pensja(
	id_pensji INT PRIMARY KEY,
	stanowisko VARCHAR(50),
	kwota FLOAT NOT NULL
);
COMMENT ON TABLE ksiegowosc.pensja IS 'Tabela z pensjami miesięcznymi dla danego stanowiska.';
INSERT INTO ksiegowosc.pensja VALUES (1, 'doradca finansowy', 2200.00);
INSERT INTO ksiegowosc.pensja VALUES (2, 'ksiegowy', 2745.50);
INSERT INTO ksiegowosc.pensja VALUES (3, 'zarzad', 4276.20);
INSERT INTO ksiegowosc.pensja VALUES (4, 'kierownik', 3223.25);
INSERT INTO ksiegowosc.pensja VALUES (5, 'inzynier', 2656.89);
INSERT INTO ksiegowosc.pensja VALUES (6, 'projektant', 2308.00);
INSERT INTO ksiegowosc.pensja VALUES (7, 'hr', 2143.40);
INSERT INTO ksiegowosc.pensja VALUES (8, 'dzial rozwoju', 1145.10);
INSERT INTO ksiegowosc.pensja VALUES (9, 'przedstawiciel handlowy', 3012.70);
INSERT INTO ksiegowosc.pensja VALUES (10, 'rekruter', 2434.00);
SELECT * FROM ksiegowosc.pensja;

CREATE TABLE ksiegowosc.premia(
	id_premii INT PRIMARY KEY,
	rodzaj VARCHAR(50),
	kwota FLOAT NOT NULL
);
COMMENT ON TABLE ksiegowosc.premia IS 'Rodzaje premii i wartość.';
INSERT INTO ksiegowosc.premia VALUES (1, 'swiateczna', 120.30);
INSERT INTO ksiegowosc.premia VALUES (2, 'na dziecko', 10.80);
INSERT INTO ksiegowosc.premia VALUES (3, 'zapomoga', 200.00);
INSERT INTO ksiegowosc.premia VALUES (4, 'innowacje', 542.36);
INSERT INTO ksiegowosc.premia VALUES (5, 'teamplayer', 400.25);
INSERT INTO ksiegowosc.premia VALUES (6, 'pomoc', 158.00);
INSERT INTO ksiegowosc.premia VALUES (7, 'zmiana dzialu', 98.35);
INSERT INTO ksiegowosc.premia VALUES (8, 'staz', 685.00);
INSERT INTO ksiegowosc.premia VALUES (9, 'wyjazd', 109.98);
INSERT INTO ksiegowosc.premia VALUES (10, 'zywnosc', 104.99);
SELECT * FROM ksiegowosc.premia;

CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia INT PRIMARY KEY,
	data DATE,
	id_pracownika INT NOT NULL REFERENCES ksiegowosc.pracownicy(id_pracownika),
	id_godziny INT NOT NULL REFERENCES ksiegowosc.godziny(id_godziny),
	id_pensji INT NOT NULL REFERENCES ksiegowosc.pensja(id_pensji),
	id_premii INT REFERENCES ksiegowosc.premia(id_premii)
);
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Tabela do obliczania wynagrodzeń pracowników.';
INSERT INTO ksiegowosc.wynagrodzenie VALUES (1, '2020-03-31', 1, 2, 3, 4);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (2, '2020-03-31', 2, 3, 8, 1);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (3, '2020-03-31', 3, 3, 5, 5);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (4, '2020-03-31', 4, 6, 3, 8);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (5, '2020-03-31', 5, 2, 2, 5);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (6, '2020-03-31', 6, 5, 2, 1);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (7, '2020-03-31', 7, 3, 5, 6);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (8, '2020-03-31', 8, 8, 9, 9);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (9, '2020-03-31', 9, 2, 3, 7);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (10, '2020-03-31', 10, 4, 9, 6);
SELECT * FROM ksiegowosc.wynagrodzenie;

SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;
SELECT kw.id_pracownika FROM ksiegowosc.wynagrodzenie kw, ksiegowosc.pensja kpen, ksiegowosc.premia kprem 
	WHERE kw.id_pensji = kpen.id_pensji AND kw.id_premii = kprem.id_premii AND kprem.kwota + kpen.kwota > 1000;
SELECT kw.id_pracownika FROM ksiegowosc.wynagrodzenie kw, ksiegowosc.pensja kpen 
	WHERE kw.id_pensji = kpen.id_pensji AND kw.id_premii IS NULL AND kpen.kwota > 1000;
SELECT * FROM ksiegowosc.pracownicy WHERE imie LIKE 'J%';
SELECT * FROM ksiegowosc.pracownicy WHERE (imie LIKE '%a') AND (nazwisko LIKE '%n%');
SELECT kprac.imie, kprac.nazwisko
	FROM ksiegowosc.pracownicy kprac, ksiegowosc.godziny kg
	WHERE kprac.id_pracownika = kg.id_pracownika AND kg.liczba_godzin > 160;
SELECT kprac.imie, kprac.nazwisko
	FROM ksiegowosc.wynagrodzenie kw, ksiegowosc.pracownicy kprac, ksiegowosc.pensja kpen
	WHERE kw.id_pracownika = kprac.id_pracownika AND kw.id_pensji = kpen.id_pensji AND kpen.kwota > 1500 AND kpen.kwota < 3000;
SELECT kprac.imie, kprac.nazwisko
	FROM ksiegowosc.pracownicy kprac, ksiegowosc.godziny kg, ksiegowosc.wynagrodzenie kw
	WHERE kw.id_godziny = kg.id_godziny AND kw.id_pracownika = kprac.id_pracownika AND kg.liczba_godzin > 160 AND kw.id_premii IS NULL;
SELECT kprac.imie, kprac.nazwisko, kpen.kwota 
	FROM ksiegowosc.pensja kpen, ksiegowosc.wynagrodzenie kw, ksiegowosc.pracownicy kprac 
	WHERE kpen.id_pensji = kw.id_pensji AND kw.id_pracownika = kprac.id_pracownika
	ORDER BY kpen.kwota
SELECT kprac.imie, kprac.nazwisko, kpen.kwota, kprem.kwota
	FROM ksiegowosc.pensja kpen, ksiegowosc.wynagrodzenie kw, ksiegowosc.pracownicy kprac, ksiegowosc.premia kprem 
	WHERE kpen.id_pensji = kw.id_pensji AND kw.id_pracownika = kprac.id_pracownika AND kprem.id_premii = kw.id_premii
	ORDER BY kpen.kwota DESC, kprem.kwota DESC
SELECT COUNT(*),  kpen.stanowisko 
	FROM ksiegowosc.pensja kpen
	GROUP BY kpen.stanowisko;
SELECT MIN(kpen.kwota) AS MinPensja,MAX(kpen.kwota) AS MaxPensja, AVG(kpen.kwota) AS SredniaPensja 
	FROM ksiegowosc.pensja kpen
	WHERE kpen.stanowisko = 'kierownik';
SELECT SUM(kpr.kwota)+SUM(kpen.kwota) AS Wynagrodzenie 
	FROM ksiegowosc.wynagrodzenie kw 
	LEFT JOIN ksiegowosc.pensja kpen ON kw.id_pensji = kpen.id_pensji
	LEFT JOIN ksiegowosc.premia kpr ON kw.id_premii = kpr.id_premii;
SELECT SUM(COALESCE(kpr.kwota,0))+ SUM(COALESCE(kpen.kwota,0)) as Wynagrodzenie, kpen.stanowisko 
	FROM ksiegowosc.wynagrodzenie kw 
	LEFT JOIN ksiegowosc.pensja kpen ON kw.id_pensji = kpen.id_pensji
	LEFT JOIN ksiegowosc.premia kpr ON kw.id_premii = kpr.id_premii 
	GROUP BY kpen.stanowisko;
SELECT COUNT(kw.id_premii) AS IloscPremii, kpen.stanowisko 
	FROM ksiegowosc.wynagrodzenie kw
	JOIN ksiegowosc.pensja kpen ON kw.id_pensji=kpen.id_pensji
	GROUP BY kpen.stanowisko
DELETE FROM ksiegowosc.pracownicy 
	WHERE id_pracownika IN (SELECT id_pracownika FROM ksiegowosc.wynagrodzenie 
		WHERE id_pensji IN (SELECT id_pensji FROM ksiegowosc.pensja WHERE kwota < 1200))
