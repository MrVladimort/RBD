--1.	Wybierz numery departament�w, nazwiska pracownik�w oraz numery pracownicze ich szef�w z tabeli EMP.
  SELECT e.deptno, e.ename, e.mgr
  FROM emp e;
--2.	Wybierz wszystkie kolumny z tabeli EMP.
  SELECT *
  FROM emp;
--3.	Wylicz roczn� pensj� podstawow� dla ka�dego pracownika.
  SELECT 12*sal
  from emp;
--4.	Wylicz roczn� pensj� podstawow� dla ka�dego pracownika gdyby ka�demu da� podwy�k� o 250.
  SELECT 12*(sal+250)
  from emp;
--5.	Wybrane wyra�enie SAL*12 zaetykietuj nag��wkiem ROCZNA.
  SELECT 12*sal ROCZNA
  from emp;
--6.	Wybrane wyra�enie SAL*12 zaetykietuj nag��wkiem R PENSJA.
  SELECT 12*sal "R PENSJA"
  from emp;
--7.	Po��cz EMPNO i nazwisko, opatrz je nag��wkiem EMPLOYEE.
  SELECT empno || ' ' || ename employee
  from emp;
--8.	Utw�rz zapytanie zwracaj�ce wynik w postaci np. �Kowalski pracuje w dziale 20�.
  SELECT ename || ' pracuje w dziale ' || deptno
  from emp;
--9.	Wylicz roczn� pensj� ca�kowit� dla ka�dego pracownika (z uwzgl�dnieniem prowizji).
  SELECT ename, 12*sal+NVL(comm,0) ROCZNE
  from emp;
--10.	Wy�wietl wszystkie numery departament�w wyst�puj�ce w tabeli EMP.
  SELECT deptno
  from emp;
--11.	Wy�wietl wszystkie r�ne numery departament�w wyst�puj�ce w tabeli EMP.
  SELECT DISTINCT deptno
  from emp;
--12.	Wybierz wszystkie wzajemnie r�ne kombinacje warto�ci DEPTNO i JOB.
  SELECT DISTINCT deptno, job
  from emp;
--13.	Posortuj wszystkie dane tabeli EMP wed�ug ENAME.
  SELECT *
  FROM EMP
  ORDER BY ENAME;
--14.	Posortuj malej�co wszystkie dane tabeli EMP wed�ug daty ich zatrudnienia pocz�wszy od ostatnio zatrudnionych.
  SELECT *
  FROM EMP
  ORDER BY HIREDATE DESC;
--15.	Posortuj dane tabeli EMP wed�ug wzrastaj�cych warto�ci kolumn DEPTNO oraz malej�cych warto�ci kolumny SAL (bez wypisywania kolumny SAL).
  SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, COMM, DEPTNO 
  FROM EMP
  ORDER BY DEPTNO, SAL DESC;
--16.	Wybierz nazwiska, numery, stanowiska pracy i numery departament�w wszystkich pracownik�w zatrudnionych na stanowisku CLERK.
 SELECT EMPNO, ENAME, JOB, DEPTNO 
  FROM EMP
  WHERE JOB = 'CLERK';
--17.	Wybierz  wszystkie nazwy i numery departament�w wi�ksze od nr 20.
  SELECT d.DEPTNO, d.DNAME
  FROM DEPT d
  WHERE d.DEPTNO>20;
--18.	Wybierz pracownik�w, kt�rych prowizja przekracza miesi�czn� pensj�.
  SELECT *
  FROM EMP
  WHERE COMM > SAL;
--19.	Wybierz dane tych pracownik�w, kt�rych zarobki mieszcz� si� pomi�dzy 1000 a 2000.
  SELECT *
  FROM EMP
  WHERE SAL BETWEEN 1000 AND 2000;
--20.	Wybierz dane pracownik�w, kt�rych bezpo�rednimi szefami  s� 7902,7566 lub 7788.
  SELECT *
  FROM EMP
  WHERE MGR = 7902 OR MGR =7566 OR MGR =7788;
--21.	Wybierz dane tych pracownik�w, kt�rych nazwiska zaczynaj� si� na S.
  SELECT *
  FROM EMP
  WHERE ENAME LIKE 'S%';
--22.	Wybierz dane tych pracownik�w, kt�rych nazwiska s� czteroliterowe.
  SELECT *
  FROM EMP
  WHERE ENAME LIKE '____';
--23.	Wybierz dane tych pracownik�w, kt�rzy nie posiadaj� szefa.
  SELECT *
  FROM EMP
  WHERE MGR IS NULL;
--24.	Wybierz dane tych pracownik�w, kt�rych zarobki s� poza przedzia�em <1000,2000>.
  SELECT *
  FROM EMP
  WHERE NOT(SAL BETWEEN 1000 AND 2000);
--25.	Wybierz dane tych pracownik�w, kt�rych nazwiska nie zaczynaj� si� na M.
  SELECT *
  FROM EMP
  WHERE NOT(ENAME LIKE 'N%');
--26.	Wybierz dane tych pracownik�w, kt�rzy maj� szefa.
  SELECT *
  FROM EMP
  WHERE NOT(MGR IS NULL);
--27.	Wybierz dane tych pracownik�w zatrudnionych na stanowisku CLERK kt�rych zarobki SAL mieszcz� si� w przedziale <1000.2000>).
  SELECT *
  FROM EMP
  WHERE JOB = 'CLERK' AND (SAL BETWEEN 1000 AND 2000);
--28.	Wybierz dane pracownik�w zatrudnionych na stanowisku CLERK albo takich, kt�rych zarobki SAL mieszcz� si� w przedziale <1000.2000).
  SELECT *
  FROM EMP
  WHERE JOB = 'CLERK' OR (SAL BETWEEN 1000 AND 2000);
--29.	Wybierz wszystkich pracownik�w zatrudnionych na stanowisku MANAGER z pensj� powy�ej 1500 oraz wszystkich pracownik�w na stanowisku  SALESMAN, niezale�nie od pensji.
  SELECT *
  FROM EMP
  WHERE JOB = 'MANAGER' AND SAL>1500 OR JOB = 'SALESMAN';
--30.	Wybierz wszystkich pracownik�w zatrudnionych na stanowisku MANAGER lub na stanowisku SALESMAN lecz zarabiaj�cych powy�ej 1500.
  SELECT *
  FROM EMP
  WHERE JOB = 'MANAGER' OR SAL>1500 AND JOB = 'SALESMAN';
--31.	Wybierz wszystkich pracownik�w zatrudnionych na stanowisku MANAGER ze wszystkich departament�w wraz ze wszystkimi pracownikami zatrudnionymi na stanowisku CLERK w departamencie 10.
  SELECT *
  FROM EMP
  WHERE JOB = 'MANAGER' OR DEPTNO = 10 AND JOB = 'CLERK';
--32.	Wybierz wszystkie dane z tabeli SALGRADE.
  SELECT *
  FROM SALGRADE;
--33.	Wybierz wszystkie dane z tabeli DEPT.
  SELECT *
  FROM DEPT;
--34.	Wybierz numery i nazwy departament�w sortuj�c wed�ug numer�w departament�w.
  SELECT *
  FROM DEPT
  ORDER BY DEPTNO;
--35.	Wybierz wszystkie wzajemnie r�ne stanowiska pracy.
  SELECT DISTINCT JOB
  FROM EMP;
--36.	Wybierz dane pracownik�w zatrudnionych w departamentach 10 i 20 we kolejno�ci alfabetycznej ich nazwisk.
  SELECT *
  FROM EMP
  WHERE DEPTNO = 10 OR DEPTNO = 20
  ORDER BY ENAME;
--37.	Wybierz nazwiska pracownik�w, w kt�rych nazwisku wyst�puje ci�g �TH� lub �LL�.
  SELECT *
  FROM EMP
  WHERE ENAME LIKE '%TH%' OR ENAME LIKE '%LL%';
--38.	Wybierz ENAME, DEPTNO i HIREDATE  tych pracownik�w, kt�rzy zostali zatrudnieni w 1980 r.
  SELECT ENAME, DEPTNO, HIREDATE
  FROM EMP
  WHERE HIREDATE LIKE '1980%';
--39.	Wybierz nazwiska, roczn� pensj� oraz prowizj� tych wszystkich sprzedawc�w, kt�rych miesi�czna pensja przekracza prowizj�. Wyniki posortuj wed�ug malej�cych zarobk�w, potem nazwisk.
  SELECT ENAME, 12*SAL ROCZNA, COMM
  FROM EMP
  WHERE NVL(COMM,0) < SAL
  ORDER BY SAL DESC, ENAME;
