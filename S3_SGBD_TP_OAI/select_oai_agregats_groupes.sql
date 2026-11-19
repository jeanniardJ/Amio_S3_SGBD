/* Agregats et Groupes */

-- Q1 – Affichez le salaire maximum, le salaire minimum, la somme des salaires et le salaire moyen de tous les employés. Renommez les colonnes
SELECT max(sal) as "Salaire max", min(sal) as "Salaire min",  sum(sal) as "Somme de tout les salaire", avg(sal) as "Moyenne" FROM emp;
-- Q2 – Modifiez la requête précédente, pour afficher les mêmes informations, mais pour chaque type de poste.
SELECT max(sal) as "Salaire max", min(sal) as "Salaire min",  sum(sal) as "Somme de tout les salaire", avg(sal) as "Moyenne" FROM emp WHERE lower(job) LIKE 'mana%';
SELECT max(sal) as "Salaire max", min(sal) as "Salaire min",  sum(sal) as "Somme de tout les salaire", avg(sal) as "Moyenne" FROM emp WHERE lower(job) LIKE 'sales%';
SELECT max(sal) as "Salaire max", min(sal) as "Salaire min",  sum(sal) as "Somme de tout les salaire", avg(sal) as "Moyenne" FROM emp WHERE lower(job) LIKE 'analy%';
SELECT max(sal) as "Salaire max", min(sal) as "Salaire min",  sum(sal) as "Somme de tout les salaire", avg(sal) as "Moyenne" FROM emp WHERE lower(job) LIKE 'cler%';

-- Q3 – Afficher le nombre de personnes qui occupent le même poste.
SELECT count(*) FROM emp WHERE lower(job) LIKE 'mana%';
-- Q4  – Déterminez le nombre de personnes ayant des subordonnés, sans en donner la liste.

-- Q5 – Afficher la différence entre le salaire maximum, et le salaire minimum. Nommez la colonne Différence.

-- Q6 – Ecrire cette requête par étape :
--    -	afficher le matricule des différents chefs de service et le salaire minimum de leurs employés
--    -	exclure ensuite toute ligne où le manager n’est pas identifié
--	  - exclure tout groupe dans lequel le salaire minimum est inférieur à 1000
--    - enfin trier les résultats par ordre décroissant des minima de salaires.

-- Q7 - Afficher département par département, le nom du département, la localisation, le nombre d’employés et le salaire moyen des employés du département.

/* Bonus : */

-- Q6 – Reprendre la question 6 pour afficher aussi le nom du manager

-- Q8 – Même requête en ne prenant en compte que les salariés qui ne sont pas PRESIDENT ou MANAGER.

-- Q9 – Pour chaque grade, afficher le salaire plancher, le salaire plafond, le nombre de salariés concernés et la moyenne des salaires du grade.

-- Q10 – Afficher les noms des départements dont le nombre de salariés est supérieur ou égal à 5.
