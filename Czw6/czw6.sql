SELECT * FROM GOSC;
SELECT * FROM POKOJ;
SELECT * FROM REZERWACJA;
SELECT * FROM KATEGORIA;

--1.	Wypisz wszystkich klient�w hotelu w kolejno�ci 
--alfabetycznej (sortuj�c po nazwisku i imieniu).
SELECT * FROM GOSC ORDER BY NAZWISKO, IMIE;
--2.	Podaj bez powt�rze� wszystkie wyst�puj�ce w tabeli warto�ci 
--rabatu posortowane malej�co.
SELECT DISTINCT PROCENT_RABATU FROM GOSC ORDER BY PROCENT_RABATU DESC;
--3.	Wypisz wszystkie rezerwacje Ferdynanda Kiepskiego.
SELECT * FROM GOSC 
JOIN REZERWACJA ON REZERWACJA.IDGOSC = GOSC.IDGOSC 
WHERE IMIE = 'Ferdynand' AND NAZWISKO = 'Kiepski';
--4.	Wypisz go�ci, kt�rzy nie posiadaj� rabatu. Posortuj wed�ug nazwisk.
SELECT * FROM GOSC WHERE PROCENT_RABATU IS NULL ORDER BY NAZWISKO;
--5.	Wypisz rezerwacje z 2008 roku klient�w, kt�rych nazwisko zaczyna si� 
--na liter� �K� lub �L�. Podaj imi�, nazwisko oraz numer pokoju.
SELECT IMIE, NAZWISKO FROM GOSC JOIN REZERWACJA ON REZERWACJA.IDGOSC = GOSC.IDGOSC 
WHERE NAZWISKO LIKE 'L%' OR NAZWISKO LIKE 'K%'; 
--6.	Wypisz klient�w, kt�rzy zalegaj� z p�atno�ciami (pole �zaplacone� r�wne 0).
--7.	Wypisz klient�w, kt�rzy co najmniej raz wynaj�li pok�j luksusowy.
--8.	Wypisz numery pokoi wynajmowanych przez Andrzeja Nowaka.
--9.	Wypisz imiona i nazwiska go�ci wraz z liczb� dokonanych przez nich rezerwacji. 
--Nie wypisuj go�ci, kt�rzy maj� mniej ni� 3 rezerwacje.
--10.	Wypisz, ile maksymalnie os�b mo�e przyj�� hotel jednocze�nie.
--11.	Wypisz, ile maksymalnie os�b w pokojach luksusowych mo�e przyj�� hotel jednocze�nie.
--12.	Podaj liczb� pokoi w ka�dej kategorii.
--13.	Znajd� pok�j, kt�ry nie by� nigdy wynajmowany.
--14.	Znajd� klient�w, kt�rzy korzystali z us�ug hotelu tylko raz.
--15.	Wypisz klient�w, kt�rzy spali w pokoju 101 i zap�acili.
--16.	Policz, ile zarobi� hotel na Marianie Pa�dziochu bior�c pod uwag� 
--cen� za dob�, liczb� dni oraz rabat.
