/* Jointures */

-- Q1 – Afficher le nom, le numéro de département et le nom du département de tous les employés.
SELECT e.ename, e.deptno, d.dname FROM emp e JOIN dept d ON e.deptno = d.deptno;
-- Q2 – Afficher les différents postes du département 30 plus le nom du département. Vous prendrez le soin d’éliminer les postes en double.
SELECT DISTINCT e.job, d.dname FROM emp as e JOIN dept as d ON e.deptno = d.deptno WHERE e.deptno = 30;
-- Q3 -  Créez une requête destinée à afficher le nom, le nom du département et la localisation de tous les employés qui touchent une commission.
SELECT e.ename, d.dname, d.loc FROM emp e JOIN dept d ON e.deptno = d.deptno WHERE e.comm IS NOT NULL;
-- Q4 - Afficher le nom, le nom du département pour tous les employés dont le nom contient la lettre A.
SELECT e.ename, d.dname FROM emp e JOIN dept d ON e.deptno = d.deptno WHERE upper(e.ename) LIKE '%A%';
-- Q5 - Afficher le nom, le poste, le numéro et le nom du département de tous les employés basés à DALLAS.
SELECT e.ename as "Nom", e.job, e.deptno as "Numéro dpt", d.dname as "Nom dpt" FROM emp e JOIN dept d ON e.deptno = d.deptno WHERE upper(d.loc) = 'DALLAS';
-- Q6 - Afficher le nom, le matricule de chaque employé complété du nom et du matricule de son manager. Nommez les colonnes Employé, #Emp, Manager, #Manager respectivement.
SELECT e.ename as "Employé", e.empno as "#Emp", m.ename as "Manager", m.empno AS "#Manager" FROM emp e JOIN emp m on e.mgr = m.empno;
-- Q7 -  Modifiez la requête précédente pour afficher tous les employés, y compris King, qui n’a pas de manager.
SELECT e.ename as "Employé", e.empno as "#Emp", m.ename as "Manager", m.empno AS "#Manager" FROM emp e LEFT JOIN emp m on e.mgr = m.empno;
-- Q8 - Créez une requête destinée à afficher le nom d’employé, le poste, le nom du département, le salaire et le grade de tous les employés. 
SELECT e.ename, e.job, d.dname, e.sal, s.grade FROM emp e JOIN dept d ON e.deptno = d.deptno JOIN salgrade s ON e.sal BETWEEN s.losal and s.hisal;

-- Bonus :

-- Q9 - Afficher le numéro de département et le nom de tous les employés qui travaillent dans le même département qu’un autre employé. 
-- Donnez à chaque colonne un entête approprié «Numéro de département», «Nom employé», «Nom collègue».
SELECT d.deptno as "Numéro de département", e.ename as "Nom employé", FROM emp ef JOIN emp eS ON 
-- Q10 - Créez une requête destinée à afficher le nom, et la date d’embauche de tous les employés arrivés avant l’employé dont le nom est BLAKE. Trier les lignes sur la date d’embauche.

-- Q11 - Afficher le nom, la date d’embauche des employés et de leur manager, pour tous les employés ayant été embauchés avant leur manager. Renommez les colonnes pour les différencier.
