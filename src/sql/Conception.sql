-- Script SQL généré à partir des définitions .cmake
-- SGBD cible : PostgreSQL (ajustez si vous utilisez MySQL/SQLite)
create database gestion_note;
\c gestion_note;
-- Ordre de suppression (dépendances) pour permettre re-run propre

-- Tables de référence simples
CREATE TABLE annee (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL -- ex: "2024/2025"
);

CREATE TABLE filiere (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

CREATE TABLE mention (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL,
    seuil NUMERIC(5,2) NOT NULL -- seuil (ex: 10.00)
);

CREATE TABLE statut (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL,
    seuil NUMERIC(5,2) -- optionnel selon usage
);

CREATE TABLE statut_resultat (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

-- Entité principale Etudiant
CREATE TABLE etudiant (
    id SERIAL PRIMARY KEY,
    etu VARCHAR(50) NOT NULL UNIQUE, -- identifiant étudiant unique
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    dtn DATE -- date de naissance
);

-- Semestre lié à une année
CREATE TABLE semestre (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL,
    id_annee INTEGER NOT NULL REFERENCES annee(id) ON DELETE RESTRICT
);

-- Matière (peut appartenir à une UE)
CREATE TABLE matiere (
    id SERIAL PRIMARY KEY,
    ue VARCHAR(100), -- unité d'enseignement, optionnel
    libelle VARCHAR(200) NOT NULL
);
-- Options pour matières optionnelles
CREATE TABLE option(
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

-- Liaison Matiere-Semestre-Filiere avec crédits
CREATE TABLE matiere_semestre (
    id SERIAL PRIMARY KEY,
    id_matiere INTEGER NOT NULL REFERENCES matiere(id) ON DELETE CASCADE,
    id_semestre INTEGER NOT NULL REFERENCES semestre(id) ON DELETE CASCADE,
    id_filiere INTEGER NOT NULL REFERENCES filiere(id) ON DELETE RESTRICT
);

CREATE TABLE option_matiere_semestre(
    id SERIAL PRIMARY KEY,
    id_option INTEGER NOT NULL REFERENCES option(id) ON DELETE CASCADE,
    id_matiere_semestre INTEGER NOT NULL REFERENCES matiere_semestre(id) ON DELETE CASCADE,
    isOptional BOOLEAN NOT NULL DEFAULT FALSE,
    degre INTEGER DEFAULT NULL,
    credit INTEGER NOT NULL
);

-- Historique des crédits (ex : reprise, validation, date)
CREATE TABLE historique_credit (
    id SERIAL PRIMARY KEY,
    id_matiere_semestre INTEGER NOT NULL REFERENCES matiere_semestre(id) ON DELETE CASCADE,
    credit NUMERIC(5,2) NOT NULL,
    date DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Inscription d'un étudiant pour une année et une filière
CREATE TABLE inscription (
    id SERIAL PRIMARY KEY,
    id_etudiant INTEGER NOT NULL REFERENCES etudiant(id) ON DELETE CASCADE,
    id_semestre INTEGER NOT NULL REFERENCES semestre(id) ON DELETE RESTRICT,
    id_filiere INTEGER NOT NULL REFERENCES filiere(id) ON DELETE RESTRICT,
    date_inscription DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Notes des étudiants par matière_semestre
CREATE TABLE note_etudiant (
    id SERIAL PRIMARY KEY,
    id_etudiant INTEGER NOT NULL REFERENCES etudiant(id) ON DELETE CASCADE,
    id_matiere_semestre INTEGER NOT NULL REFERENCES matiere_semestre(id) ON DELETE CASCADE,
    note NUMERIC(5,2) CHECK (note >= 0 AND note <= 20),
    date_session DATE-- date ou session (ex: 2025-06-15)
);

-- Moyennes calculées (par étudiant / année / filière)
CREATE TABLE moyenne (
    id SERIAL PRIMARY KEY,
    id_etudiant INTEGER NOT NULL REFERENCES etudiant(id) ON DELETE CASCADE,
    id_semestre INTEGER NOT NULL REFERENCES semestre(id) ON DELETE RESTRICT,
    id_filiere INTEGER NOT NULL REFERENCES filiere(id) ON DELETE RESTRICT,
    moyenne NUMERIC(5,2) CHECK (moyenne >= 0 AND moyenne <= 20)
);
