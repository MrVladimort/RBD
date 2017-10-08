SELECT * FROM GOSC;
SELECT * FROM POKOJ;
SELECT * FROM REZERWACJA;
SELECT * FROM KATEGORIA;

--1.	Wypisz wszystkich klientów hotelu w kolejnoœci 
--alfabetycznej (sortuj¹c po nazwisku i imieniu).
SELECT * FROM GOSC ORDER BY NAZWISKO, IMIE;
--2.	Podaj bez powtórzeñ wszystkie wystêpuj¹ce w tabeli wartoœci 
--rabatu posortowane malej¹co.
SELECT DISTINCT PROCENT_RABATU FROM GOSC ORDER BY PROCENT_RABATU DESC;
--3.	Wypisz wszystkie rezerwacje Ferdynanda Kiepskiego.
SELECT * FROM GOSC 
JOIN REZERWACJA ON REZERWACJA.IDGOSC = GOSC.IDGOSC 
WHERE IMIE = 'Ferdynand' AND NAZWISKO = 'Kiepski';
--4.	Wypisz goœci, którzy nie posiadaj¹ rabatu. Posortuj wed³ug nazwisk.
SELECT * FROM GOSC WHERE PROCENT_RABATU IS NULL ORDER BY NAZWISKO;
--5.	Wypisz rezerwacje z 2008 roku klientów, których nazwisko zaczyna siê 
--na literê „K” lub „L”. Podaj imiê, nazwisko oraz numer pokoju.
SELECT IMIE, NAZWISKO FROM GOSC JOIN REZERWACJA ON REZERWACJA.IDGOSC = GOSC.IDGOSC 
WHERE NAZWISKO LIKE 'L%' OR NAZWISKO LIKE 'K%'; 
--6.	Wypisz klientów, którzy zalegaj¹ z p³atnoœciami (pole „zaplacone” równe 0).
--7.	Wypisz klientów, którzy co najmniej raz wynajêli pokój luksusowy.
--8.	Wypisz numery pokoi wynajmowanych przez Andrzeja Nowaka.
--9.	Wypisz imiona i nazwiska goœci wraz z liczb¹ dokonanych przez nich rezerwacji. 
--Nie wypisuj goœci, którzy maj¹ mniej ni¿ 3 rezerwacje.
--10.	Wypisz, ile maksymalnie osób mo¿e przyj¹æ hotel jednoczeœnie.
--11.	Wypisz, ile maksymalnie osób w pokojach luksusowych mo¿e przyj¹æ hotel jednoczeœnie.
--12.	Podaj liczbê pokoi w ka¿dej kategorii.
--13.	ZnajdŸ pokój, który nie by³ nigdy wynajmowany.
--14.	ZnajdŸ klientów, którzy korzystali z us³ug hotelu tylko raz.
--15.	Wypisz klientów, którzy spali w pokoju 101 i zap³acili.
--16.	Policz, ile zarobi³ hotel na Marianie PaŸdziochu bior¹c pod uwagê 
--cenê za dobê, liczbê dni oraz rabat.
