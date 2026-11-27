
-- a) Donner la liste des cliniques ayant un nombre de lits inférieur à 200.
SELECT * FROM clinique WHERE nombrelits < 200;
-- b) Donner le nom des cliniques qui propose la spécialité numéro 5.
SELECT clinique.nom FROM clinique JOIN service ON clinique.numeroclinique = service.numeroclinique JOIN specialite ON specialite.numerospecialite = service.numerospecialite WHERE specialite.numerospecialite = 5;
-- c) Donner le nom des cliniques des villes de plus de 200 000 habitants du département de l'hérault, qui ont plus de 100 lits.
SELECT * FROM clinique JOIN ville ON clinique.idville = ville.idville WHERE ville.nombrehabitants > 200000 AND ville.departement = '34' AND clinique.nombrelits > 100;
-- d) Donner pour chaque ville, le nom de la clinique qui a le plus grand nombre de lits.
SELECT clinique.nom, max(clinique.nombrelits) FROM clinique GROUP BY clinique.idville, clinique.nom;
SELECT clinique.nom FROM clinique WHERE clinique.nombrelits IN (SELECT MAX(clinique.nombrelits) FROM clinique GROUP BY clinique.idville);

SELECT ville.ville, c.nom FROM clinique c
JOIN ville ON ville.idville = c.idville 
WHERE (ville.idville, c.nombrelits) IN (SELECT clinique.idville, MAX(clinique.nombrelits) FROM clinique GROUP BY clinique.idville);

-- e) Donner le nom des cliniques qui disposent des spécialités 1 et/ou 6.
SELECT DISTINCT clinique.nom FROM clinique 
JOIN service ON clinique.numeroclinique = service.numeroclinique 
WHERE service.numerospecialite IN (1,6);
-- f) Donner le nom des cliniques qui disposent à la fois des spécialités 1, 6 et 7.
SELECT clinique.nom FROM clinique 
JOIN service as s1 ON s1.numeroclinique = clinique.numeroclinique AND s1.numerospecialite = 1
JOIN service as s6 ON s6.numeroclinique = clinique.numeroclinique AND s6.numerospecialite = 6
JOIN service as s7 ON s7.numeroclinique = clinique.numeroclinique AND s7.numerospecialite = 7;

-- g) Donner pour chaque département le nom de la spécialité la plus représentée.
-- Il faut recuperer le libelle de la spécialité qui est le plus representer par departement (count le nombre de fois que la spe apparais est resortir l'id)  "ville qui comporte dept" -> "clinique qui est dans une ville" -> "Spe qui est dans une clinique"
SELECT departement, specialite.libelle, count(*) FROM clinique
JOIN ville ON clinique.idville = ville.idville
JOIN service ON clinique.numeroclinique = service.numeroclinique
JOIN specialite ON service.numerospecialite = specialite.numerospecialite
GROUP BY ville.departement, libelle;

SELECT * FROM specialite sp 
JOIN (SELECT departement, specialite.libelle, count(*) FROM clinique
JOIN ville ON clinique.idville = ville.idville
JOIN service ON clinique.numeroclinique = service.numeroclinique
JOIN specialite ON service.numerospecialite = specialite.numerospecialite
GROUP BY ville.departement, libelle) as deptcount ON sp.libelle = deptcount.libelle;
-- h) Donner le nom des villes dans lesquelles il n’y a pas de clinique.
SELECT ville.ville FROM ville LEFT JOIN clinique ON clinique.idville = ville.idville WHERE clinique.idville IS NULL;
-- i) Ajouter dans la bdd la ville de Perpignan car on va référencer des cliniques dans cette ville
INSERT INTO ville VALUES (10, 'Perpignan','66', 121616);
-- j) Créer la clinique "La Catalane" située à Perpignan spécalisée en "Cardiologie" et "Pneumologie", 100 lits

INSERT INTO clinique VALUES (9, 'La Catalane', 100, 10);
INSERT INTO service VALUES 
((SELECT numeroclinique FROM clinique WHERE nom = 'La Catalane'), (SELECT numerospecialite FROM specialite WHERE libelle = 'Cardiologie')),
((SELECT numeroclinique FROM clinique WHERE nom = 'La Catalane'), (SELECT numerospecialite FROM specialite WHERE libelle = 'Pneumologie'));

-- k) La clinique des Oliviers (numéro:4) a ouvert un service de "Chirurgie esthétique". Enregistrer cette nouvelle situation
INSERT INTO specialite VALUES (11, 'Chirurgie esthétique');
INSERT INTO service VALUES (11, 4);
-- l) "La clinique du parc" vient de changer de nom elle s'appelle désormais "La clinique de la pinède". Enregistrer cette nouvelle situation
UPDATE clinique SET nom = 'La clinique de la pinède' WHERE clinique.nom = 'La clinique du parc';
-- m) la "Clinique Claude Bernard" ferme, elle doit être retirée de la Bdd. Les spécialités qu'elle avait sont transférées à la "clinique du Larzac" (sauf celles qui y existaient déjà). Enregistrer cette nouvelle situation
DELETE FROM service WHERE service.numeroclinique = (SELECT numeroclinique FROM clinique WHERE clinique.nom = 'Clinique Claude Bernard');
DELETE FROM clinique WHERE clinique.nom = 'Clinique Claude Bernard';
-- n) Les cliniques de l'Aveyron doublent leur nombre de lits. Enregistrer cette nouvelle situation

UPDATE clinique SET nombrelits = nombrelits * 2 WHERE clinique.idville IN (SELECT ville.idville FROM ville WHERE ville.departement = '12') RETURNING *;
-- o) Le service Maternité de la "Clinique du soleil" ferme. Enregistrer cette nouvelle situation.
SELECT numeroclinique FROM clinique WHERE nom = 'Clinique du Soleil';
DELETE FROM service 
WHERE service.numeroclinique = (SELECT numeroclinique FROM clinique WHERE nom LIKE '%Clinique du Soleil%') 
AND service.numerospecialite = (SELECT numerospecialite FROM specialite WHERE libelle = 'Maternite') RETURNING *;