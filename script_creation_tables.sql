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
patient, lit, chambre, unite_soin, sejour, equipe, employe, annuaire,
qualification, specialite, medicament, format, voie_administration,
prescription, ordonnance, periode, quart_travail, affectation, patient_lit,
chambre_lit, unite_soin_chambre, equipe_unite_soin, employe_equipe,
employe_qualification, employe_specialite, medecin_traitant,
qualification_prealable, medicament_specialite, medicament_qualification,
prescription_medicament, format_medicament, voie_administration_medicament,
ordonnance_prescription, ordonnance_medecin, ordonnance_patient,
prescription_periode, periode_quart_travail, affectation_quart_travail,
employe_quart_travail, affectation_employe, error
CASCADE;

DROP SEQUENCE IF EXISTS
seq_id_patient, seq_id_lit, seq_id_chambre, seq_id_unite_soin, seq_id_equipe,
seq_id_employe, seq_id_annuaire, seq_id_qualification, seq_id_specialite,
seq_code_medicament, seq_id_format, seq_id_voie_administration,
seq_id_prescription, seq_id_ordonnance, seq_id_periode, seq_id_quart_travail,
seq_id_affectation, seq_id_error
CASCADE;

-------------------------------------------------------------------------------
-- Debut de la creation des tables
-------------------------------------------------------------------------------

CREATE SEQUENCE seq_id_lit;
CREATE TABLE lit (
  id_lit        INTEGER DEFAULT nextval('seq_id_lit')
);

CREATE SEQUENCE seq_id_chambre;
CREATE TABLE chambre (
  id_chambre    INTEGER DEFAULT nextval('seq_id_chambre')
);

CREATE SEQUENCE seq_id_unite_soin;
CREATE TABLE unite_soin (
  id_unite_soin INTEGER DEFAULT nextval('seq_id_unite_soin')
);

CREATE TABLE sejour (
  id_patient INTEGER NOT NULL,
  date_debut DATE NOT NULL,
  date_fin DATE NOT NULL,
  id_unite_soin INTEGER NOT NULL,
  id_chambre INTEGER NOT NULL,
  id_lit INTEGER NOT NULL
);

CREATE SEQUENCE seq_id_employe;
CREATE TABLE employe (
  id_employe    INTEGER DEFAULT nextval('seq_id_employe'),
  nom           VARCHAR(50) NOT NULL,
  prenom        VARCHAR(50) NOT NULL
);

CREATE SEQUENCE seq_id_patient;
CREATE TABLE patient (
  id_patient            INTEGER DEFAULT nextval('seq_id_patient'),
  nom             VARCHAR(50) NOT NULL,
  prenom          VARCHAR(50) NOT NULL,
  nom_mere        VARCHAR(50) NOT NULL,
  prenom_mere     VARCHAR(50) NOT NULL,
  date_naissance  DATE NOT NULL,
  no_assurance_maladie  VARCHAR(12) UNIQUE NOT NULL
);

CREATE SEQUENCE seq_id_equipe;
CREATE TABLE equipe (
  id_equipe     INTEGER DEFAULT nextval('seq_id_equipe'),
  id_infirmiere_chef INTEGER NOT NULL
);

CREATE SEQUENCE seq_id_annuaire;
CREATE TABLE annuaire (
  id_annuaire   INTEGER DEFAULT nextval('seq_id_annuaire'),
  id_employe       INTEGER NOT NULL,
  numero_telephone VARCHAR(14) NOT NULL

);

CREATE SEQUENCE seq_id_qualification;
CREATE TABLE qualification (
  id_qualification  INTEGER DEFAULT nextval('seq_id_qualification'),
  qualification     VARCHAR(50) NOT NULL
);

CREATE SEQUENCE seq_id_specialite;
CREATE TABLE specialite (
  id_specialite INTEGER DEFAULT nextval('seq_id_specialite'),
  specialite    VARCHAR(50) NOT NULL
);

CREATE SEQUENCE seq_code_medicament;
CREATE TABLE medicament (
  code_medicament       INTEGER DEFAULT nextval('seq_code_medicament')
);

CREATE SEQUENCE seq_id_format;
CREATE TABLE format (
  id_format     INTEGER DEFAULT nextval('seq_id_format'),
  format        NUMERIC(5,2) UNIQUE NOT NULL
);

CREATE SEQUENCE seq_id_voie_administration;
CREATE TABLE voie_administration (
  id_voie_administration INTEGER DEFAULT nextval('seq_id_voie_administration'),
  voie_administration   VARCHAR(50)
    UNIQUE
    NOT NULL
);

CREATE SEQUENCE seq_id_prescription;
CREATE TABLE prescription (
  id_prescription INTEGER DEFAULT nextval('seq_id_prescription'),
  validee                 NUMERIC(1) NOT NULL,
  date                    DATE NOT NULL,
  dose                    VARCHAR(50) NOT NULL,
  id_voie_administration  INTEGER NOT NULL,
  conseils                TEXT NOT NULL
);

CREATE SEQUENCE seq_id_ordonnance;
CREATE TABLE ordonnance (
  id_ordonnance INTEGER DEFAULT nextval('seq_id_ordonnance')
);

CREATE SEQUENCE seq_id_periode;
CREATE TABLE periode (
  id_periode    INTEGER DEFAULT nextval('seq_id_periode'),
  heure         TIME NOT NULL
);

CREATE SEQUENCE seq_id_quart_travail;
CREATE TABLE quart_travail (
  id_quart_travail  INTEGER DEFAULT nextval('seq_id_quart_travail')
);

CREATE SEQUENCE seq_id_affectation;
CREATE TABLE affectation (
  id_affectation    INTEGER DEFAULT nextval('seq_id_affectation'),
  date              DATE NOT NULL,
  urgence           SMALLINT NOT NULL
);

CREATE TABLE patient_lit (
  id_patient    INTEGER UNIQUE NOT NULL,
  id_lit        INTEGER UNIQUE NOT NULL
);

CREATE TABLE chambre_lit (
  id_chambre    INTEGER NOT NULL,
  id_lit        INTEGER UNIQUE NOT NULL
);

CREATE TABLE unite_soin_chambre (
  id_unite_soin INTEGER NOT NULL,
  id_chambre    INTEGER NOT NULL
);

CREATE TABLE equipe_unite_soin (
  id_equipe     INTEGER NOT NULL,
  id_unite_soin INTEGER NOT NULL
);

CREATE TABLE employe_equipe (
  id_equipe     INTEGER NOT NULL,
  id_employe    INTEGER NOT NULL
);

CREATE TABLE employe_qualification (
  id_employe          INTEGER NOT NULL,
  id_qualification    INTEGER NOT NULL
);

CREATE TABLE employe_specialite (
  id_employe        INTEGER NOT NULL,
  id_specialite     INTEGER NOT NULL
);

CREATE TABLE medecin_traitant (
  id_employe  INTEGER NOT NULL,
  id_patient  INTEGER NOT NULL,
  date_debut  DATE NOT NULL,
  date_fin    DATE NOT NULL
);

CREATE TABLE qualification_prealable (
  id_qualification  INTEGER NOT NULL,
  id_prealable      INTEGER NOT NULL
);

CREATE TABLE medicament_specialite (
  code_medicament INTEGER NOT NULL,
  id_specialite   INTEGER NOT NULL
);

CREATE TABLE medicament_qualification (
  code_medicament  INTEGER NOT NULL,
  id_qualification INTEGER NOT NULL
);

CREATE TABLE prescription_medicament (
  id_prescription INTEGER NOT NULL,
  code_medicament INTEGER NOT NULL
);

CREATE TABLE format_medicament (
  id_format       INTEGER NOT NULL,
  code_medicament INTEGER NOT NULL
);

CREATE TABLE voie_administration_medicament (
  id_voie_administration  INTEGER NOT NULL,
  code_medicament         INTEGER NOT NULL
);

CREATE TABLE ordonnance_prescription (
  id_ordonnance    INTEGER NOT NULL,
  id_prescription  INTEGER NOT NULL
);

CREATE TABLE ordonnance_medecin (
  id_medecin    INTEGER NOT NULL,
  id_ordonnance INTEGER NOT NULL
);

CREATE TABLE ordonnance_patient (
  id_ordonnance INTEGER NOT NULL,
  id_patient    INTEGER NOT NULL
);

CREATE TABLE prescription_periode (
  id_prescription INTEGER NOT NULL,
  id_periode      INTEGER NOT NULL
);

CREATE TABLE periode_quart_travail (
  id_periode        INTEGER NOT NULL,
  id_quart_travail  INTEGER NOT NULL
);

CREATE TABLE affectation_quart_travail (
  id_affectation    INTEGER NOT NULL,
  id_quart_travail  INTEGER NOT NULL
);

CREATE TABLE employe_quart_travail (
  id_employe        INTEGER NOT NULL,
  id_quart_travail  INTEGER NOT NULL
);

CREATE TABLE affectation_employe (
  id_affectation    INTEGER NOT NULL,
  id_employe        INTEGER NOT NULL
);

CREATE SEQUENCE seq_id_error;
CREATE TABLE error (
  code_error        INTEGER DEFAULT nextval('seq_id_error'),
  libelle_error     VARCHAR(150) NOT NULL
);

-------------------------------------------------------------------------------
-- Ajout des contraintes aux tables
-------------------------------------------------------------------------------
ALTER TABLE lit ADD PRIMARY KEY (id_lit);
ALTER SEQUENCE seq_id_lit
  OWNED BY lit.id_lit;

ALTER TABLE chambre
  ADD PRIMARY KEY (id_chambre);
ALTER SEQUENCE seq_id_chambre
  OWNED BY chambre.id_chambre;

ALTER TABLE unite_soin ADD PRIMARY KEY (id_unite_soin);
ALTER SEQUENCE seq_id_unite_soin
  OWNED BY unite_soin.id_unite_soin;

ALTER TABLE sejour ADD PRIMARY KEY (id_patient, date_debut);
ALTER TABLE sejour ADD CONSTRAINT fk_sejour1 FOREIGN KEY (id_unite_soin)
REFERENCES unite_soin (id_unite_soin);
ALTER TABLE sejour ADD CONSTRAINT fk_sejour2 FOREIGN KEY (id_chambre)
REFERENCES chambre (id_chambre);
ALTER TABLE sejour ADD CONSTRAINT fk_sejour3 FOREIGN KEY (id_lit)
REFERENCES lit (id_lit);

ALTER TABLE employe ADD PRIMARY KEY(id_employe);
ALTER SEQUENCE seq_id_employe
  OWNED BY employe.id_employe;

ALTER TABLE patient ADD PRIMARY KEY(id_patient);
ALTER TABLE patient ADD CONSTRAINT pt_date_chk CHECK (date_naissance < now()::date);
ALTER SEQUENCE seq_id_patient
  OWNED BY patient.id_patient;

ALTER TABLE equipe ADD PRIMARY KEY(id_equipe);
ALTER TABLE equipe ADD CONSTRAINT fk_equipe_infirmiere_chef FOREIGN KEY (id_infirmiere_chef)
  REFERENCES employe (id_employe);
ALTER SEQUENCE seq_id_equipe
  OWNED BY equipe.id_equipe;

ALTER TABLE annuaire ADD PRIMARY KEY(id_annuaire);
ALTER TABLE annuaire ADD CONSTRAINT fk_annuaire_employe FOREIGN KEY (id_employe)
  REFERENCES employe (id_employe);
ALTER SEQUENCE seq_id_annuaire
  OWNED BY annuaire.id_annuaire;

ALTER TABLE qualification ADD PRIMARY KEY(id_qualification);
ALTER SEQUENCE seq_id_qualification
  OWNED BY qualification.id_qualification;

ALTER TABLE specialite ADD PRIMARY KEY(id_specialite);
ALTER SEQUENCE seq_id_specialite
  OWNED BY specialite.id_specialite;

ALTER TABLE medicament ADD PRIMARY KEY(code_medicament);
ALTER SEQUENCE seq_code_medicament
  OWNED BY medicament.code_medicament;

ALTER TABLE format ADD PRIMARY KEY(id_format);
ALTER TABLE format ADD CONSTRAINT formatchk CHECK (format > 0);
ALTER SEQUENCE seq_id_format
  OWNED BY format.id_format;

ALTER TABLE voie_administration ADD PRIMARY KEY(id_voie_administration);
ALTER TABLE voie_administration ADD CONSTRAINT fk_rescription_voie_administration FOREIGN KEY (id_voie_administration)
  REFERENCES voie_administration (id_voie_administration);
ALTER SEQUENCE seq_id_voie_administration
  OWNED BY voie_administration.id_voie_administration;

ALTER TABLE prescription ADD PRIMARY KEY(id_prescription);
ALTER SEQUENCE seq_id_prescription
  OWNED BY prescription.id_prescription;

ALTER TABLE ordonnance ADD PRIMARY KEY(id_ordonnance);
ALTER SEQUENCE seq_id_ordonnance
  OWNED BY ordonnance.id_ordonnance;

ALTER TABLE periode ADD PRIMARY KEY(id_periode);
ALTER SEQUENCE seq_id_periode
  OWNED BY periode.id_periode;

ALTER TABLE quart_travail ADD PRIMARY KEY(id_quart_travail);
ALTER SEQUENCE seq_id_quart_travail
  OWNED BY quart_travail.id_quart_travail;

ALTER TABLE affectation ADD PRIMARY KEY(id_affectation);
ALTER TABLE affectation ADD CONSTRAINT urg_chk CHECK (urgence >= 0 AND urgence <= 1);
ALTER SEQUENCE seq_id_affectation
  OWNED BY affectation.id_affectation;

ALTER TABLE patient_lit ADD PRIMARY KEY (id_patient, id_lit);
ALTER TABLE patient_lit ADD CONSTRAINT fk_patient_lit1 FOREIGN KEY (id_patient)
  REFERENCES patient (id_patient);
ALTER TABLE patient_lit ADD CONSTRAINT fk_patient_lit2 FOREIGN KEY (id_lit)
  REFERENCES lit (id_lit);

ALTER TABLE chambre_lit ADD PRIMARY KEY (id_chambre, id_lit);
ALTER TABLE chambre_lit ADD CONSTRAINT fk_chambre_lit1 FOREIGN KEY (id_chambre)
  REFERENCES chambre (id_chambre);
ALTER TABLE chambre_lit ADD CONSTRAINT fk_chambre_lit2 FOREIGN KEY (id_lit)
  REFERENCES lit (id_lit);

ALTER TABLE unite_soin_chambre ADD PRIMARY KEY (id_unite_soin, id_chambre);
ALTER TABLE unite_soin_chambre ADD CONSTRAINT fk_unite_soin_chambre1 FOREIGN KEY (id_unite_soin)
  REFERENCES unite_soin (id_unite_soin);
ALTER TABLE unite_soin_chambre ADD CONSTRAINT fk_unite_soin_chambre2 FOREIGN KEY (id_chambre)
  REFERENCES chambre (id_chambre);

ALTER TABLE equipe_unite_soin ADD PRIMARY KEY (id_equipe, id_unite_soin);
ALTER TABLE equipe_unite_soin ADD CONSTRAINT fk_equipe_unite_soin1 FOREIGN KEY (id_equipe)
  REFERENCES equipe (id_equipe);
ALTER TABLE equipe_unite_soin ADD CONSTRAINT fk_equipe_unite_soin2 FOREIGN KEY (id_unite_soin)
  REFERENCES unite_soin (id_unite_soin);

ALTER TABLE employe_equipe ADD PRIMARY KEY (id_equipe, id_employe);
ALTER TABLE employe_equipe ADD CONSTRAINT fk_employe_equipe2 FOREIGN KEY (id_equipe)
  REFERENCES equipe (id_equipe);
ALTER TABLE employe_equipe ADD CONSTRAINT fk_employe_equipe1 FOREIGN KEY (id_employe)
  REFERENCES employe (id_employe);

ALTER TABLE employe_qualification ADD PRIMARY KEY (id_employe, id_qualification);
ALTER TABLE employe_qualification ADD CONSTRAINT fk_employe_qualification1 FOREIGN KEY (id_employe)
  REFERENCES employe (id_employe);
ALTER TABLE employe_qualification ADD CONSTRAINT fk_employe_qualification2 FOREIGN KEY (id_qualification)
  REFERENCES qualification (id_qualification);

ALTER TABLE employe_specialite ADD PRIMARY KEY (id_employe, id_specialite);
ALTER TABLE employe_specialite ADD CONSTRAINT fk_employe_specialite1 FOREIGN KEY (id_employe)
  REFERENCES employe (id_employe);
ALTER TABLE employe_specialite ADD CONSTRAINT fk_employe_specialite2 FOREIGN KEY (id_specialite)
  REFERENCES specialite (id_specialite);

ALTER TABLE medecin_traitant ADD PRIMARY KEY(id_employe, id_patient, date_debut);
  ALTER TABLE medecin_traitant ADD CONSTRAINT fk_medecin_traitant1 FOREIGN KEY (id_employe)
REFERENCES employe (id_employe);
  ALTER TABLE medecin_traitant ADD CONSTRAINT fk_medecin_traitant2 FOREIGN KEY (id_patient, date_debut)
REFERENCES sejour (id_patient, date_debut);

ALTER TABLE qualification_prealable ADD PRIMARY KEY (id_qualification, id_prealable);
ALTER TABLE qualification_prealable ADD CONSTRAINT fk_qualification_qualification1 FOREIGN KEY (id_qualification)
  REFERENCES qualification (id_qualification);
ALTER TABLE qualification_prealable ADD CONSTRAINT fk_qualification_qualification2 FOREIGN KEY (id_qualification)
  REFERENCES qualification (id_qualification);

ALTER TABLE medicament_specialite ADD PRIMARY KEY (code_medicament, id_specialite);
ALTER TABLE medicament_specialite ADD CONSTRAINT fk_medicament_specialite1 FOREIGN KEY (code_medicament)
  REFERENCES medicament (code_medicament);
ALTER TABLE medicament_specialite ADD CONSTRAINT fk_medicament_specialite2 FOREIGN KEY (id_specialite)
  REFERENCES specialite (id_specialite);

ALTER TABLE medicament_qualification ADD PRIMARY KEY (code_medicament, id_qualification);
ALTER TABLE medicament_qualification ADD CONSTRAINT fk_medicament_qualification1 FOREIGN KEY (code_medicament)
  REFERENCES medicament (code_medicament);
ALTER TABLE medicament_qualification ADD CONSTRAINT fk_medicament_qualification2 FOREIGN KEY (id_qualification)
  REFERENCES qualification (id_qualification);

ALTER TABLE prescription_medicament ADD PRIMARY KEY (id_prescription, code_medicament);
ALTER TABLE prescription_medicament ADD CONSTRAINT fk_prescription_medicament1 FOREIGN KEY (id_prescription)
  REFERENCES prescription (id_prescription);
ALTER TABLE prescription_medicament ADD CONSTRAINT fk_prescription_medicament2 FOREIGN KEY (code_medicament)
  REFERENCES medicament (code_medicament);

ALTER TABLE format_medicament ADD PRIMARY KEY (id_format, code_medicament);
ALTER TABLE format_medicament ADD CONSTRAINT fk_format_medicament1 FOREIGN KEY (id_format)
  REFERENCES format (id_format);
ALTER TABLE format_medicament ADD CONSTRAINT fk_format_medicament2 FOREIGN KEY (code_medicament)
  REFERENCES medicament (code_medicament);

ALTER TABLE voie_administration_medicament ADD PRIMARY KEY (id_voie_administration, code_medicament);
ALTER TABLE voie_administration_medicament ADD CONSTRAINT fk_voie_administration_medicament1 FOREIGN KEY (id_voie_administration)
  REFERENCES voie_administration (id_voie_administration);
ALTER TABLE voie_administration_medicament ADD CONSTRAINT fk_voie_administration_medicament2 FOREIGN KEY (code_medicament)
  REFERENCES medicament (code_medicament);

ALTER TABLE ordonnance_prescription ADD PRIMARY KEY (id_ordonnance, id_prescription);
ALTER TABLE ordonnance_prescription ADD CONSTRAINT fk_ordonnance_prescription1 FOREIGN KEY (id_ordonnance)
  REFERENCES ordonnance (id_ordonnance);
ALTER TABLE ordonnance_prescription ADD CONSTRAINT fk_ordonnance_prescription2 FOREIGN KEY (id_prescription)
  REFERENCES prescription (id_prescription);

ALTER TABLE ordonnance_medecin ADD PRIMARY KEY (id_medecin, id_ordonnance);
ALTER TABLE ordonnance_medecin ADD CONSTRAINT fk_employe_ordonnance1 FOREIGN KEY (id_medecin)
  REFERENCES employe (id_employe);
ALTER TABLE ordonnance_medecin ADD CONSTRAINT fk_employe_ordonnance2 FOREIGN KEY (id_ordonnance)
  REFERENCES ordonnance (id_ordonnance);

ALTER TABLE ordonnance_patient ADD PRIMARY KEY (id_ordonnance, id_patient);
ALTER TABLE ordonnance_patient ADD CONSTRAINT fk_ordonnance_patient1 FOREIGN KEY (id_ordonnance)
  REFERENCES ordonnance (id_ordonnance);
ALTER TABLE ordonnance_patient ADD CONSTRAINT fk_ordonnance_patient2 FOREIGN KEY (id_patient)
  REFERENCES patient (id_patient);

ALTER TABLE prescription_periode ADD PRIMARY KEY (id_prescription, id_periode);
ALTER TABLE prescription_periode ADD CONSTRAINT fk_prescription_periode1 FOREIGN KEY (id_prescription)
  REFERENCES prescription (id_prescription);
ALTER TABLE prescription_periode ADD CONSTRAINT fk_prescription_periode2 FOREIGN KEY (id_periode)
  REFERENCES periode (id_periode);

ALTER TABLE periode_quart_travail ADD PRIMARY KEY (id_periode, id_quart_travail);
ALTER TABLE periode_quart_travail ADD CONSTRAINT fk_periode_quart_travail1 FOREIGN KEY (id_periode)
  REFERENCES periode (id_periode);
ALTER TABLE periode_quart_travail ADD CONSTRAINT fk_periode_quart_travail2 FOREIGN KEY (id_quart_travail)
  REFERENCES quart_travail (id_quart_travail);

ALTER TABLE affectation_quart_travail ADD PRIMARY KEY (id_affectation, id_quart_travail);
ALTER TABLE affectation_quart_travail ADD CONSTRAINT fk_affectation_quart_travail1 FOREIGN KEY (id_affectation)
  REFERENCES affectation (id_affectation);
ALTER TABLE affectation_quart_travail ADD CONSTRAINT fk_affectation_quart_travail2 FOREIGN KEY (id_quart_travail)
  REFERENCES quart_travail (id_quart_travail);

ALTER TABLE employe_quart_travail ADD PRIMARY KEY(id_employe,id_quart_travail);
ALTER TABLE employe_quart_travail ADD CONSTRAINT fk_employe_quart_travail1 FOREIGN KEY (id_employe)
  REFERENCES employe (id_employe);
ALTER TABLE employe_quart_travail ADD CONSTRAINT fk_employe_quart_travail2 FOREIGN KEY (id_quart_travail)
  REFERENCES quart_travail (id_quart_travail);

ALTER TABLE affectation_employe ADD PRIMARY KEY (id_affectation, id_employe);
ALTER TABLE affectation_employe ADD CONSTRAINT fk_affectation_employe1 FOREIGN KEY (id_affectation)
  REFERENCES affectation (id_affectation);
ALTER TABLE affectation_employe ADD CONSTRAINT fk_affectation_employe2 FOREIGN KEY (id_employe)
  REFERENCES employe (id_employe);

ALTER TABLE error ADD PRIMARY KEY (code_error);