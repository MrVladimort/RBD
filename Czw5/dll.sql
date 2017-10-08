--1.	Utwórz tabelê „miasto” posiadaj¹c¹ klucz g³ówny (np. id_miasto)
--oraz kolumnê „nazwa”.
DROP TABLE osoba;
DROP TABLE miasto;
CREATE TABLE miasto (
  id_miasto INTEGER PRIMARY KEY,
  nazwa VARCHAR2(16)
  );

--2.	Utwórz tabelê „osoba” posiadaj¹c¹ kolumny: id_osoby, nazwisko, 
--data_urodzenia, adres oraz id_miasto, które jest kluczem obcym z tabeli miasto.

CREATE TABLE osoba (
  id_osoby INTEGER PRIMARY KEY,
  nazwisko VARCHAR(16),
  data_urodzenia DATE,
  adres VARCHAR(20),
  id_miasto INTEGER REFERENCES miasto
  );
--3.	Dodaj kolumnê „zawod” do tabeli osoba.
ALTER TABLE osoba ADD zawod VARCHAR2(20);
--4.	Wstaw kilka przyk³adowych miast.
INSERT INTO miasto VALUES
        (1, 'Praga');  
INSERT INTO miasto VALUES
        (2, 'Wieden');
INSERT INTO miasto VALUES
        (3, 'Kijow');
INSERT INTO miasto VALUES
        (4, 'Kek');
--5.	Wstaw kilka osób do tabeli „osoba”. SprawdŸ czy da siê wstawiæ id_miasta 
--nie istniej¹ce w tabeli „miasto”?
INSERT INTO osoba VALUES
        (1, 'Kek', '19/02/16', 'ul.kek', 1, 'kek');
INSERT INTO osoba VALUES
        (2, 'Kek', '19/02/16', 'ul.kek', 2, 'kek'); 
INSERT INTO osoba VALUES
        (3, 'Kek', '19/02/16', 'ul.kek', 2, 'kek'); 
INSERT INTO osoba VALUES
        (4, 'Kek', '19/02/16', 'ul.kek', 3, 'kek');
INSERT INTO osoba VALUES
        (5, 'Kek', '19/02/16', 'ul.kek', 4, 'kek');
--6.	Wstaw do tabeli osoba wszystkich pracowników z tabeli emp. 
--Dla brakuj¹cych pól (data_urodzenia, id_miasta, adres) mo¿na przyj¹æ sta³¹ 
--wartoœæ lub NULL.


  
  