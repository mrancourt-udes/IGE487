/* *****************************************************************************
** File: ige487_alim.sql
** Desc: Script d'alimentation initiale de l’entrepôt à partir du schema de la
         base de données transactionnelle
** Auth: Mamadou Cellou Soto Diallo
		     Jeremy Manceaux
		     Martin Rancourt
** Date: 06-12-2015
***************************************************************************** */

-------------------------------------------------------------------------------
-- Nettoyage complet des donnees
-------------------------------------------------------------------------------
SET search_path TO edt;
TRUNCATE
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

/* Set schema back to default */
SET search_path TO public;

INSERT INTO edt.lit_SINCE (
  id_lit, lit_since
) (SELECT
    id_lit, current_date
  FROM tra.lit
);

INSERT INTO edt.chambre_SINCE (
  id_chambre, chambre_since
) (SELECT
    id_chambre, current_date
  FROM tra.chambre
);

INSERT INTO edt.unite_soin_SINCE (
  id_unite_soin, unite_soin_since
) (SELECT
    id_unite_soin, current_date
  FROM tra.unite_soin
);

INSERT INTO edt.employe_SINCE (
  id_employe, employe_since,
  nom, nom_since,
  prenom, prenom_since
) (SELECT
    id_employe, current_date,
    nom, current_date,
    prenom, current_date
  FROM tra.employe
);

INSERT INTO edt.patient_SINCE (
  id_patient, patient_since,
  nom, nom_since,
  prenom, prenom_since,
  nom_mere, nom_mere_since,
  prenom_mere, prenom_mere_since,
  date_naissance, date_naissance_since,
  no_assurance_maladie, no_assurance_maladie_since
) (SELECT
    id_patient, current_date,
    nom, current_date,
    prenom, current_date,
    nom_mere, current_date,
    prenom_mere, current_date,
    date_naissance, current_date,
    no_assurance_maladie, current_date
  FROM tra.patient
);

INSERT INTO edt.sejour_SINCE (
  id_patient, sejour_since,
  id_unite_soin, id_unite_soin_since,
  id_chambre, id_chambre_since,
  id_lit, id_lit_since) (
  SELECT
    id_patient, current_date, 
    id_unite_soin, current_date,
    id_chambre, current_date,
    id_lit, current_date 
  FROM tra.sejour
);

INSERT INTO edt.equipe_SINCE (
  id_equipe, equipe_since,
  id_infirmiere_chef, id_infirmiere_chef_since
) (SELECT
    id_equipe, current_date,
    id_infirmiere_chef, current_date
  FROM tra.equipe
);

INSERT INTO edt.annuaire_SINCE (
  id_annuaire, annuaire_since,
  id_employe, id_employe_since,
  numero_telephone, numero_telephone_since
) (SELECT
    id_annuaire, current_date,
    id_employe, current_date,
    numero_telephone, current_date
  FROM tra.annuaire
);

INSERT INTO edt.qualification_SINCE (
  id_qualification, qualification_since,
  qualification
) (SELECT
    id_qualification, current_date,
    qualification
  FROM tra.qualification
);

INSERT INTO edt.specialite_SINCE (
  id_specialite, specialite_since,
  specialite
) (SELECT
    id_specialite, current_date,
    specialite
  FROM tra.specialite
);

INSERT INTO edt.medicament_SINCE (
  code_medicament, medicament_since
) (SELECT
    code_medicament, current_date
  FROM tra.medicament
);

INSERT INTO edt.format_SINCE (
  id_format, format_since,
  format
) (SELECT
    id_format, current_date,
    format
  FROM tra.format
);

INSERT INTO edt.voie_administration_SINCE (
  id_voie_administration, voie_administration_since,
  voie_administration
) (SELECT
    id_voie_administration, current_date,
    voie_administration
  FROM tra.voie_administration
);

INSERT INTO edt.ordonnance_SINCE (
  id_ordonnance, ordonnance_since,
  id_employe, id_employe_since,
  id_patient, id_patient_since
) (SELECT
    id_ordonnance, current_date,
    id_employe, current_date,
    id_patient, current_date
  FROM tra.ordonnance
);


INSERT INTO edt.prescription_SINCE (
  id_prescription, prescription_since,
  id_ordonnance,
  validee, validee_since,
  dose, dose_since,
  id_voie_administration, id_voie_administration_since,
  conseils, conseils_since
) (SELECT
    id_prescription, current_date,
    id_ordonnance,
    validee, current_date,
    dose, current_date,
    id_voie_administration, current_date,
    conseils, current_date
  FROM tra.prescription
);

INSERT INTO edt.periode_SINCE (
  id_periode, periode_since,
  heure, heure_since
) (SELECT
    id_periode, current_date,
    heure, current_date
  FROM tra.periode
);

INSERT INTO edt.quart_travail_SINCE (
  id_quart_travail, quart_travail_since
) (SELECT
    id_quart_travail, current_date
  FROM tra.quart_travail
);

INSERT INTO edt.affectation_SINCE (
  id_affectation, affectation_since,
  date, date_since,
  urgence, urgence_since
) (SELECT
    id_affectation, current_date,
    date, current_date,
    urgence, current_date
  FROM tra.affectation
);

INSERT INTO edt.chambre_lit_SINCE (
  id_chambre, id_lit, chambre_lit_since
) (SELECT
    id_chambre, id_lit, current_date
  FROM tra.chambre_lit
);

INSERT INTO edt.unite_soin_chambre_SINCE (
  id_unite_soin, id_chambre, unite_soin_chambre_since
) (SELECT
    id_unite_soin, id_chambre, current_date
  FROM tra.unite_soin_chambre
);

INSERT INTO edt.equipe_unite_soin_SINCE (
  id_equipe, id_unite_soin, equipe_unite_soin_since
) (SELECT
    id_equipe, id_unite_soin, current_date
  FROM tra.equipe_unite_soin
);

INSERT INTO edt.employe_equipe_SINCE (
  id_employe, id_equipe, employe_equipe_since
) (SELECT
    id_employe, id_equipe, current_date
  FROM tra.employe_equipe
);

INSERT INTO edt.employe_qualification_SINCE (
  id_employe, id_qualification, employe_qualification_since
) (SELECT
    id_employe, id_qualification, current_date
  FROM tra.employe_qualification
);

INSERT INTO edt.employe_specialite_SINCE (
  id_employe, id_specialite, employe_specialite_since
) (SELECT
    id_employe, id_specialite, current_date
  FROM tra.employe_specialite
);

INSERT INTO edt.medecin_traitant_SINCE (
  id_employe, id_patient, medecin_traitant_since
) (SELECT
    id_employe, id_patient, current_date
  FROM tra.medecin_traitant
);

INSERT INTO edt.qualification_prealable_SINCE (
  id_qualification, id_prealable, qualification_prealable_since
) (SELECT
    id_qualification, id_prealable, current_date
  FROM tra.qualification_prealable
);

INSERT INTO edt.medicament_specialite_SINCE (
  code_medicament, id_specialite, medicament_specialite_since
) (SELECT
    code_medicament, id_specialite, current_date
  FROM tra.medicament_specialite
);

INSERT INTO edt.medicament_qualification_SINCE (
  code_medicament, id_qualification, medicament_qualification_since
) (SELECT
    code_medicament, id_qualification, current_date
  FROM tra.medicament_qualification
);

INSERT INTO edt.prescription_medicament_SINCE (
  id_prescription, code_medicament, prescription_medicament_since
) (SELECT
    id_prescription, code_medicament, current_date
  FROM tra.prescription_medicament
);

INSERT INTO edt.format_medicament_SINCE (
  id_format, code_medicament, format_medicament_since
) (SELECT
    id_format, code_medicament, current_date
  FROM tra.format_medicament
);

INSERT INTO edt.voie_administration_medicament_SINCE (
  id_voie_administration, code_medicament, voie_administration_medicament_since
) (SELECT
    id_voie_administration, code_medicament, current_date
  FROM tra.voie_administration_medicament
);

INSERT INTO edt.prescription_periode_SINCE (
  id_prescription, id_periode, prescription_periode_since
) (SELECT
    id_prescription, id_periode, current_date
  FROM tra.prescription_periode
);

INSERT INTO edt.periode_quart_travail_SINCE (
  id_periode, id_quart_travail, periode_quart_travail_since
) (SELECT
    id_periode, id_quart_travail, current_date
  FROM tra.periode_quart_travail
);

INSERT INTO edt.affectation_quart_travail_SINCE (
  id_affectation, id_quart_travail, affectation_quart_travail_since
) (SELECT
    id_affectation, id_quart_travail, current_date
  FROM tra.affectation_quart_travail
);

INSERT INTO edt.employe_quart_travail_SINCE (
  id_employe, id_quart_travail, employe_quart_travail_since
) (SELECT
    id_employe, id_quart_travail, current_date
  FROM tra.employe_quart_travail
);

INSERT INTO edt.affectation_employe_SINCE (
  id_affectation, id_employe, affectation_employe_since
) (SELECT
    id_affectation, id_employe, current_date
  FROM tra.affectation_employe
);

INSERT INTO edt.error_SINCE (
  code_error, error_since,
  libelle_error, libelle_error_since
) (SELECT 
    code_error, current_date,
    libelle_error, current_date
  FROM tra.error
);