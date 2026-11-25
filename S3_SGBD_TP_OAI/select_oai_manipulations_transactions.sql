-- Parmi les requêtes proposées ci-dessous, certaines testent les contraintes d’intégrité mises en place dans la base de données et devraient  retourner une erreur à l’exécution. Si tel est le cas, vous relèverez le message et expliquerez la cause de l’erreur.
-- Q1 - Insérer un nouvel employé dans le département 10
start TRANSACTION;
INSERT INTO emp (empno, ename, sal, job, comm, hiredate, mgr, deptno) VALUES (7154, 'LOL', 2350, 'CLERK', NULL, '1952-02-03', 7902, 10);
COMMIT;
ROLLBACK;
-- 2026-11-25 11:29:38 [ INFO] Executing: INSERT into emp (empno, ename, sal, job, comm, hiredate, mgr, deptno) values (7154, 'LOL', 2350, 'CLERK', NULL, '1952-02-03', 7902, 10)
-- 2026-11-25 11:29:38 [ INFO] Result: 1 rows affected in 21ms

-- Q2 - Insérer un nouveau département avec pour numéro de département 30
INSERT INTO dept (deptno, dname, loc) VALUES (30, 'LOLILOL', 'FRANCE');
-- 2026-11-25 11:32:49 [ERROR] duplicate key value violates unique constraint "dept_pk"

-- Q3 - Insérer un nouvel employé dans le département 50
start TRANSACTION;
INSERT INTO emp (empno, ename, sal, job, comm, hiredate, mgr, deptno) VALUES (7164, 'BLALA', 2350, 'CLERK', NULL, '1952-02-03', 7902, 50);
-- 2026-11-25 11:36:28 [ERROR] insert or update on table "emp" violates foreign key constraint "emp_deptno_fk"
ROLLBACK;

-- Q4 - Supprimer le département 10
start TRANSACTION;
DELETE FROM dept WHERE deptno = 10;
-- [ERROR] update or delete on table "dept" violates foreign key constraint "emp_deptno_fk" on table "emp"
ROLLBACK;

-- Bonus : vous aurez besoin de sous-requêtes pour résoudre ces problèmes.
-- Q5 - Affecter l’employé dont le nom est BLAKE au département dont le nom RESEARCH
-- Q6 - Augmenter de 100€ les salariés qui gagnent le minimum
-- Q7 – Supprimer les départements qui n’ont pas de salariés
-- Q8 – Augmenter de 100€ les employés qui travaillent à DALLAS
-- Q9 - Réaliser les changements ci-après dans une même transaction. Prévoir la possibilité d'annuler ces changements :
--  	Insérer un nouveau département (le numéro 50)
--  	Affecter tous les employés du département 20 au département 50
--  	Supprimer le département 20
--  	Vérifier en visualisant le contenu des tables
--  	Annuler la suppression du département 20
--  	Valider les changements en suspens pour les rendre permanents
--  	Vérifier en visualisant le contenu des tables.
