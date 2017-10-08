  select *
  from osoba;
  select *
  from zwiazek_malzenski;
  select *
  from miejscowosc;
  

--1.		ZnajdŸ osoby bêd¹ce korzeniami drzewa genealogicznego. 	
  select *
  from osoba
  where matka is null and ojciec is null;
--2.		ZnajdŸ osobê o peselu 12345678908.	
  select *
  from osoba
  where pesel = '12345678908';
--3.		Wyœwietl zwi¹zki ma³¿eñskie, które w zesz³ym roku zakoñczy³y siê zgonem. 	
  select *
  from zwiazek_malzenski
  where extract(year from data_wygasniecia_zwiazku)<2016 and POWOD_WYGASNIECIA_ZWIAZKU='Zgon';
--4.			ZnajdŸ osoby, które urodzi³y siê w Warszawie.		
  select o.imie, o.nazwisko, m.nazwa
  from osoba o join miejscowosc m on o.miejsce_urodzenia=m.id_miejscowosci
  where m.NAZWA='Warszawa';
--5.			Wypisz pesele rodziców osoby o peselu 12345678908.		
  select matka, ojciec
  from osoba
  where pesel = '12345678908';
--6.			Wypisz imiona i nazwiska rodziców osoby o peselu 12345678908.		
  select mat.imie "Imie matki", mat.nazwisko "Nazwisko matki", ojc.imie "Imie ojca", ojc.nazwisko "Nazwisko ojca"
  from osoba dz 
  join osoba mat on mat.pesel=dz.matka 
  join osoba ojc on ojc.pesel=dz.ojciec
  where dz.pesel = '12345678908';
--7.			Wypisz imiona i nazwiska rodzeñstwa osoby o peselu 12345678908.		
  select rodz.imie, rodz.nazwisko 
  from osoba dz 
  join osoba rodz on dz.matka=rodz.matka and rodz.ojciec=dz.ojciec and not rodz.pesel=dz.pesel
  where dz.pesel = '12345678908';
--8.			Wypisz dane o ma³¿eñstwach zawartych w miejscu urodzenia przynajmniej jednej ze stron.	
  select zw.ID_ZWIAZKU
  from ZWIAZEK_MALZENSKI zw
  join osoba dr on  zw.ZONA = dr.pesel
  join osoba m on zw.maz = m.pesel
  where zw.ID_MIEJSCOWOSCI=m.MIEJSCE_URODZENIA or zw.ID_MIEJSCOWOSCI=dr.MIEJSCE_URODZENIA;
--9.		Wypisz imiona i nazwiska wnuków pani Wandy Zielonogórskiej.	
  select wn.imie, wn.nazwisko
  from osoba mz
  join osoba dz on dz.matka=mz.pesel
  join osoba wn on wn.matka=dz.pesel or wn.ojciec=dz.pesel
  where mz.imie='Wanda';
--10.		Wypisz ró¿nice wieku miêdzy ma³¿onkami.	
  select abs(extract(year from dr.data_urodzenia) - extract(year from m.data_urodzenia)) "roznica"
  from ZWIAZEK_MALZENSKI zw
  join osoba dr on  zw.ZONA = dr.pesel
  join osoba m on zw.maz = m.pesel;
--11.		Wypisz wiek najm³odszej i najstarszej matki.
  select min(extract(year from nvl(mz.data_zgonu,current_date)) - extract(year from mz.data_urodzenia)) "najmlodsza", max(extract(year from nvl(mz.data_zgonu,current_date)) - extract(year from mz.data_urodzenia)) "najstarsza"
  from osoba mz
  join osoba dz on dz.matka=mz.pesel;
--12.		Policz œredni wiek osób ¿yj¹cych.	
  select avg(extract(year from current_date) - extract(year from data_urodzenia)) "œredni wiek"
  from osoba
  where DATA_ZGONU is null;
--13.		Policz œredni¹ d³ugoœæ ¿ycia osób nie¿yj¹cych z rozbiciem na mê¿czyzn i kobiety.
  select avg(extract(year from DATA_ZGONU) - extract(year from data_urodzenia)) "œredni wiek", plec
  from osoba
  where not DATA_ZGONU is null
  group by PLEC;
--14.		Dla ka¿dego powodu wygaœniêcia zwi¹zku wypisz liczbê zwi¹zków zakoñczonych z tego powodu.	
  select zw.POWOD_WYGASNIECIA_ZWIAZKU, count(zw.ID_ZWIAZKU)
  from ZWIAZEK_MALZENSKI zw
  group by zw.POWOD_WYGASNIECIA_ZWIAZKU
  having not zw.POWOD_WYGASNIECIA_ZWIAZKU is null;
--15.		Podaj liczbê zwi¹zków ma³¿eñski z podzia³em na lata.	
  select extract(year from DATA_ZAWARCIA_ZWIAZKU) data, count(id_zwiazku) zwiazki
  from ZWIAZEK_MALZENSKI
  group by extract(year from DATA_ZAWARCIA_ZWIAZKU);
--16.		Podaj personalia ma³¿onków (¿yj¹cych), których ma³¿eñstwo trwa najd³u¿ej.	
--17.		Podaj imiona i nazwiska najm³odszego i najstarszego pana m³odego.	
--18.		Podaj najkrócej trwaj¹ce ma³¿eñstwo zakoñczone rozwodem.	
--19.		Podaj nazwê miasta, w którym urodzi³o siê najwiêcej osób.	
--20.		Podaj personalia rodziców maj¹cych najwiêcej dzieci.	
