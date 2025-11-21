-- Données de test

INSERT INTO annee (libelle) VALUES ('L1');
INSERT INTO annee (libelle) VALUES ('L2');
INSERT INTO annee (libelle) VALUES ('L3');

INSERT INTO filiere (libelle) VALUES ('Informatique');

INSERT INTO etudiant (etu, nom, prenom, dtn) VALUES ('ETU001', 'Dupont', 'Jean', '2000-01-01');

INSERT INTO semestre (libelle, id_annee) VALUES ('S1', 1);
INSERT INTO semestre (libelle, id_annee) VALUES ('S2', 1);
INSERT INTO semestre (libelle, id_annee) VALUES ('S3', 2);
INSERT INTO semestre (libelle, id_annee) VALUES ('S4', 2);
INSERT INTO semestre (libelle, id_annee) VALUES ('S5', 3);
INSERT INTO semestre (libelle, id_annee) VALUES ('S6', 3);


INSERT INTO matiere (ue, libelle) VALUES ('UE1', 'Mathématiques');
INSERT INTO matiere (ue, libelle) VALUES ('UE2', 'Informatique');

INSERT INTO matiere_semestre (id_matiere, id_semestre, id_filiere, isoptional, degre, credit) VALUES (1, 1, 1, false, 1, 5.0);
INSERT INTO matiere_semestre (id_matiere, id_semestre, id_filiere, isoptional, degre, credit) VALUES (2, 1, 1, false, 1, 4.0);

INSERT INTO inscription (id_etudiant, id_semestre, id_filiere, date_inscription) VALUES (1, 1, 1, '2024-09-01');

INSERT INTO note_etudiant (id_etudiant, id_matiere_semestre, note, date_session) VALUES (1, 1, 15.5, '2024-06-15');
INSERT INTO note_etudiant (id_etudiant, id_matiere_semestre, note, date_session) VALUES (1, 2, 14.0, '2024-06-15');

-- Utilisateur de test
INSERT INTO user (username, password) VALUES ('admin', '$2a$10$exampleHashedPassword'); -- password: admin

INSERT INTO "user" (username, password) VALUES ('testuser', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi');