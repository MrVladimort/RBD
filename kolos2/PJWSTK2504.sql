select *
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
join pokoj p on r.nrpokoju = p.nrpokoju
join kategoria k on k.idkategoria=p.IDKATEGORIA;

select * from pokoj
join kategoria k on k.idkategoria=pokoj.IDKATEGORIA;

--1.	Wypisz wszystkich klientów hotelu w kolejnoœci alfabetycznej (sortuj¹c po nazwisku i imieniu).
select imie, nazwisko
from gosc
order by nazwisko, imie;
--2.	Podaj bez powtórzeñ wszystkie wystêpuj¹ce w tabeli wartoœci rabatu posortowane malej¹co.
select distinct procent_rabatu
from gosc
order by PROCENT_RABATU desc;
--3.	Wypisz wszystkie rezerwacje Ferdynanda Kiepskiego.
select imie, nazwisko, rezerwacja.IDREZERWACJA
from rezerwacja inner join gosc on gosc.idgosc = rezerwacja.IDGOSC
where imie = 'Ferdynand' and nazwisko = 'Kiepski';
--4.	Wypisz goœci, którzy nie posiadaj¹ rabatu. Posortuj wed³ug nazwisk.
select imie, nazwisko
from gosc
where PROCENT_RABATU is null or PROCENT_RABATU = 0
order by nazwisko;
--5.	Wypisz rezerwacje z 2008 roku klientów, których nazwisko zaczyna siê na literê „K” lub „L”. Podaj imiê, nazwisko oraz numer pokoju.
select distinct imie, nazwisko, nrpokoju
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
where (nazwisko like 'K%' or NAZWISKO like 'L%') and extract(year from dataod)>2008;
--6.	Wypisz klientów, którzy zalegaj¹ z p³atnoœciami (pole „zaplacone” równe 0).
select distinct imie, nazwisko, nrpokoju
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
WHERE r.ZAPLACONA = 0;
--7.	Wypisz klientów, którzy co najmniej raz wynajêli pokój luksusowy.
select distinct imie, nazwisko
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
join pokoj p on r.nrpokoju = p.nrpokoju
join kategoria k on k.idkategoria=p.IDKATEGORIA
WHERE k.nazwa = 'Luksusowy';
--8.	Wypisz numery pokoi wynajmowanych przez Andrzeja Nowaka.
select nrpokoju
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
where imie = 'Andrzej' and nazwisko = 'Nowak';
--9.	Wypisz imiona i nazwiska goœci wraz z liczb¹ dokonanych przez nich rezerwacji. Nie wypisuj goœci, którzy maj¹ mniej ni¿ 3 rezerwacje.
select imie, nazwisko, count(imie)
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
group by imie, nazwisko
having count(imie)>=3;
--10.	Wypisz, ile maksymalnie osób mo¿e przyj¹æ hotel jednoczeœnie.
select count(*) from pokoj;
--11.	Wypisz, ile maksymalnie osób w pokojach luksusowych mo¿e przyj¹æ hotel jednoczeœnie.
select count(*) from pokoj
join kategoria k on k.idkategoria=pokoj.IDKATEGORIA
where k.nazwa = 'Luksusowy';
--12.	Podaj liczbê pokoi w ka¿dej kategorii.
select k.NAZWA, count(*) from pokoj
join kategoria k on k.idkategoria=pokoj.IDKATEGORIA
group by k.NAZWA;
--13.	ZnajdŸ pokój, który nie by³ nigdy wynajmowany.
select r.nrpokoju, count(*)
from rezerwacja r 
join pokoj p on r.nrpokoju = p.nrpokoju
group by r.nrpokoju;
--14.	ZnajdŸ klientów, którzy korzystali z us³ug hotelu tylko raz.
select imie, nazwisko
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
group by imie, nazwisko
having count(*) = 1;
--15.	Wypisz klientów, którzy spali w pokoju 101 i zap³acili.
select distinct imie, nazwisko
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
where r.NRPOKOJU = 101 and r.ZAPLACONA = 1;
--16.	Policz, ile zarobi³ hotel na Marianie PaŸdziochu bior¹c pod uwagê cenê za dobê, liczbê dni oraz rabat.
select SUM((datado - dataod)*k.cena-(datado - dataod)*k.cena*procent_rabatu/100) "Zarobki"
from rezerwacja r join gosc g on g.idgosc = r.IDGOSC
join pokoj p on r.nrpokoju = p.nrpokoju
join kategoria k on k.idkategoria=p.IDKATEGORIA
where imie = 'Marian' and nazwisko = 'Padzioch';