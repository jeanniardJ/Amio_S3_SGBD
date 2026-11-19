/* Agregats et Groupes */

-- Q1 – Affichez le salaire maximum, le salaire minimum, la somme des salaires et le salaire moyen de tous les employés. Renommez les colonnes
SELECT max(sal) as "Salaire max", min(sal) as "Salaire min",  sum(sal) as "Somme de tout les salaire", avg(sal) as "Moyenne" FROM emp;
-- Q2 – Modifiez la requête précédente, pour afficher les mêmes informations, mais pour chaque type de poste.
SELECT max(sal) as "Salaire max", min(sal) as "Salaire min",  sum(sal) as "Somme de tout les salaire", avg(sal) as "Moyenne" FROM emp WHERE lower(job) LIKE 'mana%';
SELECT max(sal) as "Salaire max", min(sal) as "Salaire min",  sum(sal) as "Somme de tout les salaire", avg(sal) as "Moyenne" FROM emp WHERE lower(job) LIKE 'sales%';
SELECT max(sal) as "Salaire max", min(sal) as "Salaire min",  sum(sal) as "Somme de tout les salaire", avg(sal) as "Moyenne" FROM emp WHERE lower(job) LIKE 'analy%';
SELECT max(sal) as "Salaire max", min(sal) as "Salaire min",  sum(sal) as "Somme de tout les salaire", avg(sal) as "Moyenne" FROM emp WHERE lower(job) LIKE 'cler%';
SELECT max(sal) as "Salaire max", min(sal) as "Salaire min",  sum(sal) as "Somme de tout les salaire", avg(sal) as "Moyenne", job as "Job" FROM emp GROUP BY job;
-- Q3 – Afficher le nombre de personnes qui occupent le même poste.
SELECT count(*), job as "Job" FROM emp GROUP BY JOB;
-- Q4  – Déterminez le nombre de personnes ayant des subordonnés, sans en donner la liste.
SELECT count(distinct mgr) FROM emp;
-- Q5 – Afficher la différence entre le salaire maximum, et le salaire minimum. Nommez la colonne Différence.
SELECT max(sal) - min(sal) as "Différence" FROM emp;
-- Q6 – Ecrire cette requête par étape :
--    -	afficher le matricule des différents chefs de service et le salaire minimum de leurs employés
--    -	exclure ensuite toute ligne où le manager n’est pas identifié
--	  - exclure tout groupe dans lequel le salaire minimum est inférieur à 1000
--    - enfin trier les résultats par ordre décroissant des minima de salaires.
SELECT e.mgr as "Matricule du chef de service", min(e.sal) as "Salaire minimum" FROM emp e WHERE e.mgr IS NOT NULL GROUP BY e.mgr HAVING min(e.sal) >= 1000 ORDER BY min(e.sal) DESC;
-- Q7 - Afficher département par département, le nom du département, la localisation, le nombre d’employés et le salaire moyen des employés du département.
SELECT d.dname as "Nom du dpt", d.loc as "Localisation", count(e) as "Nombre de personne(s)", avg(e.sal) FROM dept d JOIN emp e ON d.deptno = e.deptno GROUP BY d.deptno;

/* Bonus : */

-- Q6 – Reprendre la question 6 pour afficher aussi le nom du manager
SELECT e.mgr as "Matricule du chef de service", m.ename as "Nom du manager", min(e.sal) as "Salaire minimum" FROM emp e JOIN emp m ON e.mgr = m.empno WHERE e.mgr IS NOT NULL GROUP BY e.mgr, m.ename HAVING min(e.sal) >= 1000 ORDER BY min(e.sal) DESC;
-- Q8 – Même requête en ne prenant en compte que les salariés qui ne sont pas PRESIDENT ou MANAGER.

-- Q9 – Pour chaque grade, afficher le salaire plancher, le salaire plafond, le nombre de salariés concernés et la moyenne des salaires du grade.
SELECT s.grade as "Grade", s.losal as "Salaire min", s.hisal as "Salaire max", count(e) as "Nombre de personnes", avg(e.sal) as "Salaire moyen" FROM salgrade s JOIN emp e ON e.sal BETWEEN s.losal AND s.hisal GROUP BY s.grade;
-- Q10 – Afficher les noms des départements dont le nombre de salariés est supérieur ou égal à 5.
SELECT dname FROM dept d JOIN emp e ON d.deptno = e.deptno GROUP BY d.deptno HAVING count(e) >= 5; 