--SQL � proste zapytania

--1.	Wybierz numery departament�w, nazwiska pracownik�w oraz numery pracownicze ich szef�w z tabeli EMP.
SELECT e.DEPTNO, e.ENAME, e.MGR FROM Emp e;
--2.	Wybierz wszystkie kolumny z tabeli EMP.
SELECT * FROM Emp;
--3.	Wylicz roczn� pensj� podstawow� dla ka�dego pracownika.
SELECT e.ename, e.sal*12 FROM Emp e;
--4.	Wylicz roczn� pensj� podstawow� dla ka�dego pracownika gdyby ka�demu da� podwy�k� o 250.
SELECT ename,(sal+250)*12 FROM emp;
--5.	Wybrane wyra�enie SAL*12 zaetykietuj nag��wkiem ROCZNA
SELECT ename,sal*12 "ROCZNA"  FROM emp;
--6.	Wybrane wyra�enie SAL*12 zaetykietuj nag��wkiem R PENSJA.
SELECT ename,sal*12 "R PENSJA"  FROM emp;
--7.	Po��cz EMPNO i nazwisko, opatrz je nag��wkiem EMPLOYEE.
SELECT (empno ||' '|| ename) "EMPLOYEE" From emp;
--8.	Utw�rz zapytanie zwracaj�ce wynik w postaci np. �Kowalski pracuje w dziale 20�.
SELECT ename FROM emp Where deptno = 20;
--9.	Wylicz roczn� pensj� ca�kowit� dla ka�dego pracownika (z uwzgl�dnieniem prowizji).
SELECT ename, 12*Sal + NVL(Comm, 0)	"Roczne zarobki" From emp;
--10.	Wy�wietl wszystkie numery departament�w wyst�puj�ce w tabeli EMP.
SELECT deptno FROM emp;
--11.	Wy�wietl wszystkie r�ne numery departament�w wyst�puj�ce w tabeli EMP.
SELECT DISTINCT deptno From emp;
--12.	Wybierz wszystkie wzajemnie r�ne kombinacje warto�ci DEPTNO i JOB.
SELECT DISTINCT deptno, job FROM emp;
--13.	Posortuj wszystkie dane tabeli EMP wed�ug ENAME.
SELECT * FROM emp ORDER BY ename;
--14.	Posortuj malej�co wszystkie dane tabeli EMP wed�ug daty ich zatrudnienia pocz�wszy od ostatnio zatrudnionych.
SELECT * FROM emp ORDER BY hiredate DESC;
--15.	Posortuj dane tabeli EMP wed�ug wzrastaj�cych warto�ci kolumn DEPTNO oraz malej�cych warto�ci kolumny SAL (bez wypisywania kolumny SAL).
SELECT deptno FROM emp ORDER by DEPTNO, SAL DESC;
--16.	Wybierz nazwiska, numery, stanowiska pracy i numery departament�w wszystkich pracownik�w zatrudnionych na stanowisku CLERK.
SELECT ename, empno, job, deptno FROM EMP WHERE JOB = 'CLERK';
--17.	Wybierz  wszystkie nazwy i numery departament�w wi�ksze od nr 20
SELECT deptno, dname FROM dept WHERE deptno > 20;
--18.	Wybierz pracownik�w, kt�rych prowizja przekracza miesi�czn� pensj�.
SELECT * FROM emp WHERE sal < NVL(Comm, 0);
--19.	Wybierz dane tych pracownik�w, kt�rych zarobki mieszcz� si� pomi�dzy 1000 a 2000.
SELECT * FROM emp WHERE sal > 1000 and sal < 2000;
--20.	Wybierz dane pracownik�w, kt�rych bezpo�rednimi szefami  s� 7902,7566 lub 7788.
SELECT * FROM emp WHERE MGR = 7902 or MGR = 7556 or MGR = 7788;
--21.	Wybierz dane tych pracownik�w, kt�rych nazwiska zaczynaj� si� na S.
SELECT * FROM emp WHERE ename LIKE 'S%';
--22.	Wybierz dane tych pracownik�w, kt�rych nazwiska s� czteroliterowe.
SELECT * from EMP WHERE ename LIKE '____';
--23.	Wybierz dane tych pracownik�w, kt�rzy nie posiadaj� szefa.
SELECT * FROM EMP WHERE mgr is null;
--24.	Wybierz dane tych pracownik�w, kt�rych zarobki s� poza przedzia�em <1000,2000>.
SELECT * FROM emp WHERE sal < 1000 or sal > 2000;
--25.	Wybierz dane tych pracownik�w, kt�rych nazwiska nie zaczynaj� si� na M.
SELECT * FROM emp WHERE ename  NOT LIKE 'M%';
--26.	Wybierz dane tych pracownik�w, kt�rzy maj� szefa.
SELECT *  FROM EMP WHERE NOT (MGR is null);
--27.	Wybierz dane tych pracownik�w zatrudnionych na stanowisku CLERK kt�rych zarobki SAL mieszcz� si� w przedziale <1000.2000).
SELECT * FROM EMP WHERE JOB = 'CLERK' AND (SAL between 1000 and 2000);
--28.	Wybierz dane pracownik�w zatrudnionych na stanowisku CLERK albo takich, kt�rych zarobki SAL mieszcz� si� w przedziale <1000.2000).
SELECT * FROM EMP WHERE JOB = 'CLERK' or (SAL between 1000 and 2000);
--29.	Wybierz wszystkich pracownik�w zatrudnionych na stanowisku MANAGER z pensj� powy�ej 1500 oraz wszystkich pracownik�w na stanowisku  SALESMAN, niezale�nie od pensji.
SELECT * FROM EMP WHERE (JOB = 'MANAGER' and (SAL > 1500)) or JOB = 'SALESMAN';
--30.	Wybierz wszystkich pracownik�w zatrudnionych na stanowisku MANAGER lub na stanowisku SALESMAN lecz zarabiaj�cych powy�ej 1500.
SELECT * FROM EMP WHERE (JOB = 'SALESMAN' and (SAL > 1500)) or JOB = 'MANAGER';
--31.	Wybierz wszystkich pracownik�w zatrudnionych na stanowisku MANAGER ze wszystkich departament�w wraz ze wszystkimi pracownikami zatrudnionymi na stanowisku CLERK w departamencie 10.
SELECT * FROM EMP WHERE (JOB = 'CLERK' and DEPTNO = 10) or JOB = 'MANAGER';
--32.	Wybierz wszystkie dane z tabeli SALGRADE.
SELECT * FROM SALGRADE;
--33.	Wybierz wszystkie dane z tabeli DEPT.
SELECT * FROM DEPT;
--34.	Wybierz numery i nazwy departament�w sortuj�c wed�ug numer�w departament�w.
SELECT deptno, dname FROM DEPT ORDER BY DEPTNO;
--35.	Wybierz wszystkie wzajemnie r�ne stanowiska pracy.
SELECT DISTINCT job FROM emp;
--36.	Wybierz dane pracownik�w zatrudnionych w departamentach 10 i 20 we kolejno�ci alfabetycznej ich nazwisk.
SELECT * FROM emp WHERE DEPTNO = 10 or DEPTNO = 20 ORDER BY ename;
--37.	Wybierz nazwiska pracownik�w, w kt�rych nazwisku wyst�puje ci�g �TH� lub �LL�.
SELECT * FROM emp WHERE ename LIKE '%TH%' OR ename LIKE '%LL%';
--38.	Wybierz ENAME, DEPTNO i HIREDATE  tych pracownik�w, kt�rzy zostali zatrudnieni w 1980 r.
SELECT ename, deptno, hiredate FROM emp WHERE hiredate LIKE '1980%';
--39.	Wybierz nazwiska, roczn� pensj� oraz prowizj� tych wszystkich sprzedawc�w, kt�rych miesi�czna pensja przekracza prowizj�. Wyniki posortuj wed�ug malej�cych zarobk�w, potem nazwisk.
SELECT ename, sal*12 ROCZNA, COMM FROM EMP WHERE NVL(Comm, 0) < Sal Order By SAL DESC, ENAME;

