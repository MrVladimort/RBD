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

INSERT INTO LEKARZ(idLekarza, Imie, Nazwisko, Specjalizacja, Pensja) VALUES (5670, 'Brendon', 'Freeman', 'Chirurgia',2500);
INSERT INTO LEKARZ(idLekarza, Imie, Nazwisko, Specjalizacja, Pensja) VALUES (5671, 'Freddy', 'Adams', 'Chirurgia',3500);
INSERT INTO LEKARZ(idLekarza, Imie, Nazwisko, Specjalizacja, Pensja) VALUES (5672, 'Cole', 'Mcconnell', 'Neurologia',2000);
INSERT INTO LEKARZ(idLekarza, Imie, Nazwisko, Specjalizacja, Pensja) VALUES (5673, 'Madison', 'Johnson', 'Chirurgia',2000);
INSERT INTO LEKARZ(idLekarza, Imie, Nazwisko, Specjalizacja, Pensja) VALUES (5674, 'Arthur', 'Johnson', 'Chirurgia',5500);
INSERT INTO LEKARZ(idLekarza, Imie, Nazwisko, Specjalizacja, Pensja) VALUES (5675, 'Alissa', 'Brooks', 'Neurologia',1500);
INSERT INTO LEKARZ(idLekarza, Imie, Nazwisko, Specjalizacja, Pensja) VALUES (5676, 'Marianna', 'Ford', 'Okulistyka',1000);
INSERT INTO LEKARZ(idLekarza, Imie, Nazwisko, Specjalizacja, Pensja) VALUES (5677, 'Joanna', 'Freeman', 'Neurologia',2000);
INSERT INTO LEKARZ(idLekarza, Imie, Nazwisko, Specjalizacja, Pensja) VALUES (5678, 'Isabell', 'Fox', 'Okulistyka',1500);
INSERT INTO LEKARZ(idLekarza, Imie, Nazwisko, Specjalizacja, Pensja) VALUES (5679, 'Cara', 'Maxwell', 'Okulistyka',1800);
INSERT INTO LEKARZ(idLekarza, Imie, Nazwisko, Specjalizacja, Pensja) VALUES (5689, 'Elison', 'Redison', 'Dentyst',2100);
INSERT INTO LEKARZ(idLekarza, Imie, Nazwisko, Specjalizacja, Pensja) VALUES (5699, 'Andy', 'Redison', null ,1100);
INSERT INTO LEKARZ(idLekarza, Imie, Nazwisko, Specjalizacja, Pensja) VALUES (10,'Mike', 'Nowel', null ,1100);

INSERT INTO PACJENT(IdPacjenta, Imie, Nazwisko, Data_Ur) VALUES (1001, 'Eddie', 'Doyle', to_date('1983-05-18', 'YYYY-MM-DD'));
INSERT INTO PACJENT(IdPacjenta, Imie, Nazwisko, Data_Ur) VALUES (1002, 'Anna', 'Herman', to_date('1972-08-10', 'YYYY-MM-DD'));
INSERT INTO PACJENT(IdPacjenta, Imie, Nazwisko, Data_Ur) VALUES (1003, 'Ralph', 'Morris', to_date('1993-02-04', 'YYYY-MM-DD'));
INSERT INTO PACJENT(IdPacjenta, Imie, Nazwisko, Data_Ur) VALUES (1004, 'Kristian', 'Maxwell', to_date('1983-03-31', 'YYYY-MM-DD'));
INSERT INTO PACJENT(IdPacjenta, Imie, Nazwisko, Data_Ur) VALUES (1005, 'Arthur', 'Mikell', to_date('1980-06-15', 'YYYY-MM-DD'));
INSERT INTO PACJENT(IdPacjenta, Imie, Nazwisko, Data_Ur) VALUES (1006, 'Valeria', 'Gates', to_date('1995-01-14', 'YYYY-MM-DD'));
INSERT INTO PACJENT(IdPacjenta, Imie, Nazwisko, Data_Ur) VALUES (1007, 'Mike', 'Fisher', to_date('1982-12-02', 'YYYY-MM-DD'));
INSERT INTO PACJENT(IdPacjenta, Imie, Nazwisko, Data_Ur) VALUES (1008, 'Isabell', 'Fox', to_date('1984-10-14', 'YYYY-MM-DD'));
INSERT INTO PACJENT(IdPacjenta, Imie, Nazwisko, Data_Ur) VALUES (1009, 'Nathanial', 'Reynold', to_date('1981-07-30', 'YYYY-MM-DD'));
INSERT INTO PACJENT(IdPacjenta, Imie, Nazwisko, Data_Ur) VALUES (1010, 'Orlando', 'Richardson', to_date('1982-05-24', 'YYYY-MM-DD'));
INSERT INTO PACJENT(IdPacjenta, Imie, Nazwisko, Data_Ur) VALUES (1011, 'Demian', 'Brooks', to_date('1985-05-21', 'YYYY-MM-DD'));
INSERT INTO PACJENT(IdPacjenta, Imie, Nazwisko, Data_Ur) VALUES (1012, 'Charlie', 'Becker', to_date('1987-03-27', 'YYYY-MM-DD'));
INSERT INTO PACJENT(IdPacjenta, Imie, Nazwisko, Data_Ur) VALUES (1013, 'Charlie', 'Kowalski', to_date('1987-03-27', 'YYYY-MM-DD'));
INSERT INTO PACJENT(IdPacjenta, Imie, Nazwisko, Data_Ur) VALUES (1015, 'Charlie', 'Kowalski', to_date('1987-03-27', 'YYYY-MM-DD'));

INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1001, 5679, to_date('2011-11-23', 'YYYY-MM-DD'), null, 1500);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1010, 5671, to_date('2015-02-03', 'YYYY-MM-DD'), null, 500);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1011, 5672, to_date('2010-07-03', 'YYYY-MM-DD'), null, 1200);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1005, 5689, to_date('2012-06-09', 'YYYY-MM-DD'), null, 4350);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1007, 5677, to_date('2015-04-13', 'YYYY-MM-DD'), null, 400);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1004, 5675, to_date('2012-05-26', 'YYYY-MM-DD'), null, 200);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1004, 5678, to_date('2010-06-04', 'YYYY-MM-DD'), null, 100);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1010, 5674, to_date('2011-09-06', 'YYYY-MM-DD'), null, 540);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1002, 5679, to_date('2012-07-03', 'YYYY-MM-DD'), null, 1930);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1003, 5674, to_date('2012-02-02', 'YYYY-MM-DD'), null, 1230);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1001, 5674, to_date('2013-08-09', 'YYYY-MM-DD'), null, 100);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1005, 5677, to_date('2011-01-29', 'YYYY-MM-DD'), null, 500);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1006, 5677, to_date('2013-06-16', 'YYYY-MM-DD'), null, 300);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1009, 5679, to_date('2014-12-24', 'YYYY-MM-DD'), null, 200);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1011, 5674, to_date('2013-09-06', 'YYYY-MM-DD'), null, 500);
INSERT INTO WIZYTY(IdPacjenta, IdLekarza, Data, Opis, Cena) VALUES(1013, 10, to_date('2013-09-06', 'YYYY-MM-DD'), null, 500);



