DROP TABLE EliksiryWAlchemij;
DROP TABLE OlejeWAchemij;
DROP TABLE BombyWAlchemij;
DROP TABLE ZnakiWTatktyce;
DROP TABLE MiejscowosciWZleceniu;
DROP TABLE PotworyWZleceniu;
DROP TABLE ZleceniaZlecenieDawcy;
DROP TABLE Taktyka;
DROP TABLE Potwor;
DROP TABLE Zlecenie;
DROP TABLE Oleje;
DROP TABLE Bomby;
DROP TABLE Eliksiry;
DROP TABLE Znaki;
DROP TABLE Alchemia;
DROP TABLE Rodzaj;
DROP TABLE Mejscowosc;
DROP TABLE ZlecenieDawca;
DROP TABLE Wiedzminy;
--======================================================================================================================
CREATE TABLE Wiedzminy(
    IdWiedzmin INT PRIMARY KEY,
    Imie VARCHAR2(255) NOT NULL,
    Szkola VARCHAR2(255)
);

INSERT INTO Wiedzminy
    VALUES (0001, 'Geralt', 'Szkola Wilka');
INSERT INTO Wiedzminy
    VALUES (0002, 'Vesemir', 'Szkola Wilka');
INSERT INTO Wiedzminy
    VALUES (0003, 'Eskel', 'Szkola Wilka');
INSERT INTO Wiedzminy
    VALUES (0004, 'Lambert', 'Szkola Wilka');
INSERT INTO Wiedzminy
    VALUES (0005, 'Letho', 'Szkola Kota');
--======================================================================================================================
CREATE TABLE ZlecenieDawca(
    IdZlecenieDawca INT PRIMARY KEY,
    Imie VARCHAR2(255) NOT NULL,
    Nazwisko VARCHAR2(255)
);

INSERT INTO ZlecenieDawca
    VALUES (0001, 'Odolan', NULL);
INSERT INTO ZlecenieDawca
    VALUES (0002, 'Leslaw', NULL);
INSERT INTO ZlecenieDawca
    VALUES (0003, 'Brean', 'Hotsch');
INSERT INTO ZlecenieDawca
    VALUES (0004, 'Thorleif', NULL);
INSERT INTO ZlecenieDawca
    VALUES (0005, 'Jorund', NULL);
--======================================================================================================================
CREATE TABLE Mejscowosc(
    IdMejscowosc INT PRIMARY KEY,
    Nazwa VARCHAR2(255) NOT NULL
);

INSERT INTO Mejscowosc
    VALUES (0001, 'Bialy Sad');
INSERT INTO Mejscowosc
    VALUES (0002, 'Velen');
INSERT INTO Mejscowosc
    VALUES (0003, 'Novigrad');
INSERT INTO Mejscowosc
    VALUES (0004, 'Skellige');
INSERT INTO Mejscowosc
    VALUES (0005, 'Oxenfurt');
--======================================================================================================================
CREATE TABLE Rodzaj(
    IdRodzaj INT PRIMARY KEY,
    Nazwa VARCHAR2(255) NOT NULL,
    Opis VARCHAR2(255)
);

INSERT INTO Rodzaj
    VALUES (0001, 'Upiory', 'Twory niematerialne, ktore utknely pomiedzy dwoma swiatami');
INSERT INTO Rodzaj
    VALUES (0002, 'Drakonidy','Rzad stworzen spokrewnionych ze smokami, nie obejmujacy jednak smokow wlasciwych');
INSERT INTO Rodzaj
    VALUES (0003, 'Trupojady', 'Najczesciej spotykane na cmentarzac, czy na polach bitew, gdyz ich diete stanowia zwloki');
INSERT INTO Rodzaj
    VALUES (0004, 'Relikty', 'Prastare stworzenia, obecnie wystepujace bardzo rzadko lub uznane za wymarle');
INSERT INTO Rodzaj
    VALUES (0005, 'Wampiry', 'Istoty zywiace sie ludzka krwia, przez wielu blednie uznawane za powstale z grobu zwloki');
--======================================================================================================================
CREATE TABLE Alchemia(
    IdAlchemia INT PRIMARY KEY
);

INSERT INTO Alchemia VALUES (0001);
INSERT INTO Alchemia VALUES (0002);
INSERT INTO Alchemia VALUES (0003);
INSERT INTO Alchemia VALUES (0004);
INSERT INTO Alchemia VALUES (0005);
--======================================================================================================================
CREATE TABLE Znaki(
    IdZnak INT PRIMARY KEY,
    Nazwa VARCHAR2(255) NOT NULL,
    Dzialanie VARCHAR2(255) NOT NULL
);

INSERT INTO Znaki
    VALUES (0001, 'Aard', 'Umiejetnosc generowania fali telekinetycznej');
INSERT INTO Znaki
    VALUES (0002, 'Aksji', 'Znak nastawiony na mieszanie w umyslach przeciwnikow');
INSERT INTO Znaki
    VALUES (0003, 'Igni', 'Znak pozwalajacy na rzucenie w strone przeciwnika ognistej wiazanki');
INSERT INTO Znaki
    VALUES (0004, 'Quen', 'Znak pozwalajacy na pokrycie wiedzmina bariera ochronna');
INSERT INTO Znaki
    VALUES (0005, 'Yrden', 'Znak pozwalajacy spowolnic lub unieruchomic przeciwnika');
--======================================================================================================================
CREATE TABLE Eliksiry(
    IdReceptEliksira INT PRIMARY KEY,
    Nazwa VARCHAR2(255) NOT NULL,
    Opis VARCHAR2(255)
);

INSERT INTO Eliksiry
    VALUES (0001, 'Jaskolka', 'Przyspiesza regeneracje zywotnosci');
INSERT INTO Eliksiry
    VALUES (0002, 'Kot', 'Umozliwia widzenie w calkowitej ciemnosci');
INSERT INTO Eliksiry
    VALUES (0003, 'Czarna Krew', 'Wampiry i trupojady otrzymuja obrazenia, gdy zrania wiedzmina');
INSERT INTO Eliksiry
    VALUES (0004, 'Puszczyk', 'Przyspiesza regeneracje wytrzymaoci');
INSERT INTO Eliksiry
    VALUES (0005, 'Zamiec', 'Poprawia refleks, skraca czas reakcji');
--======================================================================================================================
CREATE TABLE Bomby(
    IdReceptBomby INT PRIMARY KEY,
    Nazwa VARCHAR2(255) NOT NULL,
    Opis VARCHAR2(255)
);

INSERT INTO Bomby
    VALUES (0001, 'Samum', 'Petarda, oglusza istoty');
INSERT INTO Bomby
    VALUES (0002, 'Smoczy Sen', 'Uwalnia oblok latwopalnego gazu');
INSERT INTO Bomby
    VALUES (0003, 'Kartacz', 'Wybucha i rani przeciwnika odlamkami');
--======================================================================================================================
CREATE TABLE Oleje(
    IdReceptOleje INT PRIMARY KEY,
    Nazwa VARCHAR2(255) NOT NULL,
    Opis VARCHAR2(255)
);

INSERT INTO Oleje
    VALUES (0001, 'Olej przeciw Trollom', NULL);
INSERT INTO Oleje
    VALUES (0002, 'Olej Przeciw Trupojadom', NULL);
INSERT INTO Oleje
    VALUES (0003, 'Olej Przeciw Wampirom', NULL);
INSERT INTO Oleje
    VALUES (0004, 'Olej Przeciw Upiorom', NULL);
INSERT INTO Oleje
    VALUES (0005, 'Olej Przeciw Reliktom', NULL);
--======================================================================================================================
CREATE TABLE Zlecenie(
    IdZlecenie INT PRIMARY KEY,
    Nazwa VARCHAR2(255) NOT NULL,
    Opis VARCHAR2(255),
    Oplata FLOAT NOT NULL,
    PierwszyWiedzmin INT CONSTRAINT zle_iw_fk REFERENCES Wiedzminy(IdWiedzmin) NOT NULL,
    DrugiWiedzmin INT CONSTRAINT zle_iw2_fk REFERENCES Wiedzminy(IdWiedzmin)
);

INSERT INTO Zlecenie
	VALUES(0001, 'Licho przy studni', NULL, 50, 1, NULL);
INSERT INTO Zlecenie
	VALUES(0002, 'Potwor z bagien', NULL, 200, 3, 1);
INSERT INTO Zlecenie
	VALUES(0003, 'Opiekun lasu', NULL, 650, 5, 1);
INSERT INTO Zlecenie
	VALUES(0004, 'Morskie diably', NULL, 140, 1, 4);
INSERT INTO Zlecenie
	VALUES(0005, 'Bestia z Hindarsfjall', NULL, 270, 2, 1);
--======================================================================================================================
CREATE TABLE Potwor(
    IdPotwor INT PRIMARY KEY,
    IdRodzaj INT CONSTRAINT pot_ir_fk REFERENCES Rodzaj(IdRodzaj),
    Nazwa VARCHAR2(255)
);

INSERT INTO Potwor
    VALUES (0001, 1, 'Poludnica');
INSERT INTO Potwor
    VALUES (0002, 4, 'Leszy');
INSERT INTO Potwor
    VALUES (0003, 3, 'Mglak');
INSERT INTO Potwor
    VALUES (0004, 3,'Baba Wodna');
INSERT INTO Potwor
    VALUES (0005, 3,'Utopiec');
INSERT INTO Potwor
    VALUES (0006, NULL, 'Nekker');
INSERT INTO Potwor
    VALUES (0007, 1, 'Polnocnica');
--======================================================================================================================
CREATE TABLE Taktyka(
  IdTaktyka INT PRIMARY KEY,
  IdAlchemia INT CONSTRAINT t_ia_fk REFERENCES Alchemia(IdAlchemia),
  IdRodzaj INT CONSTRAINT t_ib_fk REFERENCES Rodzaj(IdRodzaj)
);

INSERT INTO Taktyka
    VALUES (0001, 4, 1);
INSERT INTO Taktyka
    VALUES (0002, 2, 2);
INSERT INTO Taktyka
    VALUES (0003, 3, 3);
INSERT INTO Taktyka
    VALUES (0004, 5, 4);
INSERT INTO Taktyka
    VALUES (0005, 1, 5);
--======================================================================================================================
CREATE TABLE ZleceniaZlecenieDawcy(
    IdZlecenieDawca INT CONSTRAINT zzd_izd_fk REFERENCES ZlecenieDawca(IdZlecenieDawca),
    IdZlecenie INT CONSTRAINT zzd_iz_fk REFERENCES Zlecenie(IdZlecenie),
    PRIMARY KEY (IdZlecenieDawca, IdZlecenie)
);

INSERT INTO ZleceniaZlecenieDawcy
    VALUES (1, 1);
INSERT INTO ZleceniaZlecenieDawcy
    VALUES (2, 2);
INSERT INTO ZleceniaZlecenieDawcy
    VALUES (3, 3);
INSERT INTO ZleceniaZlecenieDawcy
    VALUES (5, 4);
INSERT INTO ZleceniaZlecenieDawcy
    VALUES (5, 5);
--======================================================================================================================
CREATE TABLE PotworyWZleceniu(
    IdZlecenie INT CONSTRAINT pwz_iz_fk REFERENCES Zlecenie(IdZlecenie),
    IdPotwor INT CONSTRAINT pwz_ip_fk REFERENCES Potwor(IdPotwor),
    PRIMARY KEY (IdZlecenie, IdPotwor)
);

INSERT INTO PotworyWZleceniu
    VALUES (1, 1);
INSERT INTO PotworyWZleceniu
    VALUES (2, 3);
INSERT INTO PotworyWZleceniu
    VALUES (3, 2);
INSERT INTO PotworyWZleceniu
    VALUES (4, 5);
INSERT INTO PotworyWZleceniu
    VALUES (4, 4);
INSERT INTO PotworyWZleceniu
    VALUES (5, 6);
--======================================================================================================================
CREATE TABLE MiejscowosciWZleceniu(
    IdZlecenie INT CONSTRAINT mwz_iz_fk REFERENCES Zlecenie(IdZlecenie),
    IdMiejscowosc INT CONSTRAINT mwz_im_fk REFERENCES Mejscowosc(IdMejscowosc),
    PRIMARY KEY (IdZlecenie, IdMiejscowosc)
);

INSERT INTO MiejscowosciWZleceniu
    VALUES (1, 1);
INSERT INTO MiejscowosciWZleceniu
    VALUES (2, 2);
INSERT INTO MiejscowosciWZleceniu
    VALUES (3, 3);
INSERT INTO MiejscowosciWZleceniu
    VALUES (4, 4);
INSERT INTO MiejscowosciWZleceniu
    VALUES (5, 4);
INSERT INTO MiejscowosciWZleceniu
    VALUES (5, 2);
--======================================================================================================================
CREATE TABLE ZnakiWTatktyce(
    IdTaktyka INT CONSTRAINT zwt_it_fk REFERENCES Taktyka(IdTaktyka),
    IdZnak INT CONSTRAINT zwt_iz_fk REFERENCES Znaki(IdZnak),
    PRIMARY KEY (IdTaktyka, IdZnak)
);

INSERT INTO ZnakiWTatktyce
    VALUES (1, 4);
INSERT INTO ZnakiWTatktyce
    VALUES (2, 4);
INSERT INTO ZnakiWTatktyce
    VALUES (3, 4);
INSERT INTO ZnakiWTatktyce
    VALUES (4, 4);
INSERT INTO ZnakiWTatktyce
    VALUES (5, 4);
INSERT INTO ZnakiWTatktyce
    VALUES (1, 5);
INSERT INTO ZnakiWTatktyce
    VALUES (2, 3);
INSERT INTO ZnakiWTatktyce
    VALUES (4, 1);
INSERT INTO ZnakiWTatktyce
    VALUES (5, 1);
INSERT INTO ZnakiWTatktyce
    VALUES (3, 5);
--======================================================================================================================
CREATE TABLE BombyWAlchemij(
    IdAlchemia INT CONSTRAINT bwa_ia_fk REFERENCES Alchemia(IdAlchemia),
    IdReceptBomby INT CONSTRAINT bwa_irb_fk REFERENCES Bomby(IdReceptBomby),
    PRIMARY KEY (IdReceptBomby, IdAlchemia)
);

INSERT INTO BombyWAlchemij
    VALUES (1, 3);
INSERT INTO BombyWAlchemij
    VALUES (2, 3);
INSERT INTO BombyWAlchemij
    VALUES (3, 3);
INSERT INTO BombyWAlchemij
    VALUES (4, 3);
INSERT INTO BombyWAlchemij
    VALUES (5, 3);
INSERT INTO BombyWAlchemij
    VALUES (1, 2);
INSERT INTO BombyWAlchemij
    VALUES (2, 1);
INSERT INTO BombyWAlchemij
    VALUES (4, 1);
INSERT INTO BombyWAlchemij
    VALUES (5, 2);
INSERT INTO BombyWAlchemij
    VALUES (3, 2);
--======================================================================================================================
CREATE TABLE OlejeWAchemij(
    IdAlchemia INT CONSTRAINT owa_ia_fk REFERENCES Alchemia(IdAlchemia),
    IdReceptOleje INT CONSTRAINT owa_iro_fk REFERENCES Oleje(IdReceptOleje),
    PRIMARY KEY (IdAlchemia, IdReceptOleje)
);

INSERT INTO OlejeWAchemij
    VALUES (1, 4);
INSERT INTO OlejeWAchemij
    VALUES (2, 2);
INSERT INTO OlejeWAchemij
    VALUES (3, 5);
INSERT INTO OlejeWAchemij
    VALUES (4, 2);
INSERT INTO OlejeWAchemij
    VALUES (5, 2);
INSERT INTO OlejeWAchemij
    VALUES (5, 4);
--======================================================================================================================
CREATE TABLE EliksiryWAlchemij(
    IdAlchemia INT CONSTRAINT ewa_ia_fk REFERENCES Alchemia(IdAlchemia),
    IdReceptEleksira INT CONSTRAINT ewa_ide_fk REFERENCES Eliksiry(IdReceptEliksira),
    PRIMARY KEY (IdAlchemia, IdReceptEleksira)
);

INSERT INTO EliksiryWAlchemij
    VALUES (1, 4);
INSERT INTO EliksiryWAlchemij
    VALUES (2, 4);
INSERT INTO EliksiryWAlchemij
    VALUES (3, 4);
INSERT INTO EliksiryWAlchemij
    VALUES (4, 4);
INSERT INTO EliksiryWAlchemij
    VALUES (5, 4);
INSERT INTO EliksiryWAlchemij
    VALUES (1, 5);
INSERT INTO EliksiryWAlchemij
    VALUES (2, 3);
INSERT INTO EliksiryWAlchemij
    VALUES (4, 1);
INSERT INTO EliksiryWAlchemij
    VALUES (5, 1);
INSERT INTO EliksiryWAlchemij
    VALUES (3, 5);