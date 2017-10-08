SELECT *
FRom emp;
--1. Wypisz wszystkie dane z tabel EMP i DEPT.
  SELECT *
  FROM emp, dept
  WHERE emp.deptno = dept.deptno;
--2. Wybierz nazwiska wszystkich pracownik?w, oraz nazwy departament?w w kt?rych s? zatrudnieni. Zwracane rekordy
--posortuj w kolejno?ci alfabetycznej nazwisk.
  SELECT ename, dname
  FROM emp, dept
  WHERE emp.deptno = dept.deptno
  ORDER BY ename;
--3. Wybierz nazwiska wszystkich pracownik?w, wraz z numerami, nazwami i lokalizacjami departament?w, w kt?rych s?
--oni zatrudnieni.
  SELECT empno, ename, dname, emp.deptno, loc
  FROM emp Inner Join dept on emp.deptno = dept.deptno;
--4. Dla pracownik?w o miesi?cznej pensji powy?ej 1500 podaj ich nazwiska, miejsca usytuowania ich departament?w,
--oraz nazwy tych departament?w.
  SELECT empno, ename, dname, loc
  FROM emp Inner Join dept on emp.deptno = dept.deptno
  WHERE sal>1500;
--5. Utw?rz list? pracownik?w podaj?c ich nazwisko, zaw?d, pensj? i stopie? zaszeregowania (grup? zarobkow?).
  SELECT empno, ename, sal, grade
  FROM emp inner join salgrade on emp.sal between salgrade.losal and salgrade.hisal;
--6. Wypisz informacje o pracownikach, kt?rych zarobki odpowiadaj? 3 klasie zarobkowej.
  SELECT empno, ename, sal, grade
  FROM emp inner join salgrade on emp.sal between salgrade.losal and salgrade.hisal
  WHERE grade = 3;
--7. Wybierz pracownik?w zatrudnionych w DALLAS.
  SELECT ename, loc
  FROM emp Inner Join dept on emp.deptno = dept.deptno
  WHERE loc = 'DALLAS';
--8. Wybierz pracownik?w z dzia?u 30 i 40 (nazwisko, nr. dzia?u, nazwa dzia?u, lokalizacja). Wypisz r?wnie? dane dzia?u,
--40 w kt?rym niema pracownik?w.
  SELECT ename, dept.deptno, loc
  FROM emp Right Join dept on emp.deptno = dept.deptno
  WHERE dept.deptno = 30 or dept.deptno = 40;
--9. Wypisz nazwisko, nazw? i lokalizacje dzia?u wszystkich pracownik?w. Uwzgl?dnij tak?e tych pracownik?w, kt?rzy
--nie s? przypisani do ?adnego dzia?u.
  SELECT ename, emp.deptno, loc
  FROM emp Left Join dept on emp.deptno = dept.deptno;
--10. Wypisz nazwiska wszystkich pracownik?w oraz nazwy wszystkich dzia??w. W wyniku maja pojawi? si? nazwiska
--pracownik?w nie przypisanych do ?adnych dzia??w, a tak?e nazwy dzia??w, w kt?rych nie s? zatrudnieni pracownicy.
  SELECT ename, dept.deptno
  FROM emp Full Join dept on emp.deptno = dept.deptno;
--11. Wypisz nazwiska pracownik?w, kt?rzy zarabiaj? mniej od swoich kierownik?w.
  Select prac.ename
  From emp prac left join emp kierow on prac.mgr = kierow.empno
  WHERE kierow.sal > prac.sal;
--12. Do rozwi?zania zadania 11 do??cz nazwiska szef?w, oraz p?ace szef?w i ich podw?adnych.
  Select kierow.ename Kierownik, kierow.sal Salary_Kierownika, prac.ename pracownik, prac.sal Salary_Pracownika
  From emp prac left join emp kierow on prac.mgr = kierow.empno
  WHERE kierow.sal > prac.sal;
--13. Wykorzystuj?c operacj? na zbiorach wynik?w, wypisz stanowiska wyst?puj?ce w dziale 10 lub w dziale 30.
  SELECT Emp.Job FROM Emp WHERE Emp.Deptno = 10
  Union
  SELECT Emp.Job FROM Emp WHERE Emp.Deptno = 30; 
--14. Wykorzystuj?c operacj? na zbiorach wynik?w, wypisz stanowiska wyst?puj?ce zar?wno w dziale 10, jak i w dziale 30.
  SELECT Emp.Job FROM Emp WHERE Emp.Deptno = 10
  intersect
  SELECT Emp.Job FROM Emp WHERE Emp.Deptno = 30; 
--15. Wykorzystuj?c operacj? na zbiorach wynik?w, wypisz stanowiska wyst?puj?ce w dziale 10, a nie wyst?puj?ce w dziale
--30.
  SELECT Emp.Job FROM Emp WHERE Emp.Deptno = 10
  minus
  SELECT Emp.Job FROM Emp WHERE Emp.Deptno =30;
--1. Oblicz ?redni zarobek w firmie, nazywaj?c wynikow? kolumn? ?rednia p?aca
  Select round(avg(sal),2) "SRESNIA PLACA"
  from emp;
--2. Znajd? minimalne zarobki na stanowisku CLERK.
  Select min(sal) "Min Zarobki"
  from emp
  where job = 'CLERK';
--3. Policz pracownik?w zatrudnionych w departamencie 20.
  Select count(ename) "Pracowniki w 20dep"
  from emp
  where deptno = 20;
--4. Oblicz ?rednie zarobki na ka?dym ze stanowisk pracy.
  Select job, round(avg(sal),2) "SRESNIA PLACA"
  from emp
  Group by job;
--5. Obliczy ?rednie zarobki na ka?dym ze stanowisk pracy, z wyj?tkiem stanowiska MANAGER.
  Select job, round(avg(sal),2) "SRESNIA PLACA"
  from emp
  where job <> 'MANAGER'
  Group by job;
  --having job <> 'MANAGER';
--6. Obliczy ?rednie zarobki na ka?dym ze stanowisk pracy w ka?dym departamencie.
  Select deptno, job, round(avg(sal),2) "SRESNIA PLACA"
  from emp
  Group by deptno, job;
--7. Oblicz maksymalne zarobki dla ka?dego stanowiska.
  SELECT job, max(sal) as ZAROBKI
  FROM emp
  GROUP BY job;
--8. Wybierz ?rednie zarobki tych departament?w, kt?re zatrudniaj? wi?cej ni? trzech pracownik?w.
  SELECT deptno, round(avg(sal),2) as "Srednia placa", COUNT(*) as "LICZBA"
  FROM emp
  GROUP BY deptno
  HAVING COUNT(*)>3;
--9. Wybierz stanowiska, na kt?rych ?redni zarobek wynosi 3000 lub wi?cej.
  SELECT job, round(avg(sal),2) AS Srednie
  FROM emp
  GROUP BY job
  HAVING avg(sal)>=3000;
--10. Znajd? ?rednie miesi?czne pensje oraz ?rednie roczne dochody dla ka?dego stanowiska (pami?taj o prowizji).
  SELECT job,round(avg(sal),2) as "Miesieczne" , round(avg(12*sal+NVL(comm,0)),2) as "ROCZNE"
  FROM emp
  GROUP BY job;
--11. Znajd? departamenty zatrudniaj?ce wi?cej ni? trzech pracownik?w.
  SELECT deptno, COUNT(*) as "LICZBA"
  FROM emp
  GROUP BY deptno
  HAVING COUNT(*)>3;
--12. SprawdŸ, czy wszystkie numery pracowników s¹ rzeczywiœcie wzajemnie ró¿ne.
--13. Podaj najni¿sze pensje wyp³acane podw³adnym swoich kierowników. Wyeliminuj grupy o minimalnych zarobkach
--ni¿szych ni¿ 1000. Uporz¹dkuj wyniki malej¹co wed³ug wielkoœci pensji.
SELECT MGR, MIN(SAL) AS mn
FROM EMP
WHERE NOT (MGR IS NULL)
GROUP BY MGR
HAVING MIN(SAL) < 1000
ORDER BY mn;
--14. Policz, ilu pracowników ma dzia³ maj¹cy siedzibê w DALLAS.
SELECT EMP.DEPTNO, COUNT(EMPNO)
FROM EMP INNER JOIN DEPT ON DEPT.DEPTNO = EMP.DEPTNO
WHERE DEPT.LOC LIKE 'DALLAS'
GROUP BY EMP.DEPTNO;
--15. Podaj maksymalne zarobki dla ka¿dej grupy zarobkowej.
  SELECT grade, min(sal)
  FROM emp inner join salgrade on emp.sal between salgrade.losal and salgrade.hisal
  GROUP BY grade;
--16. SprawdŸ, które wartoœci zarobków powtarzaj¹ siê i ilu pracowników je otrzymuje.
SELECT SAL, COUNT(EMPNO)
FROM EMP
GROUP BY SAL;
--17. Podaj œredni zarobek pracowników z drugiej grupy zarobkowej
  SELECT grade, round(avg(sal),2)
  FROM emp inner join salgrade on emp.sal between salgrade.losal and salgrade.hisal
  GROUP BY grade
  HAVING grade = 2;
--18. SprawdŸ, ilu podw³adnych ma ka¿dy kierownik, podaj¹c nazwisko kierownika.
  
--19. Podaj sumê, któr¹ zarabiaj¹ razem wszyscy pracownicy z pierwszej grupy zarobkowej.
  SELECT grade, SUM(sal)
  FROM emp inner join salgrade on emp.sal between salgrade.losal and salgrade.hisal
  WHERE grade = 1
  GROUP BY grade;