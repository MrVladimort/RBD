DROP TABLE OCENA;
DROP TABLE Student;
Drop TABLE PRZEDMIOT;

CREATE TABLE Student (
  Nr_Indeksu INTEGER NOT NULL CONSTRAINT NR_Indeksu_PK PRIMARY KEY,
  Imie VARCHAR(20),
  Nazwisko VARCHAR(20),
  Rok INTEGER
);

Create table Przedmiot (
  Skrot VARCHAR(4) NOT NULL CONSTRAINT SKROT_PK PRIMARY KEY,
  Nazwa VARCHAR(20)
);

CREATE TABLE OCENA (
  SKROT VARCHAR(4) NOT NULL , 
  Nr_Indeksu INTEGER,
  Data Date,
  Ocena number,
  CONSTRAINT OCENA_PK PRIMARY KEY (SKROT, NR_Indeksu, Data),
  CONSTRAINT OCENA_PRZEDMIOT_FK FOREIGN KEY (SKROT) REFERENCES PRZEDMIOT(SKROT),
  CONSTRAINT OCENA_STUDENT_FK FOREIGN KEY (NR_INDEKSU) REFERENCES STUDENT(NR_INDEKSU)
);

INSERT
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok)
VALUES (12345, 'Jan', 'Nowak', 1);
INSERT
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok)
VALUES (12344, 'Jan', 'Kowalski',3);
INSERT
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok)
VALUES (12343, 'Andrzej', 'Nowak', 1);
INSERT
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok)
VALUES (12342, 'Andrzej', 'Kowalski', 2);
INSERT
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok)
VALUES (12340, 'Marek', 'Kowalski', 3);
INSERT
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok)
VALUES (12352, 'Andrej', 'Abcds', 2);
INSERT
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok)
VALUES (12312, 'Andrej', 'Abcdzs', 2);
INSERT
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok)
VALUES (10000, 'Karol', 'Kot', 2);
INSERT
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok)
VALUES (12323, 'AB', 'NowaBAk', 1);
INSERT
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok)
VALUES (123323, 'Anna', 'Nowak', 1);



INSERT
INTO Przedmiot (Skrot, Nazwa)
VALUES ('ALG', 'Algebra Liniowa');
INSERT
INTO Przedmiot (Skrot, Nazwa)
VALUES ('MAD', 'Matematyka Dyskretna');
INSERT
INTO Przedmiot (Skrot, Nazwa)
VALUES ('SBD', 'Systemy Baz Danych');
INSERT
INTO Przedmiot (Skrot, Nazwa)
VALUES ('RBD', 'RelacyjneBazyDanych');
INSERT
INTO Przedmiot (Skrot, Nazwa)
VALUES ('TAK', 'TechnologiaKomp');
INSERT
INTO Przedmiot (Skrot, Nazwa)
VALUES ('FIL', 'Filozofia');
INSERT
INTO Przedmiot (Skrot, Nazwa)
VALUES ('SKJ', 'SKJ');
INSERT
INTO Przedmiot (Skrot, Nazwa)
VALUES ('BD', 'Bazy danych');
INSERT
INTO Przedmiot (Skrot, Nazwa)
VALUES ('AUG', 'Automaty');

INSERT INTO OCENA(SKROT, NR_Indeksu, Data, Ocena) VALUES ('AUG', 123323, TO_DATE('2016-11-23', 'YYYY-MM-DD'), 4.5);
INSERT
INTO OCENA (SKROT, NR_Indeksu, Data, Ocena)
VALUES ('SBD', 12345, TO_DATE('2016-11-23', 'YYYY-MM-DD'), 4.5);
INSERT
INTO OCENA (SKROT, NR_Indeksu, Data, Ocena)
VALUES ('SBD', 12345, TO_DATE('2016-01-23', 'YYYY-MM-DD'), 4.5);
INSERT
INTO OCENA (SKROT, NR_Indeksu, Data, Ocena)
VALUES ('SBD', 12344, TO_DATE('2016-11-23', 'YYYY-MM-DD'), 3);
INSERT
INTO OCENA (SKROT, NR_Indeksu, Data, Ocena)
VALUES ('SBD', 12342, TO_DATE('2016-11-23', 'YYYY-MM-DD'), 2);
INSERT
INTO OCENA (SKROT, NR_Indeksu, Data, Ocena)
VALUES ('SBD', 12343, TO_DATE('2016-11-23', 'YYYY-MM-DD'), 2);
INSERT
INTO OCENA (SKROT, NR_Indeksu, Data, Ocena)
VALUES ('RBD', 12345, TO_DATE('2016-11-23', 'YYYY-MM-DD'), 3);
INSERT
INTO OCENA (SKROT, NR_Indeksu, Data, Ocena)
VALUES ('MAD', 12344, TO_DATE('2016-11-23', 'YYYY-MM-DD'), 5);
INSERT
INTO OCENA (SKROT, NR_Indeksu, Data, Ocena)
VALUES ('ALG', 12344, TO_DATE('2016-11-23', 'YYYY-MM-DD'), 5);
INSERT
INTO OCENA (SKROT, NR_Indeksu, Data, Ocena)
VALUES ('ALG', 12343, TO_DATE('2016-11-23', 'YYYY-MM-DD'), 5);
INSERT
INTO OCENA (SKROT, NR_Indeksu, Data, Ocena)
VALUES ('SKJ', 12343, TO_DATE('2016-11-23', 'YYYY-MM-DD'), 5);
INSERT
INTO OCENA (SKROT, NR_Indeksu, Data, Ocena)
VALUES ('FIL', 12343, TO_DATE('2016-11-23', 'YYYY-MM-DD'), 5);
INSERT
INTO OCENA (SKROT, NR_Indeksu, Data, Ocena)
VALUES ('BD', 12343, TO_DATE('2004-11-23', 'YYYY-MM-DD'), 5);
INSERT
INTO OCENA (SKROT, NR_Indeksu, Data, Ocena)
VALUES ('BD', 12342, TO_DATE('2003-11-23', 'YYYY-MM-DD'), 3);