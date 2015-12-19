/* *****************************************************************************
** File: ige487_his.sql
** Desc: Script d'ajout de tuples historiques dans l’entrepôt
** Auth: Mamadou Cellou Soto Diallo
		     Jeremy Manceaux
		     Martin Rancourt
** Date: 06-12-2015
***************************************************************************** */

SET search_path TO edt;

DROP TRIGGER IF EXISTS check_nom ON employe_nom_DURING;
DROP TRIGGER IF EXISTS check_nom_insert ON employe_nom_temp;
DROP TRIGGER IF EXISTS check_n ON employe_since;

DROP TRIGGER IF EXISTS check_prenom ON employe_prenom_DURING;
DROP TRIGGER IF EXISTS check_prenom_insert ON employe_prenom_temp;
DROP TRIGGER IF EXISTS check_p ON employe_since;

DROP TRIGGER IF EXISTS check_no_assurance_maladie ON patient_no_assurance_maladie_DURING;
DROP TRIGGER IF EXISTS check_no_assurance_maladie_insert ON patient_no_assurance_maladie_temp;
DROP TRIGGER IF EXISTS check_n_a_m ON patient_since;

CREATE OR REPLACE FUNCTION check_nom() RETURNS TRIGGER AS $check_nom$
  DECLARE
	 incrementd DATE;
	 diff integer;
	 I integer;
  BEGIN
	 diff:=NEW.fin-NEW.debut;
	 FOR I in 0..diff LOOP
			incrementd:=NEW.debut + I;
			INSERT INTO employe_nom_temp(id_employe, nom, unpck_date) values(NEW.id_employe, NEW.nom, incrementd);
	 END LOOP;
	 RETURN NEW;
  END;
$check_nom$ LANGUAGE plpgsql;

CREATE TRIGGER check_nom BEFORE INSERT ON employe_nom_DURING
 FOR EACH ROW EXECUTE PROCEDURE check_nom();


CREATE OR REPLACE FUNCTION check_nom_insert() RETURNS TRIGGER AS $check_nom_insert$
  DECLARE
   nbre INTEGER;
  BEGIN
		select count(*) into nbre from employe_nom_temp where 
		id_employe = NEW.id_employe and unpck_date = NEW.unpck_date;
		IF nbre > 0 THEN
			RAISE EXCEPTION 'ERREUR DUPLICAT';
		END IF;
		RETURN NEW;
  END;
$check_nom_insert$ LANGUAGE plpgsql;

CREATE TRIGGER check_nom_insert BEFORE INSERT ON employe_nom_temp
FOR EACH ROW EXECUTE PROCEDURE check_nom_insert();


CREATE OR REPLACE FUNCTION check_n() RETURNS TRIGGER AS $check_n$
  DECLARE
  BEGIN
	 INSERT INTO employe_nom_DURING(id_employe, nom, debut,fin) values (OLD.id_employe, OLD.nom, OLD.nom_since, current_date);
	 UPDATE employe_since SET nom_since = current_date WHERE id_employe=OLD.id_employe;
	 RETURN NEW;
  END;
$check_n$ LANGUAGE plpgsql;

CREATE TRIGGER check_n AFTER UPDATE OF nom ON employe_since
FOR EACH ROW EXECUTE PROCEDURE check_n();


--------EMPLOYE PRENOM------

CREATE OR REPLACE FUNCTION check_prenom() RETURNS TRIGGER AS $check_prenom$
  DECLARE
	 incrementd DATE;
	 diff 		INTEGER;
	 I 			INTEGER;
  BEGIN
	 diff:=NEW.fin-NEW.debut;
	 FOR I in 0..diff LOOP
			incrementd:=NEW.debut + I;
			INSERT INTO employe_prenom_temp(id_employe, prenom, unpck_date) values(NEW.id_employe, NEW.prenom, incrementd);
	 END LOOP;
	 RETURN NEW;
	 
  END;
$check_prenom$ LANGUAGE plpgsql;

CREATE TRIGGER check_prenom BEFORE INSERT ON employe_prenom_DURING
 FOR EACH ROW EXECUTE PROCEDURE check_prenom();


CREATE OR REPLACE FUNCTION check_prenom_insert() RETURNS TRIGGER AS $check_prenom_insert$
  DECLARE
   nbre INTEGER;
  BEGIN
		select count(*) into nbre from employe_prenom_temp where 
		id_employe = NEW.id_employe and unpck_date = NEW.unpck_date;
		IF nbre > 0 THEN
			RAISE EXCEPTION 'ERREUR DUPLICAT';
		END IF;
		RETURN NEW;
  END;
$check_prenom_insert$ LANGUAGE plpgsql;

CREATE TRIGGER check_prenom_insert BEFORE INSERT ON employe_prenom_temp
FOR EACH ROW EXECUTE PROCEDURE check_prenom_insert();


CREATE OR REPLACE FUNCTION check_p() RETURNS TRIGGER AS $check_p$
  BEGIN
	 INSERT INTO employe_prenom_DURING(id_employe, prenom, debut,fin) values (OLD.id_employe, OLD.prenom, OLD.prenom_since, current_date);
	 UPDATE employe_since SET prenom_since = current_date WHERE id_employe=OLD.id_employe;
	 RETURN NEW;
  END;
$check_p$ LANGUAGE plpgsql;

CREATE TRIGGER check_p AFTER UPDATE OF prenom ON employe_since
FOR EACH ROW EXECUTE PROCEDURE check_p();

-- No assurance maladie patient
CREATE OR REPLACE FUNCTION check_no_assurance_maladie() RETURNS TRIGGER AS $check_no_assurance_maladie$
  DECLARE
	 incrementd DATE;
	 diff integer;
	 I integer;
  BEGIN
	 diff:=NEW.fin-NEW.debut;
	 FOR I in 0..diff LOOP
			incrementd:=NEW.debut + I;
			INSERT INTO patient_no_assurance_maladie_temp(id_patient, no_assurance_maladie, unpck_date) values(NEW.id_patient, NEW.no_assurance_maladie, incrementd);
	 END LOOP;
	 RETURN NEW;
  END;
$check_no_assurance_maladie$ LANGUAGE plpgsql;

CREATE TRIGGER check_no_assurance_maladie BEFORE INSERT ON patient_no_assurance_maladie_DURING
 FOR EACH ROW EXECUTE PROCEDURE check_no_assurance_maladie();

CREATE OR REPLACE FUNCTION check_no_assurance_maladie_insert() RETURNS TRIGGER AS $check_no_assurance_maladie_insert$
  DECLARE
   nbre INTEGER;
  BEGIN
		select count(*) into nbre from patient_no_assurance_maladie_temp where
		id_patient = NEW.id_patient and unpck_date = NEW.unpck_date;
		IF nbre > 0 THEN
			RAISE EXCEPTION 'ERREUR DUPLICAT';
		END IF;
		RETURN NEW;
  END;
$check_no_assurance_maladie_insert$ LANGUAGE plpgsql;

CREATE TRIGGER check_no_assurance_maladie_insert BEFORE INSERT ON patient_no_assurance_maladie_temp
FOR EACH ROW EXECUTE PROCEDURE check_no_assurance_maladie_insert();


CREATE OR REPLACE FUNCTION check_n_a_m() RETURNS TRIGGER AS $check_n_a_m$
  DECLARE
  BEGIN
	 INSERT INTO patient_no_assurance_maladie_DURING(id_patient, no_assurance_maladie, debut,fin) values (OLD.id_patient, OLD.no_assurance_maladie, OLD.no_assurance_maladie_since, current_date);
	 UPDATE patient_since SET no_assurance_maladie_since = current_date WHERE id_patient=OLD.id_patient;
	 RETURN NEW;
  END;
$check_n_a_m$ LANGUAGE plpgsql;

CREATE TRIGGER check_n_a_m AFTER UPDATE OF no_assurance_maladie ON patient_since
FOR EACH ROW EXECUTE PROCEDURE check_n_a_m();


 -- Requete pour tester l'enregistrement d'historique
 -- Voir les tables employe_nom_DURING et employe_prenom_DURING pour s'apercevoir de l'historisation effective.
UPDATE employe_since SET nom = 'NOM_TEST' WHERE id_employe= 1;
UPDATE employe_since SET prenom = 'PRENOM_TEST' WHERE id_employe=2;
UPDATE patient_since SET no_assurance_maladie = 'wilm73601010' WHERE id_patient=1;
