/* *****************************************************************************
** File: ige487_req.sql
** Desc: Script de requêtes temporelles mettant en évidence la couverture et la
         qualité des schémas.
** Auth: Mamadou Cellou Soto Diallo
		     Jeremy Manceaux
		     Martin Rancourt
** Date: 06-12-2015
***************************************************************************** */

SET search_path TO edt;

/**
  Retourne les patients pour lesquelles des modifications ont étés apportés à
  leur numéro d'assurances maladie.
 */
WITH T
AS (SELECT F.debut, L.fin, F.id_patient, F.no_assurance_maladie
    FROM   patient_no_assurance_maladie_during AS F
           JOIN patient_no_assurance_maladie_during AS L
                ON F.fin <= L.fin
                   AND F.id_patient = L.id_patient
           INNER JOIN patient_no_assurance_maladie_during AS E
                 ON F.id_patient = E.id_patient
    GROUP  BY F.debut, L.fin,  F.id_patient, F.no_assurance_maladie
    HAVING COUNT(CASE
                    WHEN (E.debut < F.debut AND F.debut <= E.fin)
                          OR (E.debut <= L.fin AND L.fin < E.fin)
                    THEN 1
                 END) = 0)
SELECT id_patient, no_assurance_maladie, debut, MIN(fin) AS fin
FROM   T
GROUP  BY id_patient, debut, no_assurance_maladie;

/* Set schema back to default */
SET search_path TO public;