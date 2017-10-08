--(2pkt) 2 polecenia SELECT ze zlaczeniem tabel oraz z warunkiem WHERE==================================================
SELECT w.IdWiedzmin, w.Imie Wiedzmin, z.IdZlecenie, z.Nazwa Zlecenie
FROM Wiedzminy w, Zlecenie z
WHERE w.IdWiedzmin = z.PierwszyWiedzmin;

SELECT p.IdPotwor, p.Nazwa, r.IdRodzaj, r.Nazwa Rodzaj
FROM  Potwor p
INNER JOIN Rodzaj r ON p.IdRodzaj = r.IdRodzaj
ORDER BY r.IdRodzaj;
--(2pkt) 2 polecenia SELECT z funkcjami grupujacymi=====================================================================
SELECT r.IdRodzaj, r.Nazwa "Rodzaj", Count(*) "Potworow w Rodzaju" FROM Rodzaj r
INNER JOIN Potwor p ON r.IdRodzaj = p.IdRodzaj
GROUP BY r.IdRodzaj, r.Nazwa
ORDER BY IdRodzaj;

SELECT Szkola, Count(Szkola) Wiedzminow
FROM Wiedzminy
GROUP BY Szkola
ORDER BY Wiedzminow;
--(2pkt) 1 polecenie SELECT z klauzula HAVING===========================================================================
SELECT r.IdRodzaj, r.Nazwa "Rodzaj", Count(*) "Potworow w Rodzaju" FROM Rodzaj r
INNER JOIN Potwor p ON r.IdRodzaj = p.IdRodzaj
HAVING Count(*) > 1
GROUP BY r.IdRodzaj, r.Nazwa
ORDER BY IdRodzaj;

SELECT zzd.IdZlecenieDawca, zd.Imie, zd.Nazwisko, Count(IdZlecenie) "Liczba zlecen" FROM ZleceniaZlecenieDawcy zzd
INNER JOIN ZlecenieDawca zd ON zzd.IdZlecenieDawca = zd.IdZlecenieDawca
HAVING COUNT(IdZlecenie) > 1
GROUP BY zzd.IdZlecenieDawca, Imie, Nazwisko
ORDER BY IdZlecenieDawca;
--(1pkt) 1 polecenie UPDATE z warunkiem WHERE===========================================================================
SELECT * FROM Zlecenie;
UPDATE Zlecenie SET Zlecenie.Oplata = 200 WHERE Oplata < 200;
--(1pkt) 1 polecenie DELETE z warunkiem WHERE===========================================================================
SELECT * FROM ZlecenieDawca;
SELECT * FROM ZleceniaZlecenieDawcy;

DELETE FROM ZlecenieDawca WHERE IdZlecenieDawca NOT IN
                         (SELECT DISTINCT IdZlecenieDawca FROM ZleceniaZlecenieDawcy);
--(2pkt) 1 polecenie SELECT z podzapytaniem skorelowanym================================================================
SELECT * FROM Zlecenie;

SELECT z.IdZlecenie, z.Nazwa, z.Oplata, w.IdWiedzmin, w.Imie FROM Zlecenie z
INNER JOIN Wiedzminy w ON z.PierwszyWiedzmin = w.IdWiedzmin
WHERE z.Oplata = (SELECT MIN(z2.Oplata) FROM Zlecenie z2 WHERE z2.PierwszyWiedzmin = z.PierwszyWiedzmin)
ORDER BY Oplata;
--======================================================================================================================