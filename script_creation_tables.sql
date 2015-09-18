/******************************************************************************
** File: script_creation_tables.sql
** Desc: Script de creation de tables
**       Travail pratique 1 - Modélisation-conception d'une base de données
**       Dans le cadre du cours IGE-487
**       modelisation de base de donnees
** Auth: Mamadou Cellou Soto Diallo
**       Jeremy Manceaux
**       Martin Rancourt
** Date: 15-09-2015
******************************************************************************/

-------------------------------------------------------------------------------
-- Nettoyage complet de la base de donnees
-------------------------------------------------------------------------------
DROP TABLE IF EXISTS
patient, lit, chambre, unite_soin, equipe, employe, annuaire, qualification,
specialite, medicament, format, voie_administration, prescription, ordonnance,
periode, quart_travail, affectation, patient_lit, chambre_lit,
unite_soin_chambre, equipe_unite_soin, employe_equipe, employe_qualification,
employe_specialite, qualification_prealable, medicament_specialite,
medicament_qualification, prescription_medicament, format_medicament,
voie_administration_medicament, ordonnance_prescription, ordonnance_medecin,
ordonnance_patient, prescription_periode, periode_quart_travail,
affectation_quart_travail, employe_quart_travail
CASCADE;

DROP SEQUENCE IF EXISTS
seq_id_patient, seq_id_lit, seq_id_chambre, seq_id_unite_soin, seq_id_equipe,
seq_id_employe, seq_id_annuaire, seq_id_qualification, seq_id_specialite,
seq_code_medicament, seq_id_format, seq_id_voie_administration,
seq_id_prescription, seq_id_orconnance, seq_id_periode, seq_id_quart_travail,
seq_id_affectation
CASCADE;

-------------------------------------------------------------------------------
-- Debut de la creation des tables
-------------------------------------------------------------------------------

CREATE SEQUENCE seq_id_patient;
CREATE TABLE patient (
  id_patient            INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_patient'),
  nom                   VARCHAR(50) NOT NULL,
  prenom                VARCHAR(50) NOT NULL,
  nom_mere              VARCHAR(50) NOT NULL,
  prenom_mere           VARCHAR(50) NOT NULL,
  date_naissance        DATE
    CHECK (date_naissance < now()::date)
                                    NOT NULL,
  no_assurance_maladie  VARCHAR(12) NOT NULL
);
ALTER SEQUENCE seq_id_patient
OWNED BY patient.id_patient;

CREATE SEQUENCE seq_id_lit;
CREATE TABLE lit (
  id_lit        INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_lit')
);
ALTER SEQUENCE seq_id_lit
OWNED BY lit.id_lit;


CREATE SEQUENCE seq_id_chambre;
CREATE TABLE chambre (
  id_chambre    INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_chambre')
);
ALTER SEQUENCE seq_id_chambre
OWNED BY chambre.id_chambre;


CREATE SEQUENCE seq_id_unite_soin;
CREATE TABLE unite_soin (
  id_unite_soin INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_unite_soin')
);
ALTER SEQUENCE seq_id_unite_soin
OWNED BY unite_soin.id_unite_soin;

CREATE SEQUENCE seq_id_employe;
CREATE TABLE employe (
  id_employe    INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_employe'),
  nom           VARCHAR(50) NOT NULL,
  prenom        VARCHAR(50) NOT NULL
);
ALTER SEQUENCE seq_id_employe
OWNED BY employe.id_employe;

CREATE SEQUENCE seq_id_equipe;
CREATE TABLE equipe (
  id_equipe     INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_equipe'),
  id_infirmiere_chef INTEGER NOT NULL,
  CONSTRAINT fk_equipe_infirmiere_chef FOREIGN KEY (id_infirmiere_chef)
  REFERENCES employe (id_employe)

);
ALTER SEQUENCE seq_id_equipe
OWNED BY equipe.id_equipe;

CREATE SEQUENCE seq_id_annuaire;
CREATE TABLE annuaire (
  id_annuaire   INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_annuaire'),
  id_employe       INTEGER NOT NULL,
  numero_telephone VARCHAR(14) NOT NULL,
  CONSTRAINT fk_annuaire_employe FOREIGN KEY (id_employe)
  REFERENCES employe (id_employe)
);
ALTER SEQUENCE seq_id_annuaire
OWNED BY annuaire.id_annuaire;


CREATE SEQUENCE seq_id_qualification;
CREATE TABLE qualification (
  id_qualification  INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_qualification'),
  qualification     VARCHAR(50) NOT NULL
);
ALTER SEQUENCE seq_id_qualification
OWNED BY qualification.id_qualification;


CREATE SEQUENCE seq_id_specialite;
CREATE TABLE specialite (
  id_specialite INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_specialite'),
  specialite    VARCHAR(50) NOT NULL
);
ALTER SEQUENCE seq_id_specialite
OWNED BY specialite.id_specialite;


CREATE SEQUENCE seq_code_medicament;
CREATE TABLE medicament (
  code_medicament       INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_code_medicament')
);
ALTER SEQUENCE seq_code_medicament
OWNED BY medicament.code_medicament;

CREATE SEQUENCE seq_id_format;
CREATE TABLE format (
  id_format     INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_format'),
  format        NUMERIC(5,2)
    UNIQUE
    NOT NULL
    CHECK (format > 0)
);
ALTER SEQUENCE seq_id_format
OWNED BY format.id_format;

CREATE SEQUENCE seq_id_voie_administration;
CREATE TABLE voie_administration (
  id_voie_administration INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_voie_administration'),
  voie_administration   VARCHAR(50)
    UNIQUE
    NOT NULL
);
ALTER SEQUENCE seq_id_voie_administration
OWNED BY voie_administration.id_voie_administration;

CREATE SEQUENCE seq_id_prescription;
CREATE TABLE prescription (
  id_prescription INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_prescription'),
  validee         NUMERIC(1) NOT NULL,
  date            DATE NOT NULL,
  dose            VARCHAR(50) NOT NULL,
  conseils        TEXT NOT NULL
);
ALTER SEQUENCE seq_id_prescription
OWNED BY prescription.id_prescription;


CREATE SEQUENCE seq_id_ordonnance;
CREATE TABLE ordonnance (
  id_ordonnance INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_ordonnance')
);
ALTER SEQUENCE seq_id_ordonnance
OWNED BY ordonnance.id_ordonnance;


CREATE SEQUENCE seq_id_periode;
CREATE TABLE periode (
  id_periode    INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_periode'),
  heure         TIME NOT NULL
);
ALTER SEQUENCE seq_id_periode
OWNED BY periode.id_periode;


CREATE SEQUENCE seq_id_quart_travail;
CREATE TABLE quart_travail (
  id_quart_travail  INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_quart_travail')
);
ALTER SEQUENCE seq_id_quart_travail
OWNED BY quart_travail.id_quart_travail;


CREATE SEQUENCE seq_id_affectation;
CREATE TABLE affectation (
  id_affectation    INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_affectation')
);
ALTER SEQUENCE seq_id_affectation
OWNED BY affectation.id_affectation;

CREATE TABLE patient_lit (
  id_patient    INTEGER NOT NULL,
  id_lit        INTEGER NOT NULL,
  CONSTRAINT fk_patient_lit1 FOREIGN KEY (id_patient)
  REFERENCES patient (id_patient),
  CONSTRAINT fk_patient_lit2 FOREIGN KEY (id_lit)
  REFERENCES lit (id_lit)
);

CREATE TABLE chambre_lit (
  id_chambre    INTEGER NOT NULL,
  id_lit        INTEGER NOT NULL,
  CONSTRAINT fk_chambre_lit1 FOREIGN KEY (id_chambre)
  REFERENCES chambre (id_chambre),
  CONSTRAINT fk_chambre_lit2 FOREIGN KEY (id_lit)
  REFERENCES lit (id_lit)
);

CREATE TABLE unite_soin_chambre (
  id_unite_soin INTEGER NOT NULL,
  id_chambre    INTEGER NOT NULL,
  CONSTRAINT fk_unite_soin_chambre1 FOREIGN KEY (id_unite_soin)
  REFERENCES unite_soin (id_unite_soin),
  CONSTRAINT fk_unite_soin_chambre2 FOREIGN KEY (id_chambre)
  REFERENCES chambre (id_chambre)
);

CREATE TABLE equipe_unite_soin (
  id_equipe     INTEGER NOT NULL,
  id_unite_soin INTEGER NOT NULL,
  CONSTRAINT fk_equipe_unite_soin1 FOREIGN KEY (id_equipe)
  REFERENCES equipe (id_equipe),
  CONSTRAINT fk_equipe_unite_soin2 FOREIGN KEY (id_unite_soin)
  REFERENCES unite_soin (id_unite_soin)
);

CREATE TABLE employe_equipe (
  id_employe    INTEGER NOT NULL,
  id_equipe     INTEGER NOT NULL,
  CONSTRAINT fk_employe_equipe1 FOREIGN KEY (id_employe)
  REFERENCES employe (id_employe),
  CONSTRAINT fk_employe_equipe2 FOREIGN KEY (id_equipe)
  REFERENCES equipe (id_equipe)
);

CREATE TABLE employe_qualification (
  id_employe    INTEGER NOT NULL,
  id_qualification    INTEGER NOT NULL,
  CONSTRAINT fk_employe_qualification1 FOREIGN KEY (id_employe)
  REFERENCES employe (id_employe),
  CONSTRAINT fk_employe_qualification2 FOREIGN KEY (id_qualification)
  REFERENCES qualification (id_qualification)
);

CREATE TABLE employe_specialite (
  id_employe    INTEGER NOT NULL,
  id_specialite    INTEGER NOT NULL,
  CONSTRAINT fk_employe_specialite1 FOREIGN KEY (id_employe)
  REFERENCES employe (id_employe),
  CONSTRAINT fk_employe_specialite2 FOREIGN KEY (id_specialite)
  REFERENCES specialite (id_specialite)
);

CREATE TABLE qualification_prealable (
  id_qualification    INTEGER NOT NULL,
  id_prealable    INTEGER NOT NULL,
  CONSTRAINT fk_qualification_qualification1 FOREIGN KEY (id_qualification)
  REFERENCES qualification (id_qualification),
  CONSTRAINT fk_qualification_qualification2 FOREIGN KEY (id_qualification)
  REFERENCES qualification (id_qualification)
);

CREATE TABLE medicament_specialite (
  code_medicament    INTEGER NOT NULL,
  id_specialite    INTEGER NOT NULL,
  CONSTRAINT fk_medicament_specialite1 FOREIGN KEY (code_medicament)
  REFERENCES medicament (code_medicament),
  CONSTRAINT fk_medicament_specialite2 FOREIGN KEY (id_specialite)
  REFERENCES specialite (id_specialite)
);

CREATE TABLE medicament_qualification (
  code_medicament    INTEGER NOT NULL,
  id_qualification INTEGER NOT NULL,
  CONSTRAINT fk_medicament_qualification1 FOREIGN KEY (code_medicament)
  REFERENCES medicament (code_medicament),
  CONSTRAINT fk_medicament_qualification2 FOREIGN KEY (id_qualification)
  REFERENCES qualification (id_qualification)
);

CREATE TABLE prescription_medicament (
  id_prescription  INTEGER NOT NULL,
  code_medicament    INTEGER NOT NULL,
  CONSTRAINT fk_prescription_medicament1 FOREIGN KEY (id_prescription)
  REFERENCES prescription (id_prescription),
  CONSTRAINT fk_prescription_medicament2 FOREIGN KEY (code_medicament)
  REFERENCES medicament (code_medicament)
);

CREATE TABLE format_medicament (
  id_format    INTEGER NOT NULL,
  code_medicament    INTEGER NOT NULL,
  CONSTRAINT fk_format_medicament1 FOREIGN KEY (id_format)
  REFERENCES format (id_format),
  CONSTRAINT fk_format_medicament2 FOREIGN KEY (code_medicament)
  REFERENCES medicament (code_medicament)
);

CREATE TABLE voie_administration_medicament (
  id_voie_administration    INTEGER NOT NULL,
  code_medicament    INTEGER NOT NULL,
  CONSTRAINT fk_voie_administration_medicament1 FOREIGN KEY (id_voie_administration)
  REFERENCES voie_administration (id_voie_administration),
  CONSTRAINT fk_voie_administration_medicament2 FOREIGN KEY (code_medicament)
  REFERENCES medicament (code_medicament)
);

CREATE TABLE ordonnance_prescription (
  id_ordonnance    INTEGER NOT NULL,
  id_prescription    INTEGER NOT NULL,
  CONSTRAINT fk_ordonnance_prescription1 FOREIGN KEY (id_ordonnance)
  REFERENCES ordonnance (id_ordonnance),
  CONSTRAINT fk_ordonnance_prescription2 FOREIGN KEY (id_prescription)
  REFERENCES prescription (id_prescription)
);

CREATE TABLE ordonnance_medecin (
  id_medecin    INTEGER NOT NULL,
  id_ordonnance    INTEGER NOT NULL,
  CONSTRAINT fk_employe_ordonnance1 FOREIGN KEY (id_medecin)
  REFERENCES employe (id_employe),
  CONSTRAINT fk_employe_ordonnance2 FOREIGN KEY (id_ordonnance)
  REFERENCES ordonnance (id_ordonnance)
);

CREATE TABLE ordonnance_patient (
  id_ordonnance    INTEGER NOT NULL,
  id_patient    INTEGER NOT NULL,
  CONSTRAINT fk_ordonnance_patient1 FOREIGN KEY (id_ordonnance)
  REFERENCES ordonnance (id_ordonnance),
  CONSTRAINT fk_ordonnance_patient2 FOREIGN KEY (id_patient)
  REFERENCES patient (id_patient)
);

CREATE TABLE prescription_periode (
  id_prescription    INTEGER NOT NULL,
  id_periode    INTEGER NOT NULL,
  CONSTRAINT fk_prescription_periode1 FOREIGN KEY (id_prescription)
  REFERENCES prescription (id_prescription),
  CONSTRAINT fk_prescription_periode2 FOREIGN KEY (id_periode)
  REFERENCES periode (id_periode)
);

CREATE TABLE periode_quart_travail (
  id_periode    INTEGER NOT NULL,
  id_quart_travail    INTEGER NOT NULL,
  CONSTRAINT fk_periode_quart_travail1 FOREIGN KEY (id_periode)
  REFERENCES periode (id_periode),
  CONSTRAINT fk_periode_quart_travail2 FOREIGN KEY (id_quart_travail)
  REFERENCES quart_travail (id_quart_travail)
);

CREATE TABLE affectation_quart_travail (
  id_affectation    INTEGER NOT NULL,
  id_quart_travail    INTEGER NOT NULL,
  CONSTRAINT fk_affectation_quart_travail1 FOREIGN KEY (id_affectation)
  REFERENCES affectation (id_affectation),
  CONSTRAINT fk_affectation_quart_travail2 FOREIGN KEY (id_quart_travail)
  REFERENCES quart_travail (id_quart_travail)
);

CREATE TABLE employe_quart_travail (
  id_employe    INTEGER NOT NULL,
  id_quart_travail    INTEGER NOT NULL,
  CONSTRAINT fk_employe_quart_travail1 FOREIGN KEY (id_employe)
  REFERENCES employe (id_employe),
  CONSTRAINT fk_employe_quart_travail2 FOREIGN KEY (id_quart_travail)
  REFERENCES quart_travail (id_quart_travail)
);