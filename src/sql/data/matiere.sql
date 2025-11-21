INSERT INTO matiere (ue, libelle) VALUES 
('INF101', 'Programmation procédurale'),
('INF104', 'HTML et Introduction au Web'),
('INF107', 'Informatique de Base'),
('MTH101', 'Arithmétique et nombres'),
('MTH102', 'Analyse mathématique'),
('ORG101', 'Techniques de communication');

-- S2
INSERT INTO matiere (ue, libelle) VALUES 
('INF102', 'Bases de données relationnelles'),
('INF103', 'Bases de l''administration système'),
('INF105', 'Maintenance matériel et logiciel'),
('INF106', 'Compléments de programmation'),
('MTH103', 'Calcul Vectoriel et Matriciel'),
('MTH105', 'Probabilité et Statistique');

-- S3
INSERT INTO matiere (ue, libelle) VALUES 
('INF201', 'Programmation orientée objet'),
('INF202', 'Bases de données objets'),
('INF203', 'Programmation système'),
('INF208', 'Réseaux informatiques'),
('MTH201', 'Méthodes numériques'),
('ORG201', 'Bases de gestion');

-- S4
INSERT INTO matiere (ue, libelle) VALUES 
('INF204', 'Système d''information géographique'),
('INF205', 'Système d''information'),
('INF206', 'Interface Homme/Machine'),
('INF207', 'Eléments d''algorithmique'),
('INF209', 'Web dynamique'),
('INF210', 'Mini-projet de développement'),
('INF211', 'Mini-projet de bases de données et/ou de réseaux'),
('INF212', 'Mini-projet de Web et design'),
('MTH202', 'Analyse des données'),
('MTH203', 'MAO'),
('MTH204', 'Géométrie'),
('MTH205', 'Equations différentielles'),
('MTH206', 'Optimisation');

INSERT INTO matiere_semestre (id_matiere, id_semestre, id_filiere) VALUES 
(1, 1, 1), (2, 1, 1), (3, 1, 1), (4, 1, 1), (5, 1, 1), (6, 1, 1);

-- S2
INSERT INTO matiere_semestre (id_matiere, id_semestre, id_filiere) VALUES 
(7, 2, 1), (8, 2, 1), (9, 2, 1), (10, 2, 1), (11, 2, 1), (12, 2, 1);

-- S3
INSERT INTO matiere_semestre (id_matiere, id_semestre, id_filiere) VALUES 
(13, 3, 1), (14, 3, 1), (15, 3, 1), (16, 3, 1), (17, 3, 1), (18, 3, 1);

-- S4
INSERT INTO matiere_semestre (id_matiere, id_semestre, id_filiere) VALUES 
(19, 4, 1), (20, 4, 1), (21, 4, 1), (22, 4, 1), (23, 4, 1), 
(24, 4, 1), (25, 4, 1), (26, 4, 1), (27, 4, 1), (28, 4, 1), 
(29, 4, 1), (30, 4, 1), (31, 4, 1);

INSERT INTO option_matiere_semestre (id_option, id_matiere_semestre, isOptional, degre, credit) VALUES 
-- S1
(4, 1, FALSE, NULL, 7), (4, 2, FALSE, NULL, 5), (4, 3, FALSE, NULL, 4),
(4, 4, FALSE, NULL, 4), (4, 5, FALSE, NULL, 6), (4, 6, FALSE, NULL, 4),
-- S2
(4, 7, FALSE, NULL, 5), (4, 8, FALSE, NULL, 5), (4, 9, FALSE, NULL, 4),
(4, 10, FALSE, NULL, 6), (4, 11, FALSE, NULL, 6), (4, 12, FALSE, NULL, 4),
-- S3
(4, 13, FALSE, NULL, 6), (4, 14, FALSE, NULL, 6), (4, 15, FALSE, NULL, 4),
(4, 16, FALSE, NULL, 6), (4, 17, FALSE, NULL, 4), (4, 18, FALSE, NULL, 4);

-- 7. OPTIONS S4 (avec les vraies options)
-- Option 1: Développement
INSERT INTO option_matiere_semestre (id_option, id_matiere_semestre, isOptional, degre, credit) VALUES 
(1, 19, TRUE, 1, 6), (1, 20, TRUE, 1, 6), (1, 21, TRUE, 1, 6),
(1, 22, FALSE, NULL, 6), (1, 24, FALSE, NULL, 10),
(1, 29, TRUE, 2, 4), (1, 30, TRUE, 2, 4), (1, 31, TRUE, 2, 4),
(1, 28, FALSE, NULL, 4);

-- Option 2: Réseaux et Bd
INSERT INTO option_matiere_semestre (id_option, id_matiere_semestre, isOptional, degre, credit) VALUES 
(2, 19, TRUE, 2, 6), (2, 20, FALSE, NULL, 6), (2, 21, TRUE, 2, 6),
(2, 22, TRUE, 2, 6), (2, 25, FALSE, NULL, 10),
(2, 27, TRUE, 3, 4), (2, 30, TRUE, 3, 4), (2, 31, TRUE, 3, 4),
(2, 28, FALSE, NULL, 4);

-- Option 3: WEB
INSERT INTO option_matiere_semestre (id_option, id_matiere_semestre, isOptional, degre, credit) VALUES 
(3, 19, TRUE, 1, 6), (3, 20, TRUE, 1, 6), (3, 21, TRUE, 1, 6),
(3, 23, FALSE, NULL, 6), (3, 26, FALSE, NULL, 10),
(3, 27, TRUE, 2, 4), (3, 29, TRUE, 2, 4), (3, 31, TRUE, 2, 4),
(3, 28, FALSE, NULL, 4);

