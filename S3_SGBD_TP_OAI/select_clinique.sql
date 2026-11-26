
-- a) Donner la liste des cliniques ayant un nombre de lits inférieur à 200.
SELECT * FROM clinique WHERE nombrelits < 200;
-- b) Donner le nom des cliniques qui propose la spécialité numéro 5.
SELECT clinique.nom FROM clinique JOIN service ON clinique.numeroclinique = service.numeroclinique JOIN specialite ON specialite.numerospecialite = service.numerospecialite WHERE specialite.numerospecialite = 5;
-- c) Donner le nom des cliniques des villes de plus de 200 000 habitants du département de l'hérault, qui ont plus de 100 lits.
SELECT * FROM clinique JOIN ville ON clinique.idville = ville.idville WHERE ville.nombrehabitants > 200000 AND ville.departement = '34' AND clinique.nombrelits > 100;
-- d) Donner pour chaque ville, le nom de la clinique qui a le plus grand nombre de lits.
SELECT ville.ville, clinique.nom, max(clinique.nombrelits) FROM clinique JOIN VILLE ON clinique.idville = ville.idville GROUP BY ville.idville;
-- e) Donner le nom des cliniques qui disposent des spécialités 1 et/ou 6.

-- f) Donner le nom des cliniques qui disposent à la fois des spécialités 1, 6 et 7.

-- g) Donner pour chaque département le nom de la spécialité la plus représentée.

-- h) Donner le nom des villes dans lesquelles il n’y a pas de clinique.

-- i) Ajouter dans la bdd la ville de Perpignan car on va référencer des cliniques dans cette ville

-- j) Créer la clinique "La Catalane" située à Perpignan spécalisée en "Cardiologie" et "Pneumologie"

-- k) La clinique des Oliviers (numéro:4) a ouvert un service de "Chirurgie esthétique". Enregistrer cette nouvelle situation

-- l) "La clinique du parc" vient de changer de nom elle s'appelle désormais "La clinique de la pinède". Enregistrer cette nouvelle situation

-- m) la "Clinique Claude Bernard" ferme, elle doit être retirée de la Bdd. Les spécialités qu'elle avait sont transférées à la "clinique du Larzac" (sauf celles qui y existaient déjà). Enregistrer cette nouvelle situation

-- n) Les cliniques de l'Aveyron doublent leur nombre de lits. Enregistrer cette nouvelle situation

-- o) Le service Maternité de la "Clinique du soleil" ferme. Enregistrer cette nouvelle situation.