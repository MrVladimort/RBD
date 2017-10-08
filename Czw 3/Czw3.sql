--SQL – proste zapytania

--1.	Wybierz numery departamentów, nazwiska pracowników oraz numery pracownicze ich szefów z tabeli EMP.
SELECT e.DEPTNO, e.ENAME, e.MGR FROM Emp e;
--2.	Wybierz wszystkie kolumny z tabeli EMP.
SELECT * FROM Emp;
--3.	Wylicz roczn¹ pensjê podstawow¹ dla ka¿dego pracownika.
SELECT e.ename, e.sal*12 FROM Emp e;
--4.	Wylicz roczn¹ pensjê podstawow¹ dla ka¿dego pracownika gdyby ka¿demu daæ podwy¿kê o 250.
SELECT ename,(sal+250)*12 FROM emp;
--5.	Wybrane wyra¿enie SAL*12 zaetykietuj nag³ówkiem ROCZNA
SELECT ename,sal*12 "ROCZNA"  FROM emp;
--6.	Wybrane wyra¿enie SAL*12 zaetykietuj nag³ówkiem R PENSJA.
SELECT ename,sal*12 "R PENSJA"  FROM emp;
--7.	Po³¹cz EMPNO i nazwisko, opatrz je nag³ówkiem EMPLOYEE.
SELECT (empno ||' '|| ename) "EMPLOYEE" From emp;
--8.	Utwórz zapytanie zwracaj¹ce wynik w postaci np. „Kowalski pracuje w dziale 20”.
SELECT ename FROM emp Where deptno = 20;
--9.	Wylicz roczn¹ pensjê ca³kowit¹ dla ka¿dego pracownika (z uwzglêdnieniem prowizji).
SELECT ename, 12*Sal + NVL(Comm, 0)	"Roczne zarobki" From emp;
--10.	Wyœwietl wszystkie numery departamentów wystêpuj¹ce w tabeli EMP.
SELECT deptno FROM emp;
--11.	Wyœwietl wszystkie ró¿ne numery departamentów wystêpuj¹ce w tabeli EMP.
SELECT DISTINCT deptno From emp;
--12.	Wybierz wszystkie wzajemnie ró¿ne kombinacje wartoœci DEPTNO i JOB.
SELECT DISTINCT deptno, job FROM emp;
--13.	Posortuj wszystkie dane tabeli EMP wed³ug ENAME.
SELECT * FROM emp ORDER BY ename;
--14.	Posortuj malej¹co wszystkie dane tabeli EMP wed³ug daty ich zatrudnienia pocz¹wszy od ostatnio zatrudnionych.
SELECT * FROM emp ORDER BY hiredate DESC;
--15.	Posortuj dane tabeli EMP wed³ug wzrastaj¹cych wartoœci kolumn DEPTNO oraz malej¹cych wartoœci kolumny SAL (bez wypisywania kolumny SAL).
SELECT deptno FROM emp ORDER by DEPTNO, SAL DESC;
--16.	Wybierz nazwiska, numery, stanowiska pracy i numery departamentów wszystkich pracowników zatrudnionych na stanowisku CLERK.
SELECT ename, empno, job, deptno FROM EMP WHERE JOB = 'CLERK';
--17.	Wybierz  wszystkie nazwy i numery departamentów wiêksze od nr 20
SELECT deptno, dname FROM dept WHERE deptno > 20;
--18.	Wybierz pracowników, których prowizja przekracza miesiêczn¹ pensjê.
SELECT * FROM emp WHERE sal < NVL(Comm, 0);
--19.	Wybierz dane tych pracowników, których zarobki mieszcz¹ siê pomiêdzy 1000 a 2000.
SELECT * FROM emp WHERE sal > 1000 and sal < 2000;
--20.	Wybierz dane pracowników, których bezpoœrednimi szefami  s¹ 7902,7566 lub 7788.
SELECT * FROM emp WHERE MGR = 7902 or MGR = 7556 or MGR = 7788;
--21.	Wybierz dane tych pracowników, których nazwiska zaczynaj¹ siê na S.
SELECT * FROM emp WHERE ename LIKE 'S%';
--22.	Wybierz dane tych pracowników, których nazwiska s¹ czteroliterowe.
SELECT * from EMP WHERE ename LIKE '____';
--23.	Wybierz dane tych pracowników, którzy nie posiadaj¹ szefa.
SELECT * FROM EMP WHERE mgr is null;
--24.	Wybierz dane tych pracowników, których zarobki s¹ poza przedzia³em <1000,2000>.
SELECT * FROM emp WHERE sal < 1000 or sal > 2000;
--25.	Wybierz dane tych pracowników, których nazwiska nie zaczynaj¹ siê na M.
SELECT * FROM emp WHERE ename  NOT LIKE 'M%';
--26.	Wybierz dane tych pracowników, którzy maj¹ szefa.
SELECT *  FROM EMP WHERE NOT (MGR is null);
--27.	Wybierz dane tych pracowników zatrudnionych na stanowisku CLERK których zarobki SAL mieszcz¹ siê w przedziale <1000.2000).
SELECT * FROM EMP WHERE JOB = 'CLERK' AND (SAL between 1000 and 2000);
--28.	Wybierz dane pracowników zatrudnionych na stanowisku CLERK albo takich, których zarobki SAL mieszcz¹ siê w przedziale <1000.2000).
SELECT * FROM EMP WHERE JOB = 'CLERK' or (SAL between 1000 and 2000);
--29.	Wybierz wszystkich pracowników zatrudnionych na stanowisku MANAGER z pensj¹ powy¿ej 1500 oraz wszystkich pracowników na stanowisku  SALESMAN, niezale¿nie od pensji.
SELECT * FROM EMP WHERE (JOB = 'MANAGER' and (SAL > 1500)) or JOB = 'SALESMAN';
--30.	Wybierz wszystkich pracowników zatrudnionych na stanowisku MANAGER lub na stanowisku SALESMAN lecz zarabiaj¹cych powy¿ej 1500.
SELECT * FROM EMP WHERE (JOB = 'SALESMAN' and (SAL > 1500)) or JOB = 'MANAGER';
--31.	Wybierz wszystkich pracowników zatrudnionych na stanowisku MANAGER ze wszystkich departamentów wraz ze wszystkimi pracownikami zatrudnionymi na stanowisku CLERK w departamencie 10.
SELECT * FROM EMP WHERE (JOB = 'CLERK' and DEPTNO = 10) or JOB = 'MANAGER';
--32.	Wybierz wszystkie dane z tabeli SALGRADE.
SELECT * FROM SALGRADE;
--33.	Wybierz wszystkie dane z tabeli DEPT.
SELECT * FROM DEPT;
--34.	Wybierz numery i nazwy departamentów sortuj¹c wed³ug numerów departamentów.
SELECT deptno, dname FROM DEPT ORDER BY DEPTNO;
--35.	Wybierz wszystkie wzajemnie ró¿ne stanowiska pracy.
SELECT DISTINCT job FROM emp;
--36.	Wybierz dane pracowników zatrudnionych w departamentach 10 i 20 we kolejnoœci alfabetycznej ich nazwisk.
SELECT * FROM emp WHERE DEPTNO = 10 or DEPTNO = 20 ORDER BY ename;
--37.	Wybierz nazwiska pracowników, w których nazwisku wystêpuje ci¹g „TH” lub „LL”.
SELECT * FROM emp WHERE ename LIKE '%TH%' OR ename LIKE '%LL%';
--38.	Wybierz ENAME, DEPTNO i HIREDATE  tych pracowników, którzy zostali zatrudnieni w 1980 r.
SELECT ename, deptno, hiredate FROM emp WHERE hiredate LIKE '1980%';
--39.	Wybierz nazwiska, roczn¹ pensjê oraz prowizjê tych wszystkich sprzedawców, których miesiêczna pensja przekracza prowizjê. Wyniki posortuj wed³ug malej¹cych zarobków, potem nazwisk.
SELECT ename, sal*12 ROCZNA, COMM FROM EMP WHERE NVL(Comm, 0) < Sal Order By SAL DESC, ENAME;

