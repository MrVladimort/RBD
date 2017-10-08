select *
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
join pokoj p on r.nrpokoju = p.nrpokoju
join kategoria k on k.idkategoria=p.IDKATEGORIA;

select * from pokoj
join kategoria k on k.idkategoria=pokoj.IDKATEGORIA;

--1.	Wypisz wszystkich klient�w hotelu w kolejno�ci alfabetycznej (sortuj�c po nazwisku i imieniu).
select imie, nazwisko
from gosc
order by nazwisko, imie;
--2.	Podaj bez powt�rze� wszystkie wyst�puj�ce w tabeli warto�ci rabatu posortowane malej�co.
select distinct procent_rabatu
from gosc
order by PROCENT_RABATU desc;
--3.	Wypisz wszystkie rezerwacje Ferdynanda Kiepskiego.
select imie, nazwisko, rezerwacja.IDREZERWACJA
from rezerwacja inner join gosc on gosc.idgosc = rezerwacja.IDGOSC
where imie = 'Ferdynand' and nazwisko = 'Kiepski';
--4.	Wypisz go�ci, kt�rzy nie posiadaj� rabatu. Posortuj wed�ug nazwisk.
select imie, nazwisko
from gosc
where PROCENT_RABATU is null or PROCENT_RABATU = 0
order by nazwisko;
--5.	Wypisz rezerwacje z 2008 roku klient�w, kt�rych nazwisko zaczyna si� na liter� �K� lub �L�. Podaj imi�, nazwisko oraz numer pokoju.
select distinct imie, nazwisko, nrpokoju
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
where (nazwisko like 'K%' or NAZWISKO like 'L%') and extract(year from dataod)>2008;
--6.	Wypisz klient�w, kt�rzy zalegaj� z p�atno�ciami (pole �zaplacone� r�wne 0).
select distinct imie, nazwisko, nrpokoju
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
WHERE r.ZAPLACONA = 0;
--7.	Wypisz klient�w, kt�rzy co najmniej raz wynaj�li pok�j luksusowy.
select distinct imie, nazwisko
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
join pokoj p on r.nrpokoju = p.nrpokoju
join kategoria k on k.idkategoria=p.IDKATEGORIA
WHERE k.nazwa = 'Luksusowy';
--8.	Wypisz numery pokoi wynajmowanych przez Andrzeja Nowaka.
select nrpokoju
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
where imie = 'Andrzej' and nazwisko = 'Nowak';
--9.	Wypisz imiona i nazwiska go�ci wraz z liczb� dokonanych przez nich rezerwacji. Nie wypisuj go�ci, kt�rzy maj� mniej ni� 3 rezerwacje.
select imie, nazwisko, count(imie)
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
group by imie, nazwisko
having count(imie)>=3;
--10.	Wypisz, ile maksymalnie os�b mo�e przyj�� hotel jednocze�nie.
select count(*) from pokoj;
--11.	Wypisz, ile maksymalnie os�b w pokojach luksusowych mo�e przyj�� hotel jednocze�nie.
select count(*) from pokoj
join kategoria k on k.idkategoria=pokoj.IDKATEGORIA
where k.nazwa = 'Luksusowy';
--12.	Podaj liczb� pokoi w ka�dej kategorii.
select k.NAZWA, count(*) from pokoj
join kategoria k on k.idkategoria=pokoj.IDKATEGORIA
group by k.NAZWA;
--13.	Znajd� pok�j, kt�ry nie by� nigdy wynajmowany.
select r.nrpokoju, count(*)
from rezerwacja r 
join pokoj p on r.nrpokoju = p.nrpokoju
group by r.nrpokoju;
--14.	Znajd� klient�w, kt�rzy korzystali z us�ug hotelu tylko raz.
select imie, nazwisko
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
group by imie, nazwisko
having count(*) = 1;
--15.	Wypisz klient�w, kt�rzy spali w pokoju 101 i zap�acili.
select distinct imie, nazwisko
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
where r.NRPOKOJU = 101 and r.ZAPLACONA = 1;
--16.	Policz, ile zarobi� hotel na Marianie Pa�dziochu bior�c pod uwag� cen� za dob�, liczb� dni oraz rabat.
select SUM((datado - dataod)*k.cena-(datado - dataod)*k.cena*procent_rabatu/100) "Zarobki"
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
join pokoj p on r.nrpokoju = p.nrpokoju
join kategoria k on k.idkategoria=p.IDKATEGORIA
where imie = 'Marian' and nazwisko = 'Padzioch';