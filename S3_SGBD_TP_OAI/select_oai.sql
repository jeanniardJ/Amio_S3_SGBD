-- 1 - Obtenir la liste de tous les employés avec toutes leurs informations (Ecrire la requête de 2 manières différentes)
SELECT * FROM emp;
select empno, ename, sal, job, comm, hiredate, mgr, deptno from emp;
-- 2 - Obtenir la liste de tous les noms des salariés avec leur salaire
SELECT ename, sal FROM emp;
-- 3 - Obtenir la liste de tous les noms des salariés avec leur date d'embauche
SELECT ename, hiredate FROM emp;
-- 4 - Obtenir la liste de tous les noms des salariés avec leur salaire annuel (12 * le salaire ensuel)
