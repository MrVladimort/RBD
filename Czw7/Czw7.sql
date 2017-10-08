SELECT * FROM OSOBA;
SELECT * FROM ZWIAZEK_MALZENSKI;
SELECT * FROM MIEJSCOWOSC;

--1.  Znajdz osoby bedace korzeniami drzewa genealogicznego. 
SELECT * FROM OSOBA WHERE matka is null and ojciec is null;
--2.  Znajdz osobe o peselu 12345678908.
SELECT * FROM OSOBA WHERE pesel = '12345678908';
--2.  Wyswietl zwiazki malzenskie, kt�re w zeszlym roku zakonczyly sie zgonem. 
SELECT * FROM ZWIAZEK_MALZENSKI WHERE extract (year from DATA_WYGASNIECIA_ZWIAZKU)<2016 and  POWOD_WYGASNIECIA_ZWIAZKU = 'Zgon';
--3.  Znajdz osoby, kt�re urodzily sie w Warszawie.
select * from OSOBA o join MIEJSCOWOSC m 
on o.MIEJSCE_URODZENIA = m.ID_MIEJSCOWOSCI
where m.NAZWA = 'Warszawa';
--4.	Wypisz pesele rodzic�w osoby o peselu 12345678908.
SELECT MATKA, OJCIEC FROM OSOBA where PESEL = '12345678908';
--5.	Wypisz imiona i nazwiska rodzic�w osoby o peselu 12345678908.
SELECT m.IMIE, m.NAZWISKO, t.IMIE, t.NAZWISKO FROM OSOBA o 
join OSOBA m on o.MATKA = m.PESEL 
join OSOBA t on o.OJCIEC = t.PESEL 
where o.PESEL = '12345678908';
--6 	Wypisz imiona i nazwiska rodzenstwa osoby o peselu 12345678908.
SELECT r.IMIE, r.NAZWISKO FROM OSOBA o 
join OSOBA r on o.MATKA = r.MATKA
where o.PESEL = '12345678908';
--7.	Wypisz dane o malzenstwach zawartych w miejscu urodzenia przynajmniej jednej ze stron.
SELECT zm.* FROM ZWIAZEK_MALZENSKI zm 
join OSOBA m on zm.MAZ = m.PESEL 
join OSOBA z on zm.ZONA = z.PESEL
where m.MIEJSCE_URODZENIA = zm.ID_MIEJSCOWOSCI or z.MIEJSCE_URODZENIA = zm.ID_MIEJSCOWOSCI;
--8.	Wypisz imiona i nazwiska wnuk�w pani Wandy Zielonog�rskiej.
SELECT o.* FROM OSOBA o 
join OSOBA m on o.MATKA = m.PESEL
join OSOBA b on m.MATKA = b.PESEL
where b.IMIE = 'Wanda' and b.NAZWISKO = 'Zielonogorska';
--9.	Wypisz r�znice wieku miedzy malzonkami.
SELECT abs(extract(year from m.DATA_URODZENIA) - extract(year from z.DATA_URODZENIA)) "roznica" FROM ZWIAZEK_MALZENSKI zm
join OSOBA m on zm.MAZ = m.PESEL
join OSOBA z on zm.ZONA = z.PESEL;
--10.	Wypisz wiek najmlodszej i najstarszej matki.
SELECT 
--11.	Policz sredni wiek os�b zyjacych.
--12.	Policz srednia dlugosc zycia os�b niezyjacych z rozbiciem na mezczyzn i kobiety.
--13.	Dla kazdego powodu wygasniecia zwiazku wypisz liczbe zwiazk�w zakonczonych z tego powodu.
--14.	Podaj liczbe zwiazk�w malzenski z podzialem na lata.
--15.	Podaj personalia malzonk�w (zyjacych), kt�rych malzenstwo trwa najdluzej.
--16.	Podaj imiona i nazwiska najmlodszego i najstarszego pana mlodego.
--17.	Podaj najkr�cej trwajace malzenstwo zakonczone rozwodem.
--18.	Podaj nazwe miasta, w kt�rym urodzilo sie najwiecej os�b.
--19.	Podaj personalia rodzic�w majacych najwiecej dzieci.
