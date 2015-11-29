/******************************************************************************
** File: ige487_dim.sql
** Desc: Script de creation de tables
**       Travail pratique 3 - Conception d'un entrepôt de données dimensionnel
**       Dans le cadre du cours IGE-487
**       modelisation de base de donnees
** Auth: Jeremy Manceaux
**       Martin Rancourt
**       Mamadou Cellou Soto Diallo

** Date: 28-11-2015
******************************************************************************/


-- CREATIONS DES TABLES DE DIMENSION

CREATE SEQUENCE seq_code_employe;
CREATE TABLE employe (
  code_employe    INTEGER PRIMARY KEY DEFAULT nextval('seq_code_employe'),
  id_employe         INTEGER NOT NULL,
  nom           VARCHAR(50) NOT NULL,
  prenom        VARCHAR(50) NOT NULL
);

CREATE SEQUENCE seq_code_patient;
CREATE TABLE patient (
  code_patient    INTEGER PRIMARY KEY UNIQUE DEFAULT nextval('seq_code_patient'),
  id_patient      INTEGER NOT NULL,
  nom             VARCHAR(50) NOT NULL,
  prenom          VARCHAR(50) NOT NULL,
  nom_mere        VARCHAR(50) NOT NULL,
  prenom_mere     VARCHAR(50) NOT NULL,
  date_naissance  DATE NOT NULL,
  no_assurance_maladie  VARCHAR(12) UNIQUE NOT NULL
);

CREATE SEQUENCE seq_code_sejour;
CREATE TABLE sejour (
  code_sejour    INTEGER PRIMARY KEY UNIQUE DEFAULT nextval('seq_code_sejour'),
  id_patient INTEGER NOT NULL,
  date_debut DATE NOT NULL,
  date_fin DATE NOT NULL
);

CREATE SEQUENCE seq_id_medicament;
CREATE TABLE medicament (
  id_medicament       INTEGER PRIMARY KEY DEFAULT nextval('seq_id_medicament'),
  code_medicament     INTEGER NOT NULL
);

CREATE SEQUENCE seq_code_affectation;
CREATE TABLE affectation (
  code_affectation    INTEGER PRIMARY KEY DEFAULT nextval('seq_code_affectation'),
  id_affectation      INTEGER NOT NULL,
  date              DATE NOT NULL,
  urgence           SMALLINT NOT NULL
);

CREATE SEQUENCE seq_code_prescription;
CREATE TABLE prescription (
  code_prescription         INTEGER PRIMARY KEY UNIQUE DEFAULT nextval('seq_code_prescription'),
  id_prescription           INTEGER NOT NULL,
  dose                    VARCHAR(50) NOT NULL,
  conseils                TEXT NOT NULL
);

CREATE SEQUENCE seq_code_quart_travail;
CREATE TABLE quart_travail (
  code_quart_travail      INTEGER PRIMARY KEY UNIQUE DEFAULT nextval('seq_code_quart_travail'),
  id_quart_travail        INTEGER NOT NULL
);

-- CREATION DES TABLES DE FAIT

CREATE TABLE prescription_fact (
  code_patient               INTEGER,
  code_prescription          INTEGER,
  code_employe               INTEGER,
  code_medicament            INTEGER,
  PRIMARY KEY(code_patient, code_prescription, code_employe; code_medicament)
);


CREATE TABLE admission_fact (
  code_patient INTEGER,
  code_employe INTEGER,
  code_sejour  INTEGER,
  PRIMARY KEY (code_patient, code_employe, code_sejour),
  duree       INTEGER
);

CREATE TABLE medecin_traitant_fact (
  code_employe INTEGER,
  code_patient INTEGER,
  PRIMARY KEY (code_employe, code_patient)
);

CREATE TABLE plannification_affectation_fact(
  code_employe INTEGER,
  code_quart_travail INTEGER,
  code_affectation INTEGER,
  PRIMARY KEY (code_employe, code_quart_travail, code_affectation),
  nbre_heure INTEGER
);
