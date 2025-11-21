-- Données de test complètes pour l'application de gestion des notes

-- Années
INSERT INTO annee (libelle) VALUES ('L1');
INSERT INTO annee (libelle) VALUES ('L2');
INSERT INTO annee (libelle) VALUES ('L3');

-- Semestres
INSERT INTO semestre (libelle, id_annee) VALUES ('S1', 1);
INSERT INTO semestre (libelle, id_annee) VALUES ('S2', 1);
INSERT INTO semestre (libelle, id_annee) VALUES ('S3', 2);
INSERT INTO semestre (libelle, id_annee) VALUES ('S4', 2);
INSERT INTO semestre (libelle, id_annee) VALUES ('S5', 3);
INSERT INTO semestre (libelle, id_annee) VALUES ('S6', 3);

-- Filières
INSERT INTO filiere (libelle) VALUES ('Informatique');


-- Option
INSERT INTO option (libelle) VALUES ('Developpement');
INSERT INTO option (libelle) VALUES ('Réseaux et Bd');
INSERT INTO option (libelle) VALUES ('WEB');
INSERT INTO option (libelle) VALUES ('Aucune');

