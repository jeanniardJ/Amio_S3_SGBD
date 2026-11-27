
Delete from SERVICE;
Delete from CLINIQUE;
Delete from SPECIALITE;
Delete from VILLE;

-- ==========================================
-- 1. Alimentation de la table VILLE
-- ==========================================

INSERT INTO VILLE (idVille, ville, departement, nombreHabitants) VALUES
(1, 'Millau', '12', 22000),
(2, 'Rodez', '12', 24000),
(3, 'Montpellier', '34', 302000),
(4, 'Nimes', '30', 150000),
(5, 'Beziers', '34', 80000),
(6, 'Alès', '30', 500000),
(7, 'Albi', '81', 50000),
(8, 'Narbonne', '11', 56000),
(9, 'Sete', '34', 45000),
(10, 'Carcassonne', '11', 20000);


-- ==========================================
-- 2. Alimentation de la table SPECIALITE
-- ==========================================

INSERT INTO SPECIALITE (numeroSpecialite, libelle) VALUES
(1, 'Cardiologie'),
(2, 'Dermatologie'),
(3, 'Pediatrie'),
(4, 'Neurologie'),
(5, 'Chirurgie generale'),
(6, 'Ophtalmologie'),
(7, 'Radiologie'),
(8, 'Maternite'),
(9, 'Pneumologie'),
(10, 'Rhumatologie'),
(11, 'Geriatrie'),
(12, 'Oncologie'),
(13, 'Medecine nucleaire'),
(14, 'Nephrologie'),
(15, 'Urgences');


-- ==========================================
-- 3. Alimentation de la table CLINIQUE
-- ==========================================

INSERT INTO CLINIQUE (numeroClinique, nom, nombreLits, idVille) VALUES
(1, 'Clinique du Larzac', 120, 1),
(2, 'Clinique Sainte-Marie', 180, 2),
(3, 'Clinique Saint-Roch', 250, 3),
(4, 'Clinique des Oliviers', 150, 4),
(5, 'Clinique du Parc', 200, 5),
(6, 'Clinique Pasteur', 300, 6),
(7, 'Clinique Claude Bernard', 160, 7),
(8, 'Clinique du Soleil', 130, 8),
(9,  'Clinique Saint-Jean',       90,  1),
(10, 'Clinique des Cèdres',      140,  2),
(11, 'Clinique du Millénaire',   280,  3),
(12, 'Clinique Kennedy',         110,  4),
(13, 'Clinique Saint-Louis',     175,  5),
(14, 'Clinique Ambroise Paré',   220,  6),
(15, 'Clinique Sainte-Cécile',    85,  7),
(16, 'Clinique des Violettes',   130,  8),
(17, 'Clinique du Languedoc',    190,  3),
(18, 'Clinique des Arceaux',     160,  3),
(19, 'Clinique du Grand Parc',   240,  6),
(20, 'Clinique Saint-Michel',     75,  1);


-- ==========================================
-- 4. Alimentation de la table SERVICE
-- ==========================================

INSERT INTO SERVICE (numeroSpecialite, numeroClinique) VALUES


(1, 1),
(3, 1),
(5, 1),
(7, 1),


(1, 2),
(2, 2),
(4, 2),
(6, 2),


(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(8, 3),
(9, 3),


(2, 4),
(3, 4),
(6, 4),
(10, 4),


(1, 5),
(3, 5),
(5, 5),
(7, 5),
(8, 5),


(1, 6),
(2, 6),
(3, 6),
(4, 6),
(5, 6),
(6, 6),
(7, 6),
(8, 6),
(9, 6),
(10, 6),


(1, 7),
(4, 7),
(5, 7),
(9, 7),


(2, 8),
(3, 8),
(6, 8),
(8, 8);

INSERT INTO SERVICE (numeroSpecialite, numeroClinique) VALUES


(1, 9),
(11, 9),
(15, 9),


(2, 10),
(12, 10),
(15, 10),


(3, 11),
(11, 11),
(15, 11),


(4, 12),
(12, 12),
(15, 12),


(5, 13),
(11, 13),
(15, 13),


(6, 14),
(12, 14),
(15, 14),


(7, 15),
(11, 15),
(15, 15),


(8, 16),
(12, 16),
(15, 16),


(9, 17),
(11, 17),
(15, 17),


(10, 18),
(12, 18),
(15, 18),


(1, 19),
(2, 19),
(11, 19),


(4, 20),
(5, 20),
(14, 20);



