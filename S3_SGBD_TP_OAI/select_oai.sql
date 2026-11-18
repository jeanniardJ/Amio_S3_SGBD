/* SELECT */
-- 1 - Obtenir la liste de tous les employés avec toutes leurs informations (Ecrire la requête de 2 manières différentes)
SELECT * FROM emp;
select empno, ename, sal, job, comm, hiredate, mgr, deptno from emp;
-- 2 - Obtenir la liste de tous les noms des salariés avec leur salaire
SELECT ename, sal FROM emp;
-- 3 - Obtenir la liste de tous les noms des salariés avec leur date d'embauche
SELECT ename, hiredate FROM emp;
-- 4 - Obtenir la liste de tous les noms des salariés avec leur salaire annuel (12 * le salaire ensuel)
SELECT ename, sal*12 as "Salaire Annuel" FROM emp;
-- 5 - Obtenir la liste de tous les noms des salariés précédés par "Mr ou Me"
SELECT concat('Mr ou Me ', ename) FROM emp;
SELECT 'Mr ou Me ' || ename FROM emp;
-- 6 - Obtenir la liste de tous les différents JOB de l'entreprise
SELECT DISTINCT job FROM emp;
-- 7 - Obtenir la liste de tous les différents JOB et Salaires de l'entreprise
SELECT DISTINCT job, sal FROM emp;
-- 8 - Obtenir la liste de tous les noms des salariés avec le total de leur Salaire et commission
SELECT ename, sal, comm, sal*12 + comm as "Salaire total" FROM emp;
SELECT ename, sal, COALESCE(comm, 0), COALESCE(sal*12 + comm, sal*12) as "Salaire total" FROM emp;

/* RESTRICTIONS */
-- 9 - Obtenir la liste de tous les noms des salariés avec le total de leur Salaire et commission pour ceux qui ont une commission
SELECT ename, sal, comm, sal + comm as "Total" FROM emp WHERE comm IS NOT NULL;
-- 10 - Obtenir la liste de tous les "Clerk" du département 20 et des "Manager" du département 20
SELECT * FROM emp WHERE job = 'CLERK' OR job = 'MANAGER' AND deptno = 20;
-- 11 - Obtenir la liste de tous les employés embauché durant l'année 1981
SELECT * FROM emp WHERE date_part('year', hiredate) = '1981';
-- 12 - Obtenir la liste des nom de tous les employés ayant BLAKE comme manager
SELECT * FROM emp WHERE deptno = 30;
-- 13 - Obtenir la liste des JOB qui continennent un A dans leur nom
SELECT * FROM emp WHERE job LIKE '%A%';
-- 14 - Obtenir la liste des employés dont le nom termine par un S ou bien un R
SELECT * FROM emp WHERE ename LIKE '%S' OR ename LIKE '%R';
-- 15 - Obtenir la liste de tous les "Salesman" et "Analyst"
SELECT * FROM emp WHERE job IN ('SALESMAN', 'ANALYST');
-- 16 - Obtenir la liste des employés qui ont un manager
-- SELECT * FROM emp WHERE job NOT IN ('PRESIDENT', 'MANAGER');
SELECT * FROM emp WHERE mgr IS NOT NULL;
-- 17 - Obtenir la liste des employés qui ont un salaire annuel supérieur à 36000
SELECT * FROM emp WHERE sal*12 >= 36000;