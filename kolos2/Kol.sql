--1.
select imie, nazwisko, nr_indeksu, rok
from student 
where rok = 3;
--2.
Select p.nazwa, o.ocena
from przedmiot p
left join ocena o on p.skrot=o.skrot;
--3.
SELECT AVG(Ocena), rok
from student 
inner join Ocena on student.NR_INDEKSU = Ocena.NR_INDEKSU
where skrot='SBD'
GROUP BY rok;
--4.
SELECT student.NR_INDEKSU, AVG(Ocena) "Srednia"
from student 
inner join Ocena on student.NR_INDEKSU = Ocena.NR_INDEKSU
where rok > 1
group by student.NR_INDEKSU
having AVG(Ocena)>3;
--
select student.nr_indeksu, avg(ocena.ocena)
from student inner join ocena on ocena.nr_indeksu = student.nr_indeksu
group by student.nr_indeksu
having avg(ocena.ocena) = (select max(avg_ocena)
from (select avg(ocena.ocena) as avg_ocena
from student inner join ocena on ocena.nr_indeksu = student.nr_indeksu
where rok = 2
group by student.nr_indeksu))
;

--
--5.
SELECT student.NR_INDEKSU
from student 
inner join Ocena on student.NR_INDEKSU = Ocena.NR_INDEKSU
where ocena.skrot = 'SBD' and
Ocena.OCENA <= (Select min(ocena)
                from ocena
                where ocena.SKROT='SBD');
--6.
select st.imie || ' ' || st.nazwisko "Imie i nazwisko"
from student st
where rok = 1
and not exists (select 'x' 
            from ocena
            where ocena.NR_INDEKSU=st.NR_INDEKSU);
--7.
DELETE FROM OCENY WHERE IDSTUDENT = (SELECT IDSTUDENT from Student where IMIE = 'Jan' and NAZWISKO = 'Nowak');
DELETE from Student where IMIE = 'Jan' and NAZWISKO = 'Nowak';
--8.
INSERT
INTO Przedmiot (Skrot, Nazwa)
VALUES ('MAT', 'MATEMATYKA');
INSERT
INTO Student (Nr_Indeksu, Imie, Nazwisko, Rok)
VALUES (5432, 'Jan', 'Nowacki', 3);
INSERT
INTO OCENA (SKROT, NR_Indeksu, Data, Ocena)
VALUES ('MAT', 5432, CURRENT_DATE, 5);
--9.
SELECt student.imie || ' ' || student.nazwisko "Imie i nazwisko", przedmiot.nazwa || ' zaliczone' "Zaliczenia"
from student
inner join Ocena on student.NR_INDEKSU = Ocena.NR_INDEKSU
inner join przedmiot on ocena.skrot=przedmiot.SKROT
where ocena.ocena>=3;
--10.
SELECT student.imie || ' ' || student.nazwisko "Imie i nazwisko"
from student
inner join Ocena on student.NR_INDEKSU = Ocena.NR_INDEKSU
inner join przedmiot on ocena.skrot=przedmiot.SKROT
where rok = 1
and ocena.skrot = 'SKJ'
union
SELECT student.imie || ' ' || student.nazwisko "Imie i nazwisko"
from student
inner join Ocena on student.NR_INDEKSU = Ocena.NR_INDEKSU
inner join przedmiot on ocena.skrot=przedmiot.SKROT
where rok = 1
and przedmiot.nazwa = 'Filozofia';


----------1.
SELECT o.Nr_indeksu, o.skrot, o.data 
FROM OCENA o
where o.skrot!='SBD'
and data < to_date('2014-01-01', 'YYYY-MM-DD');

---------2.
SELECT o.Nr_indeksu, o.skrot, o.data 
FROM OCENA o
where o.skrot='SBD'
UNION
SELECT o.Nr_indeksu, o.skrot, o.data 
FROM OCENA o
where o.skrot='RBD';

----------3.
SELECT ocena.Nr_Indeksu, avg(ocena) imie, nazwisko
from student
inner join ocena on ocena.nr_indeksu=student.nr_indeksu
group by ocena.Nr_Indeksu, imie, nazwisko;

--------4.
SELECT o.SKROT, count(*) 
FROM OCENA o
group by o.skrot
having count(*)>1;

--------5.
select student.nr_indeksu, avg(ocena.ocena)
from student inner join ocena on ocena.nr_indeksu = student.nr_indeksu
group by student.nr_indeksu
having avg(ocena.ocena) = (select max(avg_ocena)
from (select avg(ocena.ocena) as avg_ocena
from student inner join ocena on ocena.nr_indeksu = student.nr_indeksu
where rok = 2
group by student.nr_indeksu));


-------7.
UPDATE OCENA SET DATA=SYSDATE
WHERE skrot='AUG' 
and nr_indeksu = (select st.nr_indeksu from student st where st.imie='Anna' and st.nazwisko='Nowak');

--------8.
DELETE FROM OCENA WHERE SKROT=(SELECT SKROT FROM PRZEDMIOT WHERE NAZWA = 'Bazy danych');
DELETE FROM PRZEDMIOT WHERE NAZWA = 'Bazy danych';

----------9.
SELECT ST.NR_INDEKSU
FROM STUDENT ST
WHERE NOT EXISTS (select 'x' 
            from ocena
            where ocena.NR_INDEKSU=st.NR_INDEKSU
            and ocena.skrot=(SELECT SKROT FROM PRZEDMIOT WHERE NAZWA = 'Algebra'));
            
-----------10.
SELECT  DISTINCT ST.Imie || ' ' || ST.Nazwisko, PR.NAZWA
FROM STUDENT ST 
INNER JOIN OCENA OC ON ST.NR_INDEKSU = OC.NR_INDEKSU
INNER JOIN PRZEDMIOT PR ON PR.SKROT=OC.SKROT
WHERE PR.SKROT in (SELECT O.SKROT FROM OCENA O INNER JOIN STUDENT STU ON STU.NR_INDEKSU=O.NR_INDEKSU WHERE ST.NR_INDEKSU=STU.NR_INDEKSU);
--WHERE  IN (SELECT DISTINCT STU.NR_INDEKSU FROM OCENA O INNER JOIN STUDENT STU ON STU.NR_INDEKSU=O.NR_INDEKSU);