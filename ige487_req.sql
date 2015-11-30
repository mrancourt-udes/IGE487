/******************************************************************************
** File: ige487_req.sql
** Desc: Script d'insertion des donnes tests
**       Travail pratique 3 - Modélisation-conception d'une base de données
**       Dans le cadre du cours IGE-487
** Auth: Mamadou Cellou Soto Diallo
**       Jeremy Manceaux
**       Martin Rancourt
** Date: 15-09-2015
******************************************************************************/

/**
  Retourne les patients qui se sont fait administrer le medicament 02244366
  Par le medecin 6 (Oliver Lessard)
 */
SELECT p.id_patient,  p.nom ||', '|| p.prenom AS patient, e.id_employe,
  e.nom ||', '|| e.prenom AS medecin, f.code_prescription
FROM prescription_fact f
  JOIN prescription pre on (f.code_prescription = pre.id_prescription)
  JOIN medicament m on (f.code_medicament = m.code_medicament)
  JOIN patient p on (f.code_patient = p.id_patient)
  JOIN employe e on (f.code_employe = e.id_employe)
  WHERE f.code_employe = 6 AND
  f.code_medicament = '02244366';


/**
  Retourne les employes qui ont etes affectes depuis le 2014-01-01
 */
SELECT  e.id_employe, e.nom ||', '|| e.prenom AS employe
FROM plannification_affectation_fact f
  JOIN employe e on (f.code_employe = e.id_employe)
  JOIN affectation a on (f.code_affectation = a.code_affectation)
  WHERE a.date > DATE '2014-01-01';

/**
  Retourne les patients qui ont etes traites par la medecin 3 (Christian Houde)
 */
SELECT p.id_patient,  p.nom ||', '|| p.prenom AS patient, e.id_employe,
  e.nom ||', '|| e.prenom AS medecin
FROM medecin_traitant_fact f
  JOIN employe e ON (f.code_employe = e.id_employe)
  JOIN patient p ON (f.code_patient = p.id_patient);

/**
  Retourne les admission qui ont duree plus de 14 jours
 */
SELECT COUNT(code_patient) AS nb_patients
FROM admission_fact
  WHERE duree > 14;