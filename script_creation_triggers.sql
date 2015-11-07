/* *****************************************************************************
** File: script_creation_triggers.sql
** Desc: Script de creation des triggers et leurs resultats d'exécution en commentaire
**       Travail pratique 1 - Modélisation-conception d'une base de données
**       Dans le cadre du cours IGE-487
**       modelisation de base de donnees
** Auth: Martin Rancourt
		 Jeremy Manceaux
		 Mamadou Cellou Soto Diallo      
** Date: 15-09-2015
***************************************************************************** */
-- Cette procedure permet pour un code d'erreur passé en parmètre d'afficher un message d'erreur formaté code_error+message d'erreur
-- Elle sera donc appelé à chaque fois qu'il y'aura besoin de lever une erreur
CREATE OR REPLACE FUNCTION afficher_error(code INTEGER) RETURNS VARCHAR AS $$
	DECLARE 
		vmessage_error	VARCHAR(150);
		vlibelle_error  VARCHAR(100);
    BEGIN
	  SELECT libelle_error INTO vlibelle_error FROM error WHERE code_error = code; 
	  vmessage_error := code ||':'|| vlibelle_error;
	  RETURN vmessage_error;
    END;
    $$ LANGUAGE plpgsql;

-- Ce trigger permet de vérifier que l'employé qui établit une ordonnance est bien un medecin
CREATE OR REPLACE FUNCTION ordonnance_check_medecin() RETURNS TRIGGER
AS $ordonnance_check_medecin$
    DECLARE
		vidQualifification	INTEGER;
		vmessage_d_erreur	VARCHAR(150);
		      
    BEGIN

    	SELECT afficher_error(100) into vmessage_d_erreur;
		SELECT id_qualification INTO vidQualifification FROM employe_qualification WHERE id_employe = NEW.id_medecin;
		IF vidQualifification <> 1 THEN
		   RAISE EXCEPTION '%', vmessage_d_erreur;
		END IF;
		RETURN NEW;
    END;
$ordonnance_check_medecin$ LANGUAGE plpgsql;
CREATE TRIGGER ordonnance_check_medecin BEFORE INSERT ON ordonnance_medecin
    FOR EACH ROW EXECUTE PROCEDURE ordonnance_check_medecin();

/*
						RESULTAT D'EXECUTION DU TRIGGER
insert into ordonnance_medecin(id_ordonnance, id_medecin) values(5,19)
Resultat: ERREUR:  100: Seul un medecin peut etablir une ordonnance 

insert into ordonnance_medecin(id_ordonnance, id_medecin) values(5,18)
Resultat: La requête a été exécutée avec succès : une ligne modifiée. La requête a été exécutée en 67 ms

*/

-- Ce trigger permet de s'assurere que le medecin affecté à un patient est bien un médecin generaliste
CREATE OR REPLACE FUNCTION medecin_check() RETURNS TRIGGER
AS $medecin_check$
    DECLARE
        vidSpecialite	INTEGER;
        vmessage_d_erreur	VARCHAR(150);
          
    BEGIN
    	SELECT afficher_error(101) into vmessage_d_erreur;
	    SELECT id_specialite INTO vidSpecialite FROM employe_specialite WHERE id_employe = NEW.id_employe;
		IF vidSpecialite <> 1 THEN
		   RAISE EXCEPTION '%', vmessage_d_erreur;
		END IF;
	    RETURN NEW;
    END;
$medecin_check$ LANGUAGE plpgsql;

CREATE TRIGGER medecin_check BEFORE INSERT ON patient
    FOR EACH ROW EXECUTE PROCEDURE medecin_check();
/*
							RESULTAT D'EXECUTION DU TRIGGER
insert into patient(nom, prenom, nom_mere, prenom_mere, date_naissance, no_assurance_maladie, id_employe) values
('laporte', 'christian', 'grevet', 'jessica','21-10-1992','lowk7658269',5)
Resultat : ERREUR:  101: Seul un medecin généraliste peut être affecté à un patient 

insert into patient(nom, prenom, nom_mere, prenom_mere, date_naissance, no_assurance_maladie, id_employe) values
('laporte', 'christian', 'grevet', 'jessica','21-10-1992','lowk7658269',3)
Resultat : La requête a été exécutée avec succès : une ligne modifiée. La requête a été exécutée en 45 ms.

*/
  
-- Ce trigger permet de s'assurer que seuls les medecins et les techniciens peuvent avoir de spécialité
  CREATE OR REPLACE FUNCTION check_employe_specialite() RETURNS TRIGGER AS $check_employe_specialite$
    DECLARE
		vidQualification	INTEGER;
		 vmessage_d_erreur	VARCHAR(150);
    BEGIN
    	SELECT afficher_error(102) into vmessage_d_erreur;
		SELECT id_qualification INTO vidQualification FROM employe_qualification WHERE id_employe = NEW.id_employe;
		IF (vidQualification <> 1 OR vidQualification <> 2) THEN
			RAISE EXCEPTION '%', vmessage_d_erreur;
		END IF;
		RETURN NEW;
	
    END;
$check_employe_specialite$ LANGUAGE plpgsql;

CREATE TRIGGER check_employe_specialite BEFORE INSERT ON employe_specialite
    FOR EACH ROW EXECUTE PROCEDURE check_employe_specialite();
/*
							RESULTAT D'EXECUTION DU TRIGGER
insert into employe_specialite(id_employe, id_specialite) values(20,6)
Resulat : ERREUR:   102: Seuls les medecins et les techniciens peuvent avoir de specialité

insert into employe_specialite(id_employe, id_specialite) values(18,6)-- cas d'un medecin
Resultat : La requête a été exécutée avec succès : une ligne modifiée. La requête a été exécutée en 13 ms.
*/
-- Ce trigger permet de s'assurer qu'un employé avec la qualification technicien ne puisse pas avoir la spécialité Medecin generaliste
CREATE OR REPLACE FUNCTION check_employe_qualification() RETURNS TRIGGER
AS $check_employe_qualification$
    DECLARE
		vidQualification	INTEGER;
		vidSpecialite	    INTEGER;
		 vmessage_d_erreur	VARCHAR(150);
		 vq INTEGER;
		 vs INTEGER;
    BEGIN
        vq :=2;
        vs :=1;
    	SELECT afficher_error(103) into vmessage_d_erreur;
		SELECT id_qualification into vidQualification from employe_qualification where id_employe = NEW.id_employe;
		SELECT id_specialite into vidSpecialite from employe_specialite where id_employe = NEW.id_employe;
		IF vidQualification = vq THEN
			IF vidSpecialite = vs THEN
				RAISE EXCEPTION '%', vmessage_d_erreur;
			END IF;
		END IF;
		RETURN NEW;
	END;
$check_employe_qualification$ LANGUAGE plpgsql;

CREATE TRIGGER check_employe_qualification BEFORE INSERT ON employe_specialite
    FOR EACH ROW EXECUTE PROCEDURE check_employe_qualification();
/*
							RESULTAT D'EXECUTION DU TRIGGER
insert into employe_specialite(id_employe, id_specialite) values(12,1) -- 1 etant l'id de la specialité medecin generaliste
Resultat : ERREUR:  103: Un technicien ne peut pas être medecin généraliste

insert into employe_specialite(id_employe, id_specialite) values(6,1)
Resultat : La requête a été exécutée avec succès : une ligne modifiée. La requête a été exécutée en 12 ms

*/

-- Ce trigger permet de s'assurer qu'une equipe possède une infirmiere chef
CREATE OR REPLACE FUNCTION check_equipe_infirmiere_chef() RETURNS TRIGGER
AS $check_equipe_infirmiere_chef$
    DECLARE
		vid_employe	        INTEGER;
		vidQualification	INTEGER;
		 vmessage_d_erreur	VARCHAR(150);
		
    BEGIN
    	SELECT afficher_error(104) into vmessage_d_erreur;
		SELECT id_infirmiere_chef INTO vid_employe from equipe where id_equipe = NEW.id_equipe;
		SELECT id_qualification INTO vidQualification from employe_qualification where id_employe = vid_employe;
		IF vidQualification <> 4 THEN
			RAISE EXCEPTION '%', vmessage_d_erreur;
		END IF;
		RETURN NEW;
    END;
$check_equipe_infirmiere_chef$ LANGUAGE plpgsql;

CREATE TRIGGER check_equipe_infirmiere_chef BEFORE INSERT ON equipe
 FOR EACH ROW EXECUTE PROCEDURE check_equipe_infirmiere_chef();
/*
						RESULTAT D'EXECUTION DU TRIGGER
ERREUR:  Le chef d equipe doit etre infirmiere chef
********** Erreur **********

ERREUR: Le chef d equipe doit etre infirmiere chef
État SQL :P0001

*/
-- Ce trigger permet de s'assurer que dans une chambre il y'a pas plus de 4 lits 
CREATE OR REPLACE FUNCTION check_nombre_lit() RETURNS TRIGGER
AS $check_nombre_lit$
    DECLARE
		nombre_lit        	INTEGER;
		 vmessage_d_erreur	VARCHAR(150);
    BEGIN
    	SELECT afficher_error(105) into vmessage_d_erreur;
		SELECT COUNT(*) INTO nombre_lit FROM chambre_lit WHERE id_chambre = NEW.id_chambre;
		IF nombre_lit >=4 THEN 
			RAISE EXCEPTION '%', vmessage_d_erreur;
		END IF;
		RETURN NEW;
    END;
$check_nombre_lit$ LANGUAGE plpgsql;

CREATE TRIGGER check_nombre_lit BEFORE INSERT ON chambre_lit
 FOR EACH ROW EXECUTE PROCEDURE check_nombre_lit();
 
 /*
						RESULTAT D'EXECUTION DU TRIGGER
						
insert into chambre_lit(id_chambre, id_lit) values(2,4) -- la chambre 2 etant deja au complet soit 4 lits
Resultat  : ERREUR:  Cette chambre a deja atteint son nombre maxiamal de lits.

insert into chambre_lit(id_chambre, id_lit) values(3,4) -- la chambre 3 n'etant pas encore plein
Resultat : La requête a été exécutée avec succès : une ligne modifiée. La requête a été exécutée en 13 ms.

*/
-- Ce trigger permet de verifier lors d'une prescription qu'il y'a bien le personnel habilité à faire l'administration des produits
CREATE OR REPLACE FUNCTION check_affectation() RETURNS TRIGGER AS $check_affectation$
DECLARE
    v_heure time without time zone;
    v_code_medicament	INTEGER;
    v_id_specialite	INTEGER;
    v_id_qualification	INTEGER;
    m_specialite	VARCHAR(50);
    m_qualification	VARCHAR(50);
    v_id_affectation	INTEGER;
    v_id_employe	INTEGER;
    medecin_qualification VARCHAR(50);
    medecin_specialite    VARCHAR(50);
    v_id_periode	INTEGER;
BEGIN
	SELECT id_periode INTO v_id_periode FROM prescription_periode WHERE id_prescription = NEW.id_prescription;
	SELECT heure into v_heure from periode where id_periode = v_id_periode;
	SELECT code_medicament INTO v_code_medicament FROM prescription_medicament WHERE id_prescription = NEW.id_prescription;
	SELECT id_specialite INTO v_id_specialite FROM medicament_specialite WHERE code_medicament = v_code_medicament;
	SELECT id_qualification INTO v_id_qualification FROM medicament_qualification WHERE code_medicament = v_code_medicament;
	SELECT specialite INTO m_specialite FROM specialite WHERE id_specialite = v_id_specialite;
	SELECT qualification INTO m_qualification FROM qualification WHERE id_qualification = v_id_qualification;
	-- On verifie s'il y'a une affectation à la date indiquée dans la prescription
	SELECT id_affectation into v_id_affectation from affectation where date = NEW.date;
	IF v_id_affectation IS NULL THEN
	   RAISE NOTICE 'Pas d affectation à cette date, AFFECTATION URGENTE';
	   INSERT INTO affectation(date, urgence) VALUES(NEW.date,1);
	ELSE
	   select id_employe into v_id_employe from affectation_employe where id_affectation = v_id_affectation;
	   -- On selectionne la qualification et la specialité de l'employé pour comparer avec celles du medicament.
	   select qualification into medecin_qualification from employe_qualification where id_employe = v_id_employe;
	   select specialite into medecin_specialite from employe_specialite where id_employe = v_id_employe;
	   IF (m_specialite <> medecin_specialite and m_qualification <> medecin_qualification) THEN
		  RAISE NOTICE 'Il n y a pas de medecin habilité à faire cette administration, AFFECTATION URGENTE';
	   END IF;
	END IF;
END;
$check_affectation$ LANGUAGE plpgsql;

CREATE TRIGGER check_affectation BEFORE INSERT ON prescription
    FOR EACH ROW EXECUTE PROCEDURE check_affectation();

/*
						RESULTAT D'EXECUTION DU TRIGGER
						
INSERT INTO prescription (validee, date, dose, id_voie_administration, conseils)  VALUES
  (1, '09-10-2013', 400, 1,
   'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed gravida
   nulla non fringilla efficitur.')
Resultat : ERREUR:  Pas d affectation à cette date, AFFECTATION URGENTE
*/



