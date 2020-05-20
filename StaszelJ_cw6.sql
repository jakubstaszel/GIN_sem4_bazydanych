ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon TYPE VARCHAR(20);
UPDATE ksiegowosc.pracownicy kp
SET
	telefon = '(+48)' || kp.telefon;

UPDATE ksiegowosc.pracownicy kp
SET
	telefon = '('||SUBSTRING(kp.telefon, 1, 3)||')'||SUBSTRING(kp.telefon, 4, 3)||'-'||SUBSTRING(kp.telefon, 7, 3)||'-'||SUBSTRING(kp.telefon, 10, 3);

SELECT id_pracownika, UPPER(kp.imie), UPPER(kp.nazwisko), UPPER(kp.adres), kp.telefon
FROM ksiegowosc.pracownicy kp 
ORDER BY LENGTH(kp.nazwisko) DESC 
LIMIT 1;

ALTER TABLE ksiegowosc.pensja ALTER COLUMN kwota TYPE VARCHAR(15);
SELECT kp.*, MD5(kpen.kwota) as md5_kwota FROM ksiegowosc.pracownicy kp 
JOIN ksiegowosc.wynagrodzenie kw ON kw.id_pracownika = kp.id_pracownika 
JOIN ksiegowosc.pensja kpen ON kw.id_pensji = kpen.id_pensji;

SELECT kp.imie,kp.nazwisko, kpen.kwota, kprem.kwota FROM ksiegowosc.wynagrodzenie kw 
LEFT JOIN ksiegowosc.pracownicy kp ON kp.id_pracownika = kw.id_pracownika
LEFT JOIN ksiegowosc.premia kprem ON kprem.id_premii = kw.id_premii
LEFT JOIN ksiegowosc.pensja kpen ON kpen.id_pensji=kw.id_pensji;

ALTER TABLE ksiegowosc.pensja ALTER COLUMN kwota TYPE FLOAT USING kwota::double precision;
SELECT CONCAT('Pracownik ',kp.imie,' ',kp.nazwisko,', w dniu ',
kw.data,' otrzymał pensję całkowitą na kwotę ',COALESCE(kprem.kwota,0)+COALESCE(kpen.kwota,0),
' zł, gdzie wynagrodzenie zasadnicze wynosiło: ',kpen.kwota,
'zł, premia: ',kprem.kwota,' zł, nadgodziny: ', COALESCE((kg.liczba_godzin-160)*10.5,0),' zł.') 
AS Informacja
FROM ksiegowosc.wynagrodzenie kw 
JOIN ksiegowosc.pensja kpen ON kw.id_pensji = kpen.id_pensji
JOIN ksiegowosc.premia kprem ON kw.id_premii = kprem.id_premii 
JOIN ksiegowosc.pracownicy kp ON kw.id_pracownika = kp.id_pracownika
JOIN ksiegowosc.godziny kg ON kw.id_pracownika = kp.id_pracownika;
