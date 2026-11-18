/* Restrictions et tris */
-- Q1 – Afficher le nom et le salaire des employés gagnant plus de 2850.
SELECT ename, sal FROM emp WHERE sal > 2850;
-- Q2 – Afficher le nom et le numéro de département de l’employé dont le matricule est 7566.
SELECT ename, deptno FROM emp WHERE empno = 7566;
-- Q3 – Afficher le nom et le salaire de tous les employés dont le salaire n’est pas compris entre 1500 et 2850.
SELECT ename, sal FROM emp WHERE sal NOT BETWEEN '1500' AND '2850';
-- Q4 – Créez une requête destinée à afficher le nom, le poste et la date d’embauche des employés embauchés entre le 20 février 1981 et le 1 mai 1981. Classez le résultat par date d’embauche croissante.
SELECT ename, job, hiredate FROM emp WHERE hiredate BETWEEN '1981-02-20' AND '1981-05-01' ORDER BY hiredate;
-- Q5 – Afficher le nom et le numéro de département de tous les employés des départements 10 et 30 classés par ordre alphabétique.
SELECT ename, deptno FROM emp WHERE deptno = 10 OR deptno = 30 ORDER BY ename;
-- Q6 – Afficher la liste des noms et salaires des employés gagnant plus de 1500 et travaillant dans le département 10 ou 30. Nommez les colonnes «Employé» et «Salaire mensuel».
SELECT ename as "Employé", sal as "Salaire mensuel" FROM emp WHERE sal > 1500 AND deptno = 10 OR deptno = 30;
-- Q7 – Afficher le nom et la date d’embauche de chaque employé entré en 1982.
SELECT ename, hiredate FROM emp WHERE date_part('year', hiredate) = 1982;
-- Q8 – Afficher le nom et le poste de tous les employés n’ayant pas de manager.
SELECT ename, job FROM emp WHERE mgr IS NULL;
-- Q9 – Créez une requête destinée à afficher le nom, le salaire et la commission de tous les employés qui perçoivent des commissions. Triez les données dans l’ordre décroissant des salaires puis des commissions.
SELECT ename, sal, comm FROM emp WHERE comm IS NOT NULL ORDER BY sal, comm;
-- Q10 – Afficher le nom de tous les employés dont la troisième lettre du nom est A.
SELECT ename FROM emp WHERE upper(ename) LIKE '__A%';
-- Q11 – Sélectionner le nom de tous les employés dont le nom contient deux L, travaillant dans le département 30 ou dont le manager est 7782.
SELECT ename FROM emp WHERE upper(ename) LIKE '%L%L%'AND deptno = 30 OR empno = (SELECT empno FROM emp WHERE empno = 7782);
-- Q12 – Afficher le nom, le poste et le salaire de tous les CLERK ou ANALYST dont le salaire est différent de 1000, 3000 ou 5000.
SELECT ename, job, sal FROM emp WHERE upper(job) = 'CLERK' OR upper(job) = 'ANALYST' AND sal NOT IN ('1000', '3000', '5000');
-- Q13 – Afficher le nom, le salaire et la commission de tous les employés dont le montant de commission est  supérieur de plus de 10% au salaire.
SELECT ename, sal, comm FROM emp WHERE comm > sal * 1.1;