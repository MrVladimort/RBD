DROP TABLE WIZYTY;
DROP TABLE PACJENT;
DROP TABLE LEKARZ;

CREATE TABLE PACJENT(
  IdPacjenta INTEGER NOT NULL,
  Imie VARCHAR(20),
  Nazwisko VARCHAR(30),
  Data_Ur Date,
  CONSTRAINT IdPacjenta_PK PRIMARY KEY (IdPacjenta)
);

CREATE TABLE LEKARZ(
  idLekarza INTEGER NOT NULL,
  Imie VARCHAR(20),
  Nazwisko VARCHAR(30),
  Pensja INTEGER,
  Specjalizacja VARCHAR(30),
  CONSTRAINT IdLekarza_PK PRIMARY KEY (idLekarza)
);

CREATE TABLE WIZYTY (
  IdPacjenta INTEGER NOT NULL,
  IdLekarza INTEGER NOT NULL,
  Data Date NOT NULL,
  Opis VARCHAR(40),
  CENA INTEGER,
  CONSTRAINT Wizyty_PK PRIMARY KEY (IdPacjenta, IdLekarza, Data),
  CONSTRAINT Wizyty_Lekarz_FK FOREIGN KEY (IdLekarza) REFERENCES LEKARZ(idLekarza),
  CONSTRAINT Wizyty_Pacjent_FK FOREIGN KEY (IdPacjenta) REFERENCES PACJENT(IdPacjenta)
);

SELECT * FROM Pacjent;
SELECT * FROM Lekarz;
SELECT * FROM Wizyty;

---1---
SELECT SUM(cena), p.Imie, p.Nazwisko FROM Wizyty w
INNER JOIN Pacjent p ON w.IDPACJENTA = p.IDPACJENTA 
INNER JOIN Lekarz l ON w.IDLEKARZA = l.IDLEKARZA 
      WHERE l.SPECJALIZACJA = 'Internista'
GROUP BY p.Imie, p.Nazwisko;
---2---
SELECT l.IMIE, l.NAZWISKO, MAX(w.CENA) FROM Wizyty w 
INNER JOIN Lekarz l ON w.IdLekarza = l.IdLekarza WHERE l.IdLekarza IN 
      (SELECT IdLekarza FROM Wizyty WHERE Count(IdPacjenta)>2 GROUP BY IdLekarza) 
GROUP BY l.IMIE, l.NAZWISKO;
---3---
SELECT l.IMIE, l.NAZWISKO FROM Wizyty w 
INNER JOIN Lekarz l ON w.IDLEKARZA = l.IDLEKARZA
WHERE w.IDPACJENTA = 
      (SELECT p.IDPACJENTA FROM Pacjent p 
      WHERE p.IMIE = 'Jan' AND p.NAZWISKO = 'Kowalski');
---4---
SELECT p.imie, p.nazwisko, MIN(w.data) 
FROM wizyty w
INNER JOIN Pacjent p ON p.idpacjenta = w.idpacjenta 
GROUP BY p.imie, p.nazwisko;
---5---
UPDATE Wizyty SET cena = 50
WHERE data = Sysdate AND IDPACJENTA = 10 AND 
IDLEKARZA IN (SELECT IDLEKARZA FROM LEKARZ WHERE NAZWISKO = 'Kowalski');
---6---
DELETE FROM Pacjent 
WHERE idPacjent NOT IN (SELECT w.IdPacjenta FROM wizyty w);
---7---
SELECT IMIE || ' ' || Nazwisko AS Lekarz FROM Lekarz
WHERE Pensja < 3000 AND SPECJALIZACJA LIKE 'Z%'
ORDER BY SPECJALIZACJA DESC, Nazwisko ASC;
---8---
SELECT p.IMIE, p.NAZWISKO, l.IMIE, l.NAZWISKO
FROM Wizyty w
INNER JOIN Lekarz l ON w.IDLEKARZA = l.IDLEKARZA
INNER JOIN Pacjent p ON w.IDPACJENTA = p.IDPACJENTA
WHERE w.IDLEKARZA IN (SELECT lk.IDLEKARZA FROM Lekarz lk WHERE lk.SPECJALIZACJA = 'Okulista')
AND EXTRACT(Month FROM w.DATA) = EXTRACT(Month FROM Sysdate);
---9---
SELECT p.IMIE, p.NAZWISKO, p.data_ur, sum(w.cena)
FROM WIzyty w INNER JOIN pacjent p ON w.IDPACJENTA = p.IDPACJENTA
WHERE p.IMIE = 'Jan' AND p.NAZWISKO = 'Kowalski' 
AND EXTRACT(year from w.data)=2008
GROUP BY p.IMIE, p.NAZWISKO, p.data_ur;
---10---
SELECT l.SPECJALIZACJA, AVG(w.cena), COUNT(w.IDLEKARZA)
FROM Wizyty w 
INNER JOIN Lekarz l ON w.IDLEKARZA = l.IDLEKARZA
WHERE w.IDLEKARZA NOT IN (SELECT lk.IDLEKARZA FROM Lekarz lk 
                          WHERE lk.SPECJALIZACJA = 'Dentysta')
AND COUNT(w.IDLEKARZA)>9
GROUP BY l.SPECJALIZACJA;