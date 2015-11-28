
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

