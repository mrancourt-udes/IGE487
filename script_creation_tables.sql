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
specialite, medicament, prescription, ordonnance, periode, quart_travail,
affectation
CASCADE;

DROP SEQUENCE IF EXISTS
seq_id_patient, seq_id_lit, seq_id_chambre, seq_id_unite_soin, seq_id_equipe,
seq_id_employe, seq_id_annuaire, seq_id_qualification, seq_id_specialite,
seq_id_medicament, seq_id_prescription, seq_id_orconnance, seq_id_periode,
seq_id_quart_travail, seq_id_affectation
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
  date_naissance        DATE NOT NULL,
  no_assurance_maladie  VARCHAR(12)
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
  id_unite      INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_unite_soin')
);
ALTER SEQUENCE seq_id_unite_soin
OWNED BY unite_soin.id_unite;


CREATE SEQUENCE seq_id_equipe;
CREATE TABLE equipe (
  id_equipe     INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_equipe')
);
ALTER SEQUENCE seq_id_equipe
OWNED BY equipe.id_equipe;


CREATE SEQUENCE seq_id_employe;
CREATE TABLE employe (
  id_employe    INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_employe')
);
ALTER SEQUENCE seq_id_employe
OWNED BY employe.id_employe;


CREATE SEQUENCE seq_id_annuaire;
CREATE TABLE annuaire (
  id_annuaire   INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_annuaire')
);
ALTER SEQUENCE seq_id_annuaire
OWNED BY annuaire.id_annuaire;


CREATE SEQUENCE seq_id_qualification;
CREATE TABLE qualification (
  id_qualification  INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_qualification'),
  qualification     VARCHAR(50)
);
ALTER SEQUENCE seq_id_qualification
OWNED BY qualification.id_qualification;


CREATE SEQUENCE seq_id_specialite;
CREATE TABLE specialite (
  id_specialite INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_specialite'),
  specialite    VARCHAR(50)
);
ALTER SEQUENCE seq_id_specialite
OWNED BY specialite.id_specialite;


CREATE SEQUENCE seq_id_medicament;
CREATE TABLE medicament (
  id_medicament       INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_medicament'),
  medicament          VARCHAR(50),
  -- TODO: Devrait etre dans une table independante pour eviter la redondance!!
  voie_administration VARCHAR(20),

  /* TODO: Si on pousse la logique de la quantite par prise, on devrait aussi stocker
   * l'unite par prise dans une table separe pour eviter la redondance aussi. */
  quantite_par_prise  NUMERIC(5,2)
);
ALTER SEQUENCE seq_id_medicament
OWNED BY medicament.id_medicament;


CREATE SEQUENCE seq_id_prescription;
CREATE TABLE prescription (
  id_prescription INTEGER
    PRIMARY KEY
    DEFAULT nextval('seq_id_prescription'),
  validee         NUMERIC(1),
  dose            VARCHAR(50),
  conseils        TEXT
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
  heure         TIME
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
