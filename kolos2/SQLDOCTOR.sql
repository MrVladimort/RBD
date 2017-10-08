------1. Wypisz imiona i nazwiska pacjentow urodzonych 1981 
Select imie || ' ' || nazwisko as "Pacjent"
From Pacjent 
Where extract(year from data_ur) = 1981
Order by nazwisko;

-------2. 
Select PACJENT.imie, PACJENT.nazwisko, 
LEKARZ.imie, LEKARZ.nazwisko
From PACJENT 
Inner join WIZYTY on PACJENT.idpacjenta=WIZYTY.idpacjenta
Inner join LEKARZ on LEKARZ.idlekarza = WIZYTY.idlekarza;

-------3. 
Select count(idlekarza), avg(Pensja), specjalizacja 
From lekarz
Group by specjalizacja;

------4.

Select imie || ' ' || nazwisko "lekarz", count (*) wizyty
FROM LEKARZ
Inner join wizyty on wizyty.idlekarza=lekarz.idlekarza
Where not specjalizacja = 'Dentyst'
And extract(Year from data) = 2013
Group by imie || ' ' || nazwisko
Having count(*)>4;

--------5.
Select imie || ' ' || nazwisko lekarz
FROM LEKARZ lz
where not exists (SELECT 'x'
from wizyty wz
where wz.IDLEKARZA=lz.idLekarza
and extract(Year from data) = 2011);

-------6.
select lkr.specjalizacja, max(suma_wizytow) from (SELECT wz.idlekarza, count(*) as suma_wizytow
from wizyty wz
inner join lekarz lz on wz.idlekarza=lz.idlekarza 
group by wz.idlekarza) maxt
inner join lekarz lkr on lkr.IDLEKARZA=maxt.idlekarza
group by lkr.specjalizacja;

-------7.
UPDATE WIZYTY
SET CENA = 50
WHERE IDPACJENTA = (SELECT IDPACJENTA FROM PACJENT WHERE NAZWISKO = 'Kowalski')
AND IDLEKARZA = 10;

-------8.
Delete from wizyty
where idlekarza = (Select idlekarza from lekarz
Where specjalizacja like 'A%');
Delete from lekarz
Where specjalizacja like 'A%';
-------9.
SELECT imie || ' ' || nazwisko lekarz, 12*pensja as "PENSJA"
FROM lekarz
WHERE specjalizacja is null;
-------10.
SELECT count(*) pacjenci, extract(year from data_ur) rok_ur
from pacjent
group by extract(year from data_ur);