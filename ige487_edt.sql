/******************************************************************************
** File: ige487_edt.sql
** Desc: Script de creation du schéma d’entrepôt de données temporalisé
**       Travail pratique 4 - Modélisation-conception d'une base de données
**       Dans le cadre du cours IGE-487
**       modelisation de base de donnees
** Auth: Mamadou Cellou Soto Diallo
**       Jeremy Manceaux
**       Martin Rancourt
** Date: 17-12-2015
******************************************************************************/

-------------------------------------------------------------------------------
-- Nettoyage complet de la base de donnees
-------------------------------------------------------------------------------
DROP TABLE IF EXISTS
employe_nom_during,employe_prenom_during,
patient_since,patient_during,patient_nom_during,patient_prenom_during,
patient_nom_mere_during,patient_prenom_mere_during,patient_date_naissance_during,
patient_no_assurance_maladie_during,sejour_since,sejour_during,sejour_id_unite_soin_during,
chambre_since,
unite_soin_since,employe_since,employe_during,sejour_id_chambre_during,
sejour_id_lit_during,equipe_since,equipe_during,equipe_id_infirmiere_chef_during,
annuaire_since,annuaire_during,annuaire_id_employe_during,
annuaire_numero_telephone_during,qualification_since,qualification_during,
qualification_qualification_during,specialite_since,specialite_during,
specialite_specialite_during,medicament_since,medicament_during,format_since,
format_during,format_format_during,voie_administration_since,
voie_administration_during,voie_administration_voie_administration_during,
prescription_since,prescription_during,prescription_validee_during,
prescription_dose_during,prescription_id_voie_administration_during,
prescription_conseils_during,ordonnance_since,ordonnance_during,
ordonnance_id_employe_during,ordonnance_id_patient_during,
ordonnance_date_emission_during,periode_since,
periode_during,periode_heure_during,quart_travail_since,quart_travail_during,
affectation_since,affectation_during,affectation_date_during,affectation_urgence_during,
chambre_lit_since,chambre_lit_during,unite_soin_chambre_since,unite_soin_chambre_during,
equipe_unite_soin_since,equipe_unite_soin_during,employe_equipe_since,
employe_equipe_during,employe_qualification_since,employe_qualification_during,
employe_specialite_since,employe_specialite_during,medecin_traitant_since,
medecin_traitant_during,qualification_prealable_since,
qualification_prealable_during,medicament_specialite_since,medicament_specialite_during,
medicament_qualification_since,medicament_qualification_during,prescription_medicament_since,
prescription_medicament_during,format_medicament_since,format_medicament_during,
voie_administration_medicament_since,voie_administration_medicament_during,
prescription_periode_since,prescription_periode_during,periode_quart_travail_since,
periode_quart_travail_during,affectation_quart_travail_since,
affectation_quart_travail_during,employe_quart_travail_since,employe_quart_travail_during,
affectation_employe_since,affectation_employe_during,error_since,error_during,
error_libelle_error_during,lit_since,lit_during,chambre_during,unite_soin_during
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

--------------------lit--------------------

CREATE SEQUENCE seq_id_lit;
CREATE TABLE lit_SINCE (
  id_lit        INTEGER DEFAULT nextval('seq_id_lit'),
	lit_since	DATE NOT NULL
);

CREATE TABLE lit_DURING (
  id_lit        INTEGER DEFAULT nextval('seq_id_lit'),
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------chambre--------------------

CREATE SEQUENCE seq_id_chambre;
CREATE TABLE chambre_SINCE (
  id_chambre    INTEGER DEFAULT nextval('seq_id_chambre'),
	chambre_since	DATE NOT NULL
);

CREATE TABLE chambre_DURING (
  id_chambre    INTEGER DEFAULT nextval('seq_id_chambre'),
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------unite_soin--------------------

CREATE SEQUENCE seq_id_unite_soin;
CREATE TABLE unite_soin_SINCE (
  id_unite_soin INTEGER DEFAULT nextval('seq_id_unite_soin'),
	unite_soin_since	DATE NOT NULL
);

CREATE TABLE unite_soin_DURING (
  id_unite_soin INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------employe--------------------

CREATE SEQUENCE seq_id_employe;
CREATE TABLE employe_SINCE (
  id_employe    INTEGER DEFAULT nextval('seq_id_employe'),
	employe_since	DATE NOT NULL,
  nom           VARCHAR(50) NOT NULL,
	nom_since	DATE,
  prenom        VARCHAR(50) NOT NULL,
	prenom_since	DATE
);

CREATE TABLE employe_DURING (
  id_employe    INTEGER DEFAULT nextval('seq_id_employe'),
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE employe_nom_DURING (
  id_employe    INTEGER DEFAULT nextval('seq_id_employe'),
  nom           VARCHAR(50) NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE employe_prenom_DURING (
  id_employe    INTEGER DEFAULT nextval('seq_id_employe'),
  prenom        VARCHAR(50) NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------patient--------------------

CREATE SEQUENCE seq_id_patient;
CREATE TABLE patient_SINCE (
  id_patient      INTEGER UNIQUE DEFAULT nextval('seq_id_patient'),
	patient_since	DATE NOT NULL,
  nom             VARCHAR(50) NOT NULL,
	nom_since	DATE,
  prenom          VARCHAR(50) NOT NULL,
	prenom_since	DATE,
  nom_mere        VARCHAR(50) NOT NULL,
	nom_mere_since	DATE,
  prenom_mere     VARCHAR(50) NOT NULL,
	prenom_mere_since	DATE,
  date_naissance  DATE NOT NULL,
	date_naissance_since	DATE,
  no_assurance_maladie  VARCHAR(12) UNIQUE NOT NULL,
	no_assurance_maladie_since	DATE
);

CREATE TABLE patient_DURING (
  id_patient      INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE patient_nom_DURING (
  id_patient      INTEGER NOT NULL,
  nom             VARCHAR(50) NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE patient_prenom_DURING (
  id_patient      INTEGER NOT NULL,
  prenom          VARCHAR(50) NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE patient_nom_mere_DURING (
  id_patient      INTEGER NOT NULL,
  nom_mere        VARCHAR(50) NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE patient_prenom_mere_DURING (
  id_patient      INTEGER NOT NULL,
  prenom_mere     VARCHAR(50) NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE patient_date_naissance_DURING (
  id_patient      INTEGER NOT NULL,
  date_naissance  DATE NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE patient_no_assurance_maladie_DURING (
  id_patient      INTEGER NOT NULL,
  no_assurance_maladie  VARCHAR(12) NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------sejour--------------------

CREATE TABLE sejour_SINCE (
  id_patient INTEGER NOT NULL,
	sejour_since	DATE NOT NULL,
  id_unite_soin INTEGER NOT NULL,
	id_unite_soin_since	DATE,
  id_chambre INTEGER NOT NULL,
	id_chambre_since	DATE,
  id_lit INTEGER NOT NULL,
	id_lit_since	DATE
);

CREATE TABLE sejour_DURING (
  id_patient INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE sejour_id_unite_soin_DURING (
  id_patient INTEGER NOT NULL,
  id_unite_soin INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE sejour_id_chambre_DURING (
  id_patient INTEGER NOT NULL,
  id_chambre INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE sejour_id_lit_DURING (
  id_patient INTEGER NOT NULL,
  id_lit INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------equipe--------------------

CREATE SEQUENCE seq_id_equipe;
CREATE TABLE equipe_SINCE (
  id_equipe     INTEGER DEFAULT nextval('seq_id_equipe'),
	equipe_since	DATE NOT NULL,
  id_infirmiere_chef INTEGER NOT NULL,
	id_infirmiere_chef_since	DATE
);

CREATE TABLE equipe_DURING (
  id_equipe     INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE equipe_id_infirmiere_chef_DURING (
  id_equipe     INTEGER NOT NULL,
  id_infirmiere_chef INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------annuaire--------------------

CREATE SEQUENCE seq_id_annuaire;
CREATE TABLE annuaire_SINCE (
  id_annuaire   INTEGER DEFAULT nextval('seq_id_annuaire'),
	annuaire_since	DATE NOT NULL,
  id_employe       INTEGER NOT NULL,
	id_employe_since	DATE,
  numero_telephone VARCHAR(14) NOT NULL,
	numero_telephone_since	DATE
);

CREATE TABLE annuaire_DURING (
  id_annuaire   INTEGER NOT NULL ,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE annuaire_id_employe_DURING (
  id_annuaire   INTEGER NOT NULL ,
  id_employe       INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE annuaire_numero_telephone_DURING (
  id_annuaire   INTEGER NOT NULL,
  numero_telephone VARCHAR(14) NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------qualification--------------------

CREATE SEQUENCE seq_id_qualification;
CREATE TABLE qualification_SINCE (
  id_qualification  INTEGER DEFAULT nextval('seq_id_qualification'),
  qualification     VARCHAR(50) NOT NULL,
	qualification_since	DATE NOT NULL
);

CREATE TABLE qualification_DURING (
  id_qualification  INTEGER NOT NULL ,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE qualification_qualification_DURING (
  id_qualification  INTEGER NOT NULL ,
  qualification     VARCHAR(50) NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------specialite--------------------

CREATE SEQUENCE seq_id_specialite;
CREATE TABLE specialite_SINCE (
  id_specialite INTEGER DEFAULT nextval('seq_id_specialite'),
  specialite    VARCHAR(50) NOT NULL,
	specialite_since	DATE NOT NULL
);

CREATE TABLE specialite_DURING (
  id_specialite INTEGER NOT NULL ,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE specialite_specialite_DURING (
  id_specialite INTEGER NOT NULL ,
  specialite    VARCHAR(50) NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------medicament--------------------

CREATE SEQUENCE seq_code_medicament;
CREATE TABLE medicament_SINCE (
  code_medicament       INTEGER DEFAULT nextval('seq_code_medicament'),
	medicament_since	DATE NOT NULL
);

CREATE TABLE medicament_DURING (
  code_medicament       INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------format--------------------

CREATE SEQUENCE seq_id_format;
CREATE TABLE format_SINCE (
  id_format     INTEGER DEFAULT nextval('seq_id_format'),
  format        NUMERIC(5,2) UNIQUE NOT NULL,
	format_since	DATE NOT NULL
);

CREATE TABLE format_DURING (
  id_format     INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE format_format_DURING (
  id_format     INTEGER NOT NULL,
  format        NUMERIC(5,2) NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------voie_administration--------------------

CREATE SEQUENCE seq_id_voie_administration;
CREATE TABLE voie_administration_SINCE (
  id_voie_administration INTEGER DEFAULT nextval('seq_id_voie_administration'),
  voie_administration   VARCHAR(50),
	voie_administration_since	DATE NOT NULL
);

CREATE TABLE voie_administration_DURING (
  id_voie_administration INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE voie_administration_voie_administration_DURING (
  id_voie_administration INTEGER NOT NULL,
  voie_administration   VARCHAR(50),
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------prescription--------------------

CREATE SEQUENCE seq_id_prescription;
CREATE TABLE prescription_SINCE (
  id_prescription         INTEGER UNIQUE DEFAULT nextval('seq_id_prescription'),
  id_ordonnance           INTEGER NOT NULL,
	prescription_since	DATE NOT NULL,
  validee                 NUMERIC(1) NOT NULL,
	validee_since	DATE,
  dose                    VARCHAR(50) NOT NULL,
	dose_since	DATE,
  id_voie_administration  INTEGER NOT NULL,
	id_voie_administration_since	DATE,
  conseils                TEXT NOT NULL,
	conseils_since	DATE
);

CREATE TABLE prescription_DURING (
  id_prescription         INTEGER NOT NULL,
  id_ordonnance           INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE prescription_validee_DURING (
  id_prescription         INTEGER NOT NULL,
  id_ordonnance           INTEGER NOT NULL,
  validee                 NUMERIC(1) NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE prescription_dose_DURING (
  id_prescription         INTEGER NOT NULL,
  id_ordonnance           INTEGER NOT NULL,
  dose                    VARCHAR(50) NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE prescription_id_voie_administration_DURING (
  id_prescription         INTEGER NOT NULL,
  id_ordonnance           INTEGER NOT NULL,
  id_voie_administration  INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE prescription_conseils_DURING (
  id_prescription         INTEGER NOT NULL,
  id_ordonnance           INTEGER NOT NULL,
  conseils                TEXT NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------ordonnance--------------------

CREATE SEQUENCE seq_id_ordonnance;
CREATE TABLE ordonnance_SINCE (
  id_ordonnance INTEGER UNIQUE DEFAULT nextval('seq_id_ordonnance'),
	ordonnance_since	DATE NOT NULL,
  id_employe    INTEGER NOT NULL,
	id_employe_since	DATE,
  id_patient    INTEGER NOT NULL,
	id_patient_since	DATE
);

CREATE TABLE ordonnance_DURING (
  id_ordonnance INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE ordonnance_id_employe_DURING (
  id_ordonnance INTEGER NOT NULL,
  id_employe    INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE ordonnance_id_patient_DURING (
  id_ordonnance INTEGER NOT NULL,
  id_patient    INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE ordonnance_date_emission_DURING (
  id_ordonnance INTEGER NOT NULL,
  date_emission DATE NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------periode--------------------

CREATE SEQUENCE seq_id_periode;
CREATE TABLE periode_SINCE (
  id_periode    INTEGER DEFAULT nextval('seq_id_periode'),
	periode_since	DATE NOT NULL,
  heure         TIME NOT NULL,
	heure_since	DATE
);

CREATE TABLE periode_DURING (
  id_periode    INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE periode_heure_DURING (
  id_periode    INTEGER NOT NULL,
  heure         TIME NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------quart_travail--------------------

CREATE SEQUENCE seq_id_quart_travail;
CREATE TABLE quart_travail_SINCE (
  id_quart_travail  INTEGER DEFAULT nextval('seq_id_quart_travail'),
	quart_travail_since	DATE NOT NULL
);

CREATE TABLE quart_travail_DURING (
  id_quart_travail  INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------affectation--------------------

CREATE SEQUENCE seq_id_affectation;
CREATE TABLE affectation_SINCE (
  id_affectation    INTEGER DEFAULT nextval('seq_id_affectation'),
	affectation_since	DATE NOT NULL,
  date              DATE NOT NULL,
	date_since	DATE,
  urgence           SMALLINT NOT NULL,
	urgence_since	DATE
);

CREATE TABLE affectation_DURING (
  id_affectation    INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE affectation_date_DURING (
  id_affectation    INTEGER NOT NULL,
  date              DATE NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE affectation_urgence_DURING (
  id_affectation    INTEGER NOT NULL,
  urgence           SMALLINT NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------chambre_lit--------------------

CREATE TABLE chambre_lit_SINCE (
  id_chambre    INTEGER NOT NULL,
  id_lit        INTEGER NOT NULL,
	chambre_lit_since	DATE NOT NULL
);

CREATE TABLE chambre_lit_DURING (
  id_chambre    INTEGER NOT NULL,
  id_lit        INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------unite_soin_chambre--------------------

CREATE TABLE unite_soin_chambre_SINCE (
  id_unite_soin INTEGER NOT NULL,
  id_chambre    INTEGER NOT NULL,
	unite_soin_chambre_since	DATE NOT NULL
);

CREATE TABLE unite_soin_chambre_DURING (
  id_unite_soin INTEGER NOT NULL,
  id_chambre    INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------equipe_unite_soin--------------------

CREATE TABLE equipe_unite_soin_SINCE (
  id_equipe     INTEGER NOT NULL,
  id_unite_soin INTEGER NOT NULL,
	equipe_unite_soin_since	DATE NOT NULL
);

CREATE TABLE equipe_unite_soin_DURING (
  id_equipe     INTEGER NOT NULL,
  id_unite_soin INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------employe_equipe--------------------

CREATE TABLE employe_equipe_SINCE (
  id_equipe     INTEGER NOT NULL,
  id_employe    INTEGER NOT NULL,
	employe_equipe_since	DATE NOT NULL
);

CREATE TABLE employe_equipe_DURING (
  id_equipe     INTEGER NOT NULL,
  id_employe    INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------employe_qualification--------------------

CREATE TABLE employe_qualification_SINCE (
  id_employe          INTEGER NOT NULL,
  id_qualification    INTEGER NOT NULL,
	employe_qualification_since	DATE NOT NULL
);

CREATE TABLE employe_qualification_DURING (
  id_employe          INTEGER NOT NULL,
  id_qualification    INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------employe_specialite--------------------

CREATE TABLE employe_specialite_SINCE (
  id_employe        INTEGER NOT NULL,
  id_specialite     INTEGER NOT NULL,
	employe_specialite_since	DATE NOT NULL
);

CREATE TABLE employe_specialite_DURING (
  id_employe        INTEGER NOT NULL,
  id_specialite     INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------medecin_traitant--------------------

CREATE TABLE medecin_traitant_SINCE (
  id_employe  INTEGER NOT NULL,
  id_patient  INTEGER NOT NULL,
	medecin_traitant_since	DATE NOT NULL
);

CREATE TABLE medecin_traitant_DURING (
  id_employe  INTEGER NOT NULL,
  id_patient  INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------qualification_prealable--------------------

CREATE TABLE qualification_prealable_SINCE (
  id_qualification  INTEGER NOT NULL,
  id_prealable      INTEGER NOT NULL,
	qualification_prealable_since	DATE NOT NULL
);

CREATE TABLE qualification_prealable_DURING (
  id_qualification  INTEGER NOT NULL,
  id_prealable      INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------medicament_specialite--------------------

CREATE TABLE medicament_specialite_SINCE (
  code_medicament INTEGER NOT NULL,
  id_specialite   INTEGER NOT NULL,
	medicament_specialite_since	DATE NOT NULL
);

CREATE TABLE medicament_specialite_DURING (
  code_medicament INTEGER NOT NULL,
  id_specialite   INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------medicament_qualification--------------------

CREATE TABLE medicament_qualification_SINCE (
  code_medicament  INTEGER NOT NULL,
  id_qualification INTEGER NOT NULL,
	medicament_qualification_since	DATE NOT NULL
);

CREATE TABLE medicament_qualification_DURING (
  code_medicament  INTEGER NOT NULL,
  id_qualification INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------prescription_medicament--------------------

CREATE TABLE prescription_medicament_SINCE (
  id_prescription INTEGER NOT NULL,
  code_medicament INTEGER NOT NULL,
	prescription_medicament_since	DATE NOT NULL
);

CREATE TABLE prescription_medicament_DURING (
  id_prescription INTEGER NOT NULL,
  code_medicament INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------format_medicament--------------------

CREATE TABLE format_medicament_SINCE (
  id_format       INTEGER NOT NULL,
  code_medicament INTEGER NOT NULL,
	format_medicament_since	DATE NOT NULL
);

CREATE TABLE format_medicament_DURING (
  id_format       INTEGER NOT NULL,
  code_medicament INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------voie_administration_medicament--------------------

CREATE TABLE voie_administration_medicament_SINCE (
  id_voie_administration  INTEGER NOT NULL,
  code_medicament         INTEGER NOT NULL,
	voie_administration_medicament_since	DATE NOT NULL
);

CREATE TABLE voie_administration_medicament_DURING (
  id_voie_administration  INTEGER NOT NULL,
  code_medicament         INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------prescription_periode--------------------

CREATE TABLE prescription_periode_SINCE (
  id_prescription INTEGER NOT NULL,
  id_periode      INTEGER NOT NULL,
	prescription_periode_since	DATE NOT NULL
);

CREATE TABLE prescription_periode_DURING (
  id_prescription INTEGER NOT NULL,
  id_periode      INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------periode_quart_travail--------------------

CREATE TABLE periode_quart_travail_SINCE (
  id_periode        INTEGER NOT NULL,
  id_quart_travail  INTEGER NOT NULL,
	periode_quart_travail_since	DATE NOT NULL
);

CREATE TABLE periode_quart_travail_DURING (
  id_periode        INTEGER NOT NULL,
  id_quart_travail  INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------affectation_quart_travail--------------------

CREATE TABLE affectation_quart_travail_SINCE (
  id_affectation    INTEGER NOT NULL,
  id_quart_travail  INTEGER NOT NULL,
	affectation_quart_travail_since	DATE NOT NULL
);

CREATE TABLE affectation_quart_travail_DURING (
  id_affectation    INTEGER NOT NULL,
  id_quart_travail  INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------employe_quart_travail--------------------

CREATE TABLE employe_quart_travail_SINCE (
  id_employe        INTEGER NOT NULL,
  id_quart_travail  INTEGER NOT NULL,
	employe_quart_travail_since	DATE NOT NULL
);

CREATE TABLE employe_quart_travail_DURING (
  id_employe        INTEGER NOT NULL,
  id_quart_travail  INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------affectation_employe--------------------

CREATE TABLE affectation_employe_SINCE (
  id_affectation    INTEGER NOT NULL,
  id_employe        INTEGER NOT NULL,
	affectation_employe_since	DATE NOT NULL
);

CREATE TABLE affectation_employe_DURING (
  id_affectation    INTEGER NOT NULL,
  id_employe        INTEGER NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

--------------------error--------------------

CREATE SEQUENCE seq_id_error;
CREATE TABLE error_SINCE (
  code_error        INTEGER DEFAULT nextval('seq_id_error'),
	error_since	DATE NOT NULL,
  libelle_error     VARCHAR(150) NOT NULL,
	libelle_error_since	DATE
);

CREATE TABLE error_DURING (
  code_error        INTEGER DEFAULT nextval('seq_id_error'),
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

CREATE TABLE error_libelle_error_DURING (
  code_error        INTEGER DEFAULT nextval('seq_id_error'),
  libelle_error     VARCHAR(150) NOT NULL,
	debut	DATE NOT NULL,
	fin	DATE NOT NULL
);

-------------------------------------------------------------------------------
-- Ajout des contraintes aux tables
-------------------------------------------------------------------------------



--------------------lit--------------------

ALTER TABLE lit_SINCE ADD PRIMARY KEY (id_lit);
ALTER SEQUENCE seq_id_lit
OWNED BY lit_SINCE.id_lit;

ALTER TABLE lit_DURING ADD PRIMARY KEY(id_lit, debut, fin);
ALTER TABLE lit_DURING ADD CONSTRAINT lit_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE lit_DURING ADD CONSTRAINT fk_lit_id_lit FOREIGN KEY(id_lit)
REFERENCES lit_SINCE (id_lit);

--------------------chambre--------------------

ALTER TABLE chambre_SINCE
ADD PRIMARY KEY (id_chambre);
ALTER SEQUENCE seq_id_chambre
OWNED BY chambre_SINCE.id_chambre;

ALTER TABLE chambre_DURING ADD PRIMARY KEY(id_chambre, debut, fin);
ALTER TABLE chambre_DURING ADD CONSTRAINT chambre_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE chambre_DURING ADD CONSTRAINT fk_chambre_id_chambre FOREIGN KEY(id_chambre)
REFERENCES chambre_SINCE (id_chambre);

--------------------unite_soin--------------------

ALTER TABLE unite_soin_SINCE ADD PRIMARY KEY (id_unite_soin);
ALTER SEQUENCE seq_id_unite_soin
OWNED BY unite_soin_SINCE.id_unite_soin;

ALTER TABLE unite_soin_DURING ADD PRIMARY KEY(id_unite_soin, debut, fin);
ALTER TABLE unite_soin_DURING ADD CONSTRAINT unite_soin_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE unite_soin_DURING ADD CONSTRAINT fk_unite_soin_id_unite_soin FOREIGN KEY(id_unite_soin)
REFERENCES unite_soin_SINCE (id_unite_soin);

--------------------employe--------------------

ALTER TABLE employe_SINCE ADD PRIMARY KEY(id_employe);
ALTER SEQUENCE seq_id_employe
OWNED BY employe_SINCE.id_employe;

ALTER TABLE employe_DURING ADD PRIMARY KEY(id_employe, debut, fin);
ALTER TABLE employe_DURING ADD CONSTRAINT employe_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE employe_DURING ADD CONSTRAINT fk_employe_id_employe FOREIGN KEY(id_employe)
REFERENCES employe_SINCE (id_employe);

ALTER TABLE employe_nom_DURING ADD PRIMARY KEY(id_employe, debut, fin);
ALTER TABLE employe_nom_DURING ADD CONSTRAINT employe_nom_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE employe_nom_DURING ADD CONSTRAINT fk_employe_nom_id_employe FOREIGN KEY(id_employe)
REFERENCES employe_SINCE (id_employe);


ALTER TABLE employe_prenom_DURING ADD PRIMARY KEY(id_employe, debut, fin);
ALTER TABLE employe_prenom_DURING ADD CONSTRAINT employe_prenom_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE employe_prenom_DURING ADD CONSTRAINT fk_employe_prenom_id_employe FOREIGN KEY(id_employe)
REFERENCES employe_SINCE (id_employe);


--------------------patient--------------------

ALTER TABLE patient_SINCE ADD PRIMARY KEY(id_patient);
ALTER TABLE patient_SINCE ADD CONSTRAINT pt_date_chk CHECK (date_naissance < now()::date);
ALTER SEQUENCE seq_id_patient
OWNED BY patient_SINCE.id_patient;

ALTER TABLE patient_DURING ADD PRIMARY KEY(id_patient, debut, fin);
ALTER TABLE patient_DURING ADD CONSTRAINT patient_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE patient_DURING ADD CONSTRAINT fk_patient_id_patient FOREIGN KEY(id_patient)
REFERENCES patient_SINCE (id_patient);

ALTER TABLE patient_nom_DURING ADD PRIMARY KEY(id_patient, debut, fin);
ALTER TABLE patient_nom_DURING ADD CONSTRAINT patient_nom_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE patient_nom_DURING ADD CONSTRAINT fk_patient_nom_id_patient FOREIGN KEY(id_patient)
REFERENCES patient_SINCE (id_patient);


ALTER TABLE patient_prenom_DURING ADD PRIMARY KEY(id_patient, debut, fin);
ALTER TABLE patient_prenom_DURING ADD CONSTRAINT patient_prenom_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE patient_prenom_DURING ADD CONSTRAINT fk_patient_prenom_id_patient FOREIGN KEY(id_patient)
REFERENCES patient_SINCE (id_patient);


ALTER TABLE patient_nom_mere_DURING ADD PRIMARY KEY(id_patient, debut, fin);
ALTER TABLE patient_nom_mere_DURING ADD CONSTRAINT patient_nom_mere_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE patient_nom_mere_DURING ADD CONSTRAINT fk_patient_nom_mere_id_patient FOREIGN KEY(id_patient)
REFERENCES patient_SINCE (id_patient);


ALTER TABLE patient_prenom_mere_DURING ADD PRIMARY KEY(id_patient, debut, fin);
ALTER TABLE patient_prenom_mere_DURING ADD CONSTRAINT patient_prenom_mere_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE patient_prenom_mere_DURING ADD CONSTRAINT fk_patient_prenom_mere_id_patient FOREIGN KEY(id_patient)
REFERENCES patient_SINCE (id_patient);


ALTER TABLE patient_date_naissance_DURING ADD PRIMARY KEY(id_patient, debut, fin);
ALTER TABLE patient_date_naissance_DURING ADD CONSTRAINT patient_date_naissance_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE patient_date_naissance_DURING ADD CONSTRAINT fk_patient_date_naissance_id_patient FOREIGN KEY(id_patient)
REFERENCES patient_SINCE (id_patient);
ALTER TABLE patient_SINCE ADD CONSTRAINT pt_date_naissance_DURING_chk CHECK (date_naissance < now()::date);


ALTER TABLE patient_no_assurance_maladie_DURING ADD PRIMARY KEY(id_patient, debut, fin);
ALTER TABLE patient_DURING ADD CONSTRAINT patient_no_assurance_maladie_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE patient_no_assurance_maladie_DURING ADD CONSTRAINT fk_patient_no_assurance_maladie_id_patient FOREIGN KEY(id_patient)
REFERENCES patient_SINCE (id_patient);


--------------------sejour--------------------

ALTER TABLE sejour_SINCE ADD PRIMARY KEY (id_patient);
ALTER TABLE sejour_SINCE ADD CONSTRAINT fk_sejour1 FOREIGN KEY (id_patient)
REFERENCES patient_SINCE (id_patient);
ALTER TABLE sejour_SINCE ADD CONSTRAINT fk_sejour2 FOREIGN KEY (id_unite_soin)
REFERENCES unite_soin_SINCE (id_unite_soin);
ALTER TABLE sejour_SINCE ADD CONSTRAINT fk_sejour3 FOREIGN KEY (id_chambre)
REFERENCES chambre_SINCE (id_chambre);
ALTER TABLE sejour_SINCE ADD CONSTRAINT fk_sejour4 FOREIGN KEY (id_lit)
REFERENCES lit_SINCE (id_lit);

ALTER TABLE sejour_DURING ADD PRIMARY KEY(id_patient, debut, fin);
ALTER TABLE sejour_DURING ADD CONSTRAINT sejour_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE sejour_DURING ADD CONSTRAINT fk_sejour_id_patient FOREIGN KEY(id_patient)
REFERENCES sejour_SINCE (id_patient);


ALTER TABLE sejour_id_unite_soin_DURING ADD PRIMARY KEY(id_patient, debut, fin);
ALTER TABLE sejour_DURING ADD CONSTRAINT sejour_id_unite_soin_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE sejour_id_unite_soin_DURING ADD CONSTRAINT fk_sejour_id_unite_soin_id_patient FOREIGN KEY(id_patient)
REFERENCES sejour_SINCE (id_patient);
ALTER TABLE sejour_id_unite_soin_DURING ADD CONSTRAINT fk_sejour2 FOREIGN KEY (id_unite_soin)
REFERENCES unite_soin_SINCE (id_unite_soin);


ALTER TABLE sejour_id_chambre_DURING ADD PRIMARY KEY(id_patient, debut, fin);
ALTER TABLE sejour_DURING ADD CONSTRAINT sejour_id_chambre_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE sejour_id_chambre_DURING ADD CONSTRAINT fk_sejour_id_chambre_id_patient FOREIGN KEY(id_patient)
REFERENCES sejour_SINCE (id_patient);
ALTER TABLE sejour_id_chambre_DURING ADD CONSTRAINT fk_sejour3 FOREIGN KEY (id_chambre)
REFERENCES chambre_SINCE (id_chambre);


ALTER TABLE sejour_id_lit_DURING ADD PRIMARY KEY(id_patient, debut, fin);
ALTER TABLE sejour_DURING ADD CONSTRAINT sejour_id_lit_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE sejour_id_lit_DURING ADD CONSTRAINT fk_sejour_id_lit_id_patient FOREIGN KEY(id_patient)
REFERENCES sejour_SINCE (id_patient);
ALTER TABLE sejour_id_lit_DURING ADD CONSTRAINT fk_sejour4 FOREIGN KEY (id_lit)
REFERENCES lit_SINCE (id_lit);


--------------------equipe--------------------

ALTER TABLE equipe_SINCE ADD PRIMARY KEY(id_equipe);
ALTER TABLE equipe_SINCE ADD CONSTRAINT fk_equipe_infirmiere_chef FOREIGN KEY (id_infirmiere_chef)
REFERENCES employe_SINCE (id_employe);
ALTER SEQUENCE seq_id_equipe
OWNED BY equipe_SINCE.id_equipe;

ALTER TABLE equipe_DURING ADD PRIMARY KEY(id_equipe, debut, fin);
ALTER TABLE equipe_DURING ADD CONSTRAINT equipe_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE equipe_DURING ADD CONSTRAINT fk_equipe_id_equipe FOREIGN KEY(id_equipe)
REFERENCES equipe_SINCE (id_equipe);

ALTER TABLE equipe_id_infirmiere_chef_DURING ADD PRIMARY KEY(id_equipe, debut, fin);
ALTER TABLE equipe_id_infirmiere_chef_DURING ADD CONSTRAINT equipe_id_infirmiere_chef_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE equipe_id_infirmiere_chef_DURING ADD CONSTRAINT fk_equipe_id_infirmiere_chef_id_equipe FOREIGN KEY(id_equipe)
REFERENCES equipe_SINCE (id_equipe);
ALTER TABLE equipe_id_infirmiere_chef_DURING ADD CONSTRAINT fk_equipe_infirmiere_chef FOREIGN KEY (id_infirmiere_chef)
REFERENCES employe_SINCE (id_employe);


--------------------annuaire--------------------

ALTER TABLE annuaire_SINCE ADD PRIMARY KEY(id_annuaire);
ALTER TABLE annuaire_SINCE ADD CONSTRAINT fk_annuaire_employe FOREIGN KEY (id_employe)
REFERENCES employe_SINCE (id_employe);
ALTER SEQUENCE seq_id_annuaire
OWNED BY annuaire_SINCE.id_annuaire;

ALTER TABLE annuaire_DURING ADD PRIMARY KEY(id_annuaire, debut, fin);
ALTER TABLE annuaire_DURING ADD CONSTRAINT annuaire_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE annuaire_DURING ADD CONSTRAINT fk_annuaire_id_annuaire FOREIGN KEY(id_annuaire)
REFERENCES annuaire_SINCE (id_annuaire);

ALTER TABLE annuaire_id_employe_DURING ADD PRIMARY KEY(id_annuaire, debut, fin);
ALTER TABLE annuaire_DURING ADD CONSTRAINT annuaire_id_employe_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE annuaire_id_employe_DURING ADD CONSTRAINT fk_annuaire_id_employe_id_annuaire FOREIGN KEY(id_annuaire)
REFERENCES annuaire_SINCE (id_annuaire);
ALTER TABLE annuaire_id_employe_DURING ADD CONSTRAINT fk_annuaire_employe FOREIGN KEY (id_employe)
REFERENCES employe_SINCE (id_employe);


ALTER TABLE annuaire_numero_telephone_DURING ADD PRIMARY KEY(id_annuaire, debut, fin);
ALTER TABLE annuaire_DURING ADD CONSTRAINT annuaire_numero_telephone_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE annuaire_numero_telephone_DURING ADD CONSTRAINT fk_annuaire_numero_telephone_id_annuaire FOREIGN KEY(id_annuaire)
REFERENCES annuaire_SINCE (id_annuaire);


--------------------qualification--------------------

ALTER TABLE qualification_SINCE ADD PRIMARY KEY(id_qualification);
ALTER SEQUENCE seq_id_qualification
OWNED BY qualification_SINCE.id_qualification;

ALTER TABLE qualification_DURING ADD PRIMARY KEY(id_qualification, debut, fin);
ALTER TABLE qualification_DURING ADD CONSTRAINT qualification_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE qualification_DURING ADD CONSTRAINT fk_qualification_id_qualification FOREIGN KEY(id_qualification)
REFERENCES qualification_SINCE (id_qualification);

ALTER TABLE qualification_qualification_DURING ADD PRIMARY KEY(id_qualification, debut, fin);
ALTER TABLE qualification_DURING ADD CONSTRAINT qualification_qualification_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE qualification_qualification_DURING ADD CONSTRAINT fk_qualification_qualification_id_qualification FOREIGN KEY(id_qualification)
REFERENCES qualification_SINCE (id_qualification);

--------------------specialite--------------------

ALTER TABLE specialite_SINCE ADD PRIMARY KEY(id_specialite);
ALTER SEQUENCE seq_id_specialite
OWNED BY specialite_SINCE.id_specialite;

ALTER TABLE specialite_DURING ADD PRIMARY KEY(id_specialite, debut, fin);
ALTER TABLE specialite_DURING ADD CONSTRAINT specialite_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE specialite_DURING ADD CONSTRAINT fk_specialite_id_specialite FOREIGN KEY(id_specialite)
REFERENCES specialite_SINCE (id_specialite);

ALTER TABLE specialite_specialite_DURING ADD PRIMARY KEY(id_specialite, debut, fin);
ALTER TABLE specialite_DURING ADD CONSTRAINT specialite_specialite_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE specialite_specialite_DURING ADD CONSTRAINT fk_specialite_specialite_id_specialite FOREIGN KEY(id_specialite)
REFERENCES specialite_SINCE (id_specialite);

--------------------medicament--------------------

ALTER TABLE medicament_SINCE ADD PRIMARY KEY(code_medicament);
ALTER SEQUENCE seq_code_medicament
OWNED BY medicament_SINCE.code_medicament;

ALTER TABLE medicament_DURING ADD PRIMARY KEY(code_medicament, debut, fin);
ALTER TABLE medicament_DURING ADD CONSTRAINT medicament_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE medicament_DURING ADD CONSTRAINT fk_medicament_code_medicament FOREIGN KEY(code_medicament)
REFERENCES medicament_SINCE (code_medicament);

--------------------format--------------------

ALTER TABLE format_SINCE ADD PRIMARY KEY(id_format);
ALTER TABLE format_SINCE ADD CONSTRAINT formatchk CHECK (format > 0);
ALTER SEQUENCE seq_id_format
OWNED BY format_SINCE.id_format;

ALTER TABLE format_DURING ADD PRIMARY KEY(id_format, debut, fin);
ALTER TABLE format_DURING ADD CONSTRAINT format_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE format_DURING ADD CONSTRAINT fk_format_id_format FOREIGN KEY(id_format)
REFERENCES format_SINCE (id_format);

ALTER TABLE format_format_DURING ADD PRIMARY KEY(id_format, debut, fin);
ALTER TABLE format_DURING ADD CONSTRAINT format_format_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE format_format_DURING ADD CONSTRAINT fk_format_format_id_format FOREIGN KEY(id_format)
REFERENCES format_SINCE (id_format);
ALTER TABLE format_format_DURING ADD CONSTRAINT formatchk CHECK (format > 0);

--------------------voie_administration--------------------

ALTER TABLE voie_administration_SINCE ADD PRIMARY KEY(id_voie_administration);
ALTER TABLE voie_administration_SINCE ADD CONSTRAINT fk_rescription_voie_administration FOREIGN KEY (id_voie_administration)
REFERENCES voie_administration_SINCE (id_voie_administration);
ALTER SEQUENCE seq_id_voie_administration
OWNED BY voie_administration_SINCE.id_voie_administration;

ALTER TABLE voie_administration_DURING ADD PRIMARY KEY(id_voie_administration, debut, fin);
ALTER TABLE voie_administration_DURING ADD CONSTRAINT voie_administration_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE voie_administration_DURING ADD CONSTRAINT fk_voie_administration_id_voie_administration FOREIGN KEY(id_voie_administration)
REFERENCES voie_administration_SINCE (id_voie_administration);

ALTER TABLE voie_administration_voie_administration_DURING ADD PRIMARY KEY(id_voie_administration, debut, fin);
ALTER TABLE voie_administration_DURING ADD CONSTRAINT voie_administration_voie_administration_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE voie_administration_voie_administration_DURING ADD CONSTRAINT fk_voie_administration_voie_administration_id_voie_administration FOREIGN KEY(id_voie_administration)
REFERENCES voie_administration_SINCE (id_voie_administration);
ALTER TABLE voie_administration_voie_administration_DURING ADD CONSTRAINT fk_voie_administration_voie_administration_DURING FOREIGN KEY (id_voie_administration)
REFERENCES voie_administration_SINCE (id_voie_administration);


--------------------prescription--------------------

ALTER TABLE prescription_SINCE ADD PRIMARY KEY(id_prescription, id_ordonnance);
ALTER TABLE prescription_SINCE ADD CONSTRAINT fk_prescription1 FOREIGN KEY (id_ordonnance)
REFERENCES ordonnance_SINCE (id_ordonnance);
ALTER SEQUENCE seq_id_prescription
OWNED BY prescription_SINCE.id_prescription;

ALTER TABLE prescription_DURING ADD PRIMARY KEY(id_prescription, id_ordonnance, debut, fin);
ALTER TABLE prescription_DURING ADD CONSTRAINT prescription_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE prescription_DURING ADD CONSTRAINT fk_prescription_id_prescription FOREIGN KEY(id_prescription)
REFERENCES prescription_SINCE (id_prescription);
ALTER TABLE prescription_DURING ADD CONSTRAINT fk_prescription_id_ordonnance FOREIGN KEY(id_ordonnance)
REFERENCES ordonnance_SINCE (id_ordonnance);

ALTER TABLE prescription_validee_DURING ADD PRIMARY KEY(id_prescription, id_ordonnance, debut, fin);
ALTER TABLE prescription_DURING ADD CONSTRAINT prescription_validee_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE prescription_validee_DURING ADD CONSTRAINT fk_prescription_validee_id_prescription FOREIGN KEY(id_prescription)
REFERENCES prescription_SINCE (id_prescription);
ALTER TABLE prescription_validee_DURING ADD CONSTRAINT fk_prescription_validee_id_ordonnance FOREIGN KEY(id_ordonnance)
REFERENCES ordonnance_SINCE (id_ordonnance);


ALTER TABLE prescription_dose_DURING ADD PRIMARY KEY(id_prescription, id_ordonnance, debut, fin);
ALTER TABLE prescription_DURING ADD CONSTRAINT prescription_dose_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE prescription_dose_DURING ADD CONSTRAINT fk_prescription_dose_id_prescription FOREIGN KEY(id_prescription)
REFERENCES prescription_SINCE (id_prescription);
ALTER TABLE prescription_dose_DURING ADD CONSTRAINT fk_prescription_dose_id_ordonnance FOREIGN KEY(id_ordonnance)
REFERENCES ordonnance_SINCE (id_ordonnance);


ALTER TABLE prescription_id_voie_administration_DURING ADD PRIMARY KEY(id_prescription, id_ordonnance, debut, fin);
ALTER TABLE prescription_DURING ADD CONSTRAINT prescription_id_voie_administration_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE prescription_id_voie_administration_DURING ADD CONSTRAINT fk_prescription_id_voie_administration_id_prescription FOREIGN KEY(id_prescription)
REFERENCES prescription_SINCE (id_prescription);
ALTER TABLE prescription_id_voie_administration_DURING ADD CONSTRAINT fk_prescription_id_voie_administration_id_ordonnance FOREIGN KEY(id_ordonnance)
REFERENCES ordonnance_SINCE (id_ordonnance);


ALTER TABLE prescription_conseils_DURING ADD PRIMARY KEY(id_prescription, id_ordonnance, debut, fin);
ALTER TABLE prescription_DURING ADD CONSTRAINT prescription_conseils_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE prescription_conseils_DURING ADD CONSTRAINT fk_prescription_conseils_id_prescription FOREIGN KEY(id_prescription)
REFERENCES prescription_SINCE (id_prescription);
ALTER TABLE prescription_conseils_DURING ADD CONSTRAINT fk_prescription_conseils_id_ordonnance FOREIGN KEY(id_ordonnance)
REFERENCES ordonnance_SINCE (id_ordonnance);


--------------------ordonnance--------------------

ALTER TABLE ordonnance_SINCE ADD PRIMARY KEY(id_ordonnance);
ALTER TABLE ordonnance_SINCE ADD CONSTRAINT fk_ordonnance_1 FOREIGN KEY (id_employe)
REFERENCES employe_SINCE (id_employe);
ALTER TABLE ordonnance_SINCE ADD CONSTRAINT fk_ordonnance_2 FOREIGN KEY (id_patient)
REFERENCES patient_SINCE (id_patient);
ALTER SEQUENCE seq_id_ordonnance
OWNED BY ordonnance_SINCE.id_ordonnance;

ALTER TABLE ordonnance_DURING ADD PRIMARY KEY(id_ordonnance, debut, fin);
ALTER TABLE ordonnance_DURING ADD CONSTRAINT ordonnance_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE ordonnance_DURING ADD CONSTRAINT fk_ordonnance_id_ordonnance FOREIGN KEY(id_ordonnance)
REFERENCES ordonnance_SINCE (id_ordonnance);

ALTER TABLE ordonnance_id_employe_DURING ADD PRIMARY KEY(id_ordonnance, debut, fin);
ALTER TABLE ordonnance_DURING ADD CONSTRAINT ordonnance_id_employe_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE ordonnance_id_employe_DURING ADD CONSTRAINT fk_ordonnance_id_employe_id_ordonnance FOREIGN KEY(id_ordonnance)
REFERENCES ordonnance_SINCE (id_ordonnance);
ALTER TABLE ordonnance_id_employe_DURING ADD CONSTRAINT fk_ordonnance_id_employe_DURING FOREIGN KEY (id_employe)
REFERENCES employe_SINCE (id_employe);


ALTER TABLE ordonnance_id_patient_DURING ADD PRIMARY KEY(id_ordonnance, debut, fin);
ALTER TABLE ordonnance_DURING ADD CONSTRAINT ordonnance_id_patient_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE ordonnance_id_patient_DURING ADD CONSTRAINT fk_ordonnance_id_patient_id_ordonnance FOREIGN KEY(id_ordonnance)
REFERENCES ordonnance_SINCE (id_ordonnance);
ALTER TABLE ordonnance_id_patient_DURING ADD CONSTRAINT fk_ordonnance_id_patient_DURING FOREIGN KEY (id_patient)
REFERENCES patient_SINCE (id_patient);


ALTER TABLE ordonnance_date_emission_DURING ADD PRIMARY KEY(id_ordonnance, debut, fin);
ALTER TABLE ordonnance_DURING ADD CONSTRAINT ordonnance_date_emission_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE ordonnance_date_emission_DURING ADD CONSTRAINT fk_ordonnance_date_emission_id_ordonnance FOREIGN KEY(id_ordonnance)
REFERENCES ordonnance_SINCE (id_ordonnance);

--------------------periode--------------------

ALTER TABLE periode_SINCE ADD PRIMARY KEY(id_periode);
ALTER SEQUENCE seq_id_periode
OWNED BY periode_SINCE.id_periode;

ALTER TABLE periode_DURING ADD PRIMARY KEY(id_periode, debut, fin);
ALTER TABLE periode_DURING ADD CONSTRAINT periode_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE periode_DURING ADD CONSTRAINT fk_periode_id_periode FOREIGN KEY(id_periode)
REFERENCES periode_SINCE (id_periode);

ALTER TABLE periode_heure_DURING ADD PRIMARY KEY(id_periode, debut, fin);
ALTER TABLE periode_DURING ADD CONSTRAINT periode_heure_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE periode_heure_DURING ADD CONSTRAINT fk_periode_heure_id_periode FOREIGN KEY(id_periode)
REFERENCES periode_SINCE (id_periode);


--------------------quart_travail--------------------

ALTER TABLE quart_travail_SINCE ADD PRIMARY KEY(id_quart_travail);
ALTER SEQUENCE seq_id_quart_travail
OWNED BY quart_travail_SINCE.id_quart_travail;

ALTER TABLE quart_travail_DURING ADD PRIMARY KEY(id_quart_travail, debut, fin);
ALTER TABLE quart_travail_DURING ADD CONSTRAINT quart_travail_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE quart_travail_DURING ADD CONSTRAINT fk_quart_travail_id_quart_travail FOREIGN KEY(id_quart_travail)
REFERENCES quart_travail_SINCE (id_quart_travail);

--------------------affectation--------------------

ALTER TABLE affectation_SINCE ADD PRIMARY KEY(id_affectation);
ALTER TABLE affectation_SINCE ADD CONSTRAINT urg_chk CHECK (urgence >= 0 AND urgence <= 1);
ALTER SEQUENCE seq_id_affectation
OWNED BY affectation_SINCE.id_affectation;

ALTER TABLE affectation_DURING ADD PRIMARY KEY(id_affectation, debut, fin);
ALTER TABLE affectation_DURING ADD CONSTRAINT affectation_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE affectation_DURING ADD CONSTRAINT fk_affectation_id_affectation FOREIGN KEY(id_affectation)
REFERENCES affectation_SINCE (id_affectation);

ALTER TABLE affectation_date_DURING ADD PRIMARY KEY(id_affectation, debut, fin);
ALTER TABLE affectation_DURING ADD CONSTRAINT affectation_date_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE affectation_date_DURING ADD CONSTRAINT fk_affectation_date_id_affectation FOREIGN KEY(id_affectation)
REFERENCES affectation_SINCE (id_affectation);


ALTER TABLE affectation_urgence_DURING ADD PRIMARY KEY(id_affectation, debut, fin);
ALTER TABLE affectation_DURING ADD CONSTRAINT affectation_urgence_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE affectation_urgence_DURING ADD CONSTRAINT fk_affectation_urgence_id_affectation FOREIGN KEY(id_affectation)
REFERENCES affectation_SINCE (id_affectation);
ALTER TABLE affectation_urgence_DURING ADD CONSTRAINT urg_affectation_urgence_chk CHECK (urgence >= 0 AND urgence <= 1);


--------------------chambre_lit--------------------

ALTER TABLE chambre_lit_SINCE ADD PRIMARY KEY (id_chambre, id_lit);
ALTER TABLE chambre_lit_SINCE ADD CONSTRAINT fk_chambre_lit1 FOREIGN KEY (id_chambre)
REFERENCES chambre_SINCE (id_chambre);
ALTER TABLE chambre_lit_SINCE ADD CONSTRAINT fk_chambre_lit2 FOREIGN KEY (id_lit)
REFERENCES lit_SINCE (id_lit);

ALTER TABLE chambre_lit_DURING ADD PRIMARY KEY(id_chambre, id_lit, debut, fin);
ALTER TABLE chambre_lit_DURING ADD CONSTRAINT chambre_lit_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE chambre_lit_DURING ADD CONSTRAINT fk_chambre_lit_id_chambre FOREIGN KEY(id_chambre)
REFERENCES chambre_SINCE (id_chambre);
ALTER TABLE chambre_lit_DURING ADD CONSTRAINT fk_chambre_lit_id_lit FOREIGN KEY(id_lit)
REFERENCES lit_SINCE (id_lit);

--------------------unite_soin_chambre--------------------

ALTER TABLE unite_soin_chambre_SINCE ADD PRIMARY KEY (id_unite_soin, id_chambre);
ALTER TABLE unite_soin_chambre_SINCE ADD CONSTRAINT fk_unite_soin_chambre1 FOREIGN KEY (id_unite_soin)
REFERENCES unite_soin_SINCE (id_unite_soin);
ALTER TABLE unite_soin_chambre_SINCE ADD CONSTRAINT fk_unite_soin_chambre2 FOREIGN KEY (id_chambre)
REFERENCES chambre_SINCE (id_chambre);

ALTER TABLE unite_soin_chambre_DURING ADD PRIMARY KEY(id_unite_soin, id_chambre, debut, fin);
ALTER TABLE unite_soin_chambre_DURING ADD CONSTRAINT unite_soin_chambre_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE unite_soin_chambre_DURING ADD CONSTRAINT fk_unite_soin_chambre_id_unite_soin FOREIGN KEY(id_unite_soin)
REFERENCES unite_soin_SINCE (id_unite_soin);
ALTER TABLE unite_soin_chambre_DURING ADD CONSTRAINT fk_unite_soin_chambre_id_chambre FOREIGN KEY(id_chambre)
REFERENCES chambre_SINCE (id_chambre);

--------------------equipe_unite_soin--------------------

ALTER TABLE equipe_unite_soin_SINCE ADD PRIMARY KEY (id_equipe, id_unite_soin);
ALTER TABLE equipe_unite_soin_SINCE ADD CONSTRAINT fk_equipe_unite_soin1 FOREIGN KEY (id_equipe)
REFERENCES equipe_SINCE (id_equipe);
ALTER TABLE equipe_unite_soin_SINCE ADD CONSTRAINT fk_equipe_unite_soin2 FOREIGN KEY (id_unite_soin)
REFERENCES unite_soin_SINCE (id_unite_soin);

ALTER TABLE equipe_unite_soin_DURING ADD PRIMARY KEY(id_equipe, id_unite_soin, debut, fin);
ALTER TABLE equipe_unite_soin_DURING ADD CONSTRAINT equipe_unite_soin_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE equipe_unite_soin_DURING ADD CONSTRAINT fk_equipe_unite_soin_id_equipe FOREIGN KEY(id_equipe)
REFERENCES equipe_SINCE (id_equipe);
ALTER TABLE equipe_unite_soin_DURING ADD CONSTRAINT fk_equipe_unite_soin_id_unite_soin FOREIGN KEY(id_unite_soin)
REFERENCES unite_soin_SINCE (id_unite_soin);

--------------------employe_equipe--------------------

ALTER TABLE employe_equipe_SINCE ADD PRIMARY KEY (id_equipe, id_employe);
ALTER TABLE employe_equipe_SINCE ADD CONSTRAINT fk_employe_equipe2 FOREIGN KEY (id_equipe)
REFERENCES equipe_SINCE (id_equipe);
ALTER TABLE employe_equipe_SINCE ADD CONSTRAINT fk_employe_equipe1 FOREIGN KEY (id_employe)
REFERENCES employe_SINCE (id_employe);

ALTER TABLE employe_equipe_DURING ADD PRIMARY KEY(id_equipe, id_employe, debut, fin);
ALTER TABLE employe_equipe_DURING ADD CONSTRAINT employe_equipe_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE equipe_DURING ADD CONSTRAINT fk_employe_equipe_id_equipe FOREIGN KEY(id_equipe)
REFERENCES equipe_SINCE (id_equipe);
ALTER TABLE employe_DURING ADD CONSTRAINT fk_employe_equipe_id_employe FOREIGN KEY(id_employe)
REFERENCES employe_SINCE (id_employe);

--------------------employe_qualification--------------------

ALTER TABLE employe_qualification_SINCE ADD PRIMARY KEY (id_employe, id_qualification);
ALTER TABLE employe_qualification_SINCE ADD CONSTRAINT fk_employe_qualification1 FOREIGN KEY (id_employe)
REFERENCES employe_SINCE (id_employe);
ALTER TABLE employe_qualification_SINCE ADD CONSTRAINT fk_employe_qualification2 FOREIGN KEY (id_qualification)
REFERENCES qualification_SINCE (id_qualification);

ALTER TABLE employe_qualification_DURING ADD PRIMARY KEY(id_employe, id_qualification, debut, fin);
ALTER TABLE employe_qualification_DURING ADD CONSTRAINT employe_qualification_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE employe_qualification_DURING ADD CONSTRAINT fk_employe_qualification_id_employe FOREIGN KEY(id_employe)
REFERENCES employe_SINCE (id_employe);
ALTER TABLE employe_qualification_DURING ADD CONSTRAINT fk_employe_qualification_id_qualification FOREIGN KEY(id_qualification)
REFERENCES qualification_SINCE (id_qualification);

--------------------employe_specialite--------------------

ALTER TABLE employe_specialite_SINCE ADD PRIMARY KEY (id_employe, id_specialite);
ALTER TABLE employe_specialite_SINCE ADD CONSTRAINT fk_employe_specialite1 FOREIGN KEY (id_employe)
REFERENCES employe_SINCE (id_employe);
ALTER TABLE employe_specialite_SINCE ADD CONSTRAINT fk_employe_specialite2 FOREIGN KEY (id_specialite)
REFERENCES specialite_SINCE (id_specialite);

ALTER TABLE employe_specialite_DURING ADD PRIMARY KEY(id_employe, id_specialite, debut, fin);
ALTER TABLE employe_specialite_DURING ADD CONSTRAINT employe_specialite_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE employe_specialite_DURING ADD CONSTRAINT fk_employe_specialite_id_employe FOREIGN KEY(id_employe)
REFERENCES employe_SINCE (id_employe);
ALTER TABLE employe_specialite_DURING ADD CONSTRAINT fk_employe_specialite_id_specialite FOREIGN KEY(id_specialite)
REFERENCES specialite_SINCE (id_specialite);

--------------------medecin_traitant--------------------

ALTER TABLE medecin_traitant_SINCE ADD PRIMARY KEY(id_employe, id_patient);
ALTER TABLE medecin_traitant_SINCE ADD CONSTRAINT fk_medecin_traitant1 FOREIGN KEY (id_employe)
REFERENCES employe_SINCE (id_employe);
ALTER TABLE medecin_traitant_SINCE ADD CONSTRAINT fk_medecin_traitant2 FOREIGN KEY (id_patient)
REFERENCES sejour_SINCE (id_patient);

ALTER TABLE medecin_traitant_DURING ADD PRIMARY KEY(id_employe, id_patient, debut, fin);
ALTER TABLE medecin_traitant_DURING ADD CONSTRAINT medecin_traitant_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE medecin_traitant_DURING ADD CONSTRAINT fk_medecin_traitant_id_employe FOREIGN KEY(id_employe)
REFERENCES employe_SINCE (id_employe);
ALTER TABLE medecin_traitant_DURING ADD CONSTRAINT fk_medecin_traitant_id_patient FOREIGN KEY(id_patient)
REFERENCES patient_SINCE (id_patient);

--------------------qualification_prealable--------------------

ALTER TABLE qualification_prealable_SINCE ADD PRIMARY KEY (id_qualification, id_prealable);
ALTER TABLE qualification_prealable_SINCE ADD CONSTRAINT fk_qualification_qualification1 FOREIGN KEY (id_qualification)
REFERENCES qualification_SINCE (id_qualification);
ALTER TABLE qualification_prealable_SINCE ADD CONSTRAINT fk_qualification_qualification2 FOREIGN KEY (id_qualification)
REFERENCES qualification_SINCE (id_qualification);

ALTER TABLE qualification_prealable_DURING ADD PRIMARY KEY(id_qualification, id_prealable, debut, fin);
ALTER TABLE qualification_prealable_DURING ADD CONSTRAINT qualification_prealable_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE qualification_prealable_DURING ADD CONSTRAINT fk_qualification_prealable_id_qualification FOREIGN KEY(id_qualification)
REFERENCES qualification_SINCE (id_qualification);
ALTER TABLE qualification_prealable_DURING ADD CONSTRAINT fk_qualification_prealable_id_prealable FOREIGN KEY(id_prealable)
REFERENCES qualification_SINCE (id_qualification);

--------------------medicament_specialite--------------------

ALTER TABLE medicament_specialite_SINCE ADD PRIMARY KEY (code_medicament, id_specialite);
ALTER TABLE medicament_specialite_SINCE ADD CONSTRAINT fk_medicament_specialite1 FOREIGN KEY (code_medicament)
REFERENCES medicament_SINCE (code_medicament);
ALTER TABLE medicament_specialite_SINCE ADD CONSTRAINT fk_medicament_specialite2 FOREIGN KEY (id_specialite)
REFERENCES specialite_SINCE (id_specialite);

ALTER TABLE medicament_specialite_DURING ADD PRIMARY KEY(code_medicament, id_specialite, debut, fin);
ALTER TABLE medicament_specialite_DURING ADD CONSTRAINT medicament_specialite_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE medicament_specialite_DURING ADD CONSTRAINT fk_medicament_specialite_code_medicament FOREIGN KEY(code_medicament)
REFERENCES medicament_SINCE (code_medicament);
ALTER TABLE medicament_specialite_DURING ADD CONSTRAINT fk_medicament_specialite_id_specialite FOREIGN KEY(id_specialite)
REFERENCES specialite_SINCE (id_specialite);

--------------------medicament_qualification--------------------

ALTER TABLE medicament_qualification_SINCE ADD PRIMARY KEY (code_medicament, id_qualification);
ALTER TABLE medicament_qualification_SINCE ADD CONSTRAINT fk_medicament_qualification1 FOREIGN KEY (code_medicament)
REFERENCES medicament_SINCE (code_medicament);
ALTER TABLE medicament_qualification_SINCE ADD CONSTRAINT fk_medicament_qualification2 FOREIGN KEY (id_qualification)
REFERENCES qualification_SINCE (id_qualification);

ALTER TABLE medicament_qualification_DURING ADD PRIMARY KEY(code_medicament, id_qualification, debut, fin);
ALTER TABLE medicament_qualification_DURING ADD CONSTRAINT medicament_qualification_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE medicament_qualification_DURING ADD CONSTRAINT fk_medicament_qualification_code_medicament FOREIGN KEY(code_medicament)
REFERENCES medicament_SINCE (code_medicament);
ALTER TABLE medicament_qualification_DURING ADD CONSTRAINT fk_medicament_qualification_id_qualification FOREIGN KEY(id_qualification)
REFERENCES qualification_SINCE (id_qualification);

--------------------prescription_medicament--------------------

ALTER TABLE prescription_medicament_SINCE ADD PRIMARY KEY (id_prescription, code_medicament);
ALTER TABLE prescription_medicament_SINCE ADD CONSTRAINT fk_prescription_medicament1 FOREIGN KEY (id_prescription)
REFERENCES prescription_SINCE (id_prescription);
ALTER TABLE prescription_medicament_SINCE ADD CONSTRAINT fk_prescription_medicament2 FOREIGN KEY (code_medicament)
REFERENCES medicament_SINCE (code_medicament);

ALTER TABLE prescription_medicament_DURING ADD PRIMARY KEY(id_prescription, code_medicament, debut, fin);
ALTER TABLE prescription_medicament_DURING ADD CONSTRAINT prescription_medicament_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE prescription_medicament_DURING ADD CONSTRAINT fk_prescription_medicament_id_prescription FOREIGN KEY(id_prescription)
REFERENCES prescription_SINCE (id_prescription);
ALTER TABLE prescription_medicament_DURING ADD CONSTRAINT fk_prescription_medicament_code_medicament FOREIGN KEY(code_medicament)
REFERENCES medicament_SINCE (code_medicament);

--------------------format_medicament--------------------

ALTER TABLE format_medicament_SINCE ADD PRIMARY KEY (id_format, code_medicament);
ALTER TABLE format_medicament_SINCE ADD CONSTRAINT fk_format_medicament1 FOREIGN KEY (id_format)
REFERENCES format_SINCE (id_format);
ALTER TABLE format_medicament_SINCE ADD CONSTRAINT fk_format_medicament2 FOREIGN KEY (code_medicament)
REFERENCES medicament_SINCE (code_medicament);

ALTER TABLE format_medicament_DURING ADD PRIMARY KEY(id_format, code_medicament, debut, fin);
ALTER TABLE format_medicament_DURING ADD CONSTRAINT format_medicament_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE format_medicament_DURING ADD CONSTRAINT fk_format_medicament_id_format FOREIGN KEY(id_format)
REFERENCES format_SINCE (id_format);
ALTER TABLE format_medicament_DURING ADD CONSTRAINT fk_format_medicament_code_medicament FOREIGN KEY(code_medicament)
REFERENCES medicament_SINCE (code_medicament);

--------------------voie_administration_medicament--------------------

ALTER TABLE voie_administration_medicament_SINCE ADD PRIMARY KEY (id_voie_administration, code_medicament);
ALTER TABLE voie_administration_medicament_SINCE ADD CONSTRAINT fk_voie_administration_medicament1 FOREIGN KEY (id_voie_administration)
REFERENCES voie_administration_SINCE (id_voie_administration);
ALTER TABLE voie_administration_medicament_SINCE ADD CONSTRAINT fk_voie_administration_medicament2 FOREIGN KEY (code_medicament)
REFERENCES medicament_SINCE (code_medicament);

ALTER TABLE voie_administration_medicament_DURING ADD PRIMARY KEY(id_voie_administration, code_medicament, debut, fin);
ALTER TABLE voie_administration_medicament_DURING ADD CONSTRAINT voie_administration_medicament_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE voie_administration_medicament_DURING ADD CONSTRAINT fk_voie_administration_medicament_id_voie_administration FOREIGN KEY(id_voie_administration)
REFERENCES voie_administration_SINCE (id_voie_administration);
ALTER TABLE voie_administration_medicament_DURING ADD CONSTRAINT fk_voie_administration_medicament_code_medicament FOREIGN KEY(code_medicament)
REFERENCES medicament_SINCE (code_medicament);

--------------------prescription_periode--------------------

ALTER TABLE prescription_periode_SINCE ADD PRIMARY KEY (id_prescription, id_periode);
ALTER TABLE prescription_periode_SINCE ADD CONSTRAINT fk_prescription_periode1 FOREIGN KEY (id_prescription)
REFERENCES prescription_SINCE (id_prescription);
ALTER TABLE prescription_periode_SINCE ADD CONSTRAINT fk_prescription_periode2 FOREIGN KEY (id_periode)
REFERENCES periode_SINCE (id_periode);

ALTER TABLE prescription_periode_DURING ADD PRIMARY KEY(id_prescription, id_periode, debut, fin);
ALTER TABLE prescription_periode_DURING ADD CONSTRAINT prescription_periode_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE prescription_periode_DURING ADD CONSTRAINT fk_prescription_periode_id_prescription FOREIGN KEY(id_prescription)
REFERENCES prescription_SINCE (id_prescription);
ALTER TABLE prescription_periode_DURING ADD CONSTRAINT fk_prescription_periode_id_periode FOREIGN KEY(id_periode)
REFERENCES periode_SINCE (id_periode);

--------------------periode_quart_travail--------------------

ALTER TABLE periode_quart_travail_SINCE ADD PRIMARY KEY (id_periode, id_quart_travail);
ALTER TABLE periode_quart_travail_SINCE ADD CONSTRAINT fk_periode_quart_travail1 FOREIGN KEY (id_periode)
REFERENCES periode_SINCE (id_periode);
ALTER TABLE periode_quart_travail_SINCE ADD CONSTRAINT fk_periode_quart_travail2 FOREIGN KEY (id_quart_travail)
REFERENCES quart_travail_SINCE (id_quart_travail);

ALTER TABLE periode_quart_travail_DURING ADD PRIMARY KEY(id_periode, id_quart_travail, debut, fin);
ALTER TABLE periode_quart_travail_DURING ADD CONSTRAINT periode_quart_travail_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE periode_quart_travail_DURING ADD CONSTRAINT fk_periode_quart_travail_id_periode FOREIGN KEY(id_periode)
REFERENCES periode_SINCE (id_periode);
ALTER TABLE periode_quart_travail_DURING ADD CONSTRAINT fk_periode_quart_travail_id_quart_travail FOREIGN KEY(id_quart_travail)
REFERENCES quart_travail_SINCE (id_quart_travail);

--------------------affectation_quart_travail--------------------

ALTER TABLE affectation_quart_travail_SINCE ADD PRIMARY KEY (id_affectation, id_quart_travail);
ALTER TABLE affectation_quart_travail_SINCE ADD CONSTRAINT fk_affectation_quart_travail1 FOREIGN KEY (id_affectation)
REFERENCES affectation_SINCE (id_affectation);
ALTER TABLE affectation_quart_travail_SINCE ADD CONSTRAINT fk_affectation_quart_travail2 FOREIGN KEY (id_quart_travail)
REFERENCES quart_travail_SINCE (id_quart_travail);

ALTER TABLE affectation_quart_travail_DURING ADD PRIMARY KEY(id_affectation, id_quart_travail, debut, fin);
ALTER TABLE affectation_quart_travail_DURING ADD CONSTRAINT affectation_quart_travail_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE affectation_quart_travail_DURING ADD CONSTRAINT fk_affectation_quart_travail_id_affectation FOREIGN KEY(id_affectation)
REFERENCES affectation_SINCE (id_affectation);
ALTER TABLE affectation_quart_travail_DURING ADD CONSTRAINT fk_affectation_quart_travail_id_quart_travail FOREIGN KEY(id_quart_travail)
REFERENCES quart_travail_SINCE (id_quart_travail);

--------------------employe_quart_travail--------------------

ALTER TABLE employe_quart_travail_SINCE ADD PRIMARY KEY(id_employe,id_quart_travail);
ALTER TABLE employe_quart_travail_SINCE ADD CONSTRAINT fk_employe_quart_travail1 FOREIGN KEY (id_employe)
REFERENCES employe_SINCE (id_employe);
ALTER TABLE employe_quart_travail_SINCE ADD CONSTRAINT fk_employe_quart_travail2 FOREIGN KEY (id_quart_travail)
REFERENCES quart_travail_SINCE (id_quart_travail);

ALTER TABLE employe_quart_travail_DURING ADD PRIMARY KEY(id_employe, id_quart_travail, debut, fin);
ALTER TABLE employe_quart_travail_DURING ADD CONSTRAINT employe_quart_travail_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE employe_quart_travail_DURING ADD CONSTRAINT fk_employe_quart_travail_id_employe FOREIGN KEY(id_employe)
REFERENCES employe_SINCE (id_employe);
ALTER TABLE employe_quart_travail_DURING ADD CONSTRAINT fk_employe_quart_travail_id_quart_travail FOREIGN KEY(id_quart_travail)
REFERENCES quart_travail_SINCE (id_quart_travail);

--------------------affectation_employe--------------------

ALTER TABLE affectation_employe_SINCE ADD PRIMARY KEY (id_affectation, id_employe);
ALTER TABLE affectation_employe_SINCE ADD CONSTRAINT fk_affectation_employe1 FOREIGN KEY (id_affectation)
REFERENCES affectation_SINCE (id_affectation);
ALTER TABLE affectation_employe_SINCE ADD CONSTRAINT fk_affectation_employe2 FOREIGN KEY (id_employe)
REFERENCES employe_SINCE (id_employe);

ALTER TABLE affectation_employe_DURING ADD PRIMARY KEY(id_affectation, id_employe, debut, fin);
ALTER TABLE affectation_employe_DURING ADD CONSTRAINT affectation_employe_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE affectation_employe_DURING ADD CONSTRAINT fk_affectation_employe_id_affectation FOREIGN KEY(id_affectation)
REFERENCES affectation_SINCE (id_affectation);
ALTER TABLE affectation_employe_DURING ADD CONSTRAINT fk_affectation_employe_id_employe FOREIGN KEY(id_employe)
REFERENCES employe_SINCE (id_employe);

--------------------error--------------------

ALTER TABLE error_SINCE ADD PRIMARY KEY (code_error);

ALTER TABLE error_DURING ADD PRIMARY KEY(code_error, debut, fin);
ALTER TABLE error_DURING ADD CONSTRAINT error_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE error_DURING ADD CONSTRAINT fk_error_code_error FOREIGN KEY(code_error)
REFERENCES error_SINCE (code_error);

ALTER TABLE error_libelle_error_DURING ADD PRIMARY KEY(code_error, debut, fin);
ALTER TABLE error_DURING ADD CONSTRAINT error_libelle_DURING_date_Chk CHECK (debut <= fin);
ALTER TABLE error_libelle_error_DURING ADD CONSTRAINT fk_error_libelle_error_code_error FOREIGN KEY(code_error)
REFERENCES error_SINCE (code_error);