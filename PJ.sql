DROP TABLE Student;
DROP TABLE Przedmiot;
DROP TABLE Ocena;

/*CREATE TABLE Student (Nr_Indeksu int,
    Imie varchar(255) NOT NULL,
    Nazwisko varchar(255) NOT NULL,
    Rok date NOT NULL,
    PRIMARY KEY (Nr_Indeksu));

INSERT 
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok) 
VALUES (12345, 'Jan', 'Nowak', TO_DATE('17/12/2015', 'DD/MM/YYYY')); 
INSERT 
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok) 
VALUES (12344, 'Jan', 'Kowalski', TO_DATE('17/12/2015', 'DD/MM/YYYY')); 
INSERT 
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok) 
VALUES (12343, 'Andrzej', 'Nowak', TO_DATE('17/12/2015', 'DD/MM/YYYY')); 
INSERT 
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok) 
VALUES (12342, 'Andrzej', 'Kowalski', TO_DATE('17/12/2015', 'DD/MM/YYYY'));

CREATE TABLE Przedmiot (Skrot varchar(20),
    Nazwa varchar(255) NOT NULL,
    PRIMARY KEY (Skrot));
    
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
    
CREATE TABLE Ocena (Skrot varchar(255),
    Nr_indeksu int,
    Data date NOT NULL,
    Ocena int NOT NULL,
    PRIMARY KEY (Data),
    FOREIGN KEY (Skrot) REFERENCES Przedmiot(Skrot),
    FOREIGN KEY (Nr_indeksu) REFERENCES Student(Nr_indeksu)
    );
    
INSERT 
INTO OCENA (Skrot, NR_Indeksu, Data, Ocena) 
VALUES ('SBD', 12345, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 4.5); 
INSERT 
INTO OCENA (Skrot, NR_Indeksu, Data, Ocena) 
VALUES ('RBD', 12345, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 3); 
INSERT 
INTO OCENA (Data, Ocena) 
VALUES ('MAD', 12344, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 5); 
INSERT 
INTO OCENA (Skrot, NR_Indeksu, Data, Ocena) 
VALUES ('ALG', 12344, TO_DATE('17/12/2015', 'DD/MM/YYYY'), 5); 
*/

CREATE TABLE OCENA ( 
SKROT VARCHAR(4) NOT NULL , 
Nr_Indeksu INTEGER, 
Data Date, 
Ocena number, 
CONSTRAINT OCENA_PK PRIMARY KEY (SKROT, Nr_Indeksu, Data) 
); 


INSERT 
INTO OCENA (SKROT, Nr_Indeksu, Data, Ocena) 
VALUES ('SBD', 12345, '2016-11-23', 4.5); 
INSERT 
INTO OCENA (SKROT, Nr_Indeksu, Data, Ocena) 
VALUES ('RBD', 12345, '2016-11-23', 3); 
INSERT 
INTO OCENA (SKROT, Nr_Indeksu, Data, Ocena) 
VALUES ('MAD', 12344, '2016-11-23', 5); 
INSERT 
INTO OCENA (SKROT, Nr_Indeksu, Data, Ocena) 
VALUES ('ALG', 12344, '2016-11-23', 5); 

CREATE TABLE Student ( 
Nr_Indeksu INTEGER NOT NULL CONSTRAINT NR_Indeksu_PK PRIMARY KEY, 
Imie VARCHAR(20), 
Nazwisko VARCHAR(20), 
Rok Date 
); 

INSERT 
INTO Student (Nr_Indeksu, Imie, Nazwisko)--, Rok) 
VALUES (12345, 'Jan', 'Nowak');--, TO_DATE('2016')); 
INSERT 
INTO Student (Nr_Indeksu, Imie, Nazwisko)--, Rok) 
VALUES (12344, 'Jan', 'Kowalski');--, TO_DATE('2016')); 
INSERT 
INTO Student (Nr_Indeksu, Imie, Nazwisko) 
VALUES (12343, 'Andrzej', 'Nowak'); 
INSERT 
INTO Student (Nr_Indeksu, Imie, Nazwisko)--, Rok) 
VALUES (12342, 'Andrzej', 'Kowalski');--, TO_DATE('2016')); 
Create table Przedmiot ( 
Skrot VARCHAR(4) NOT NULL CONSTRAINT SKROT_PK PRIMARY KEY, 
Nazwa VARCHAR(20) 
); 
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


SELECT * FROM Ocena;
SELECT * FROM Student;
SELECT * FROM Przedmiot;

--1--
SELECT Nr_indeksu, Skrot, Data FROM Ocena WHERE SKROT != 'SBD'
and Data > '01/01/14'; 
--2--
Select Nr_indeksu, data, ocena FROM ocena where Skrot = 'SBD' or Skrot = 'RBD';
--3--
SELECT s.Imie, s.Nazwisko, AVG(o.ocena) Srednia FROM Student s 
Join Ocena o On s.Nr_Indeksu = o.Nr_Indeksu; 
--4--
Select Skrot  From Ocena;


    

