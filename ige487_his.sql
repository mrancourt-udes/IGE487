/* *****************************************************************************
** File: ige487_his.sql
** Desc: Script d'ajout de tuples historiques dans l’entrepôt
** Auth: Mamadou Cellou Soto Diallo
		     Jeremy Manceaux
		     Martin Rancourt
** Date: 06-12-2015
***************************************************************************** */
CREATE OR REPLACE FUNCTION check_nom() RETURNS TRIGGER AS $check_nom$
  DECLARE
	 incrementd DATE;
	 diff integer;
	 I integer;
  BEGIN
	 diff:=NEW.fin-NEW.debut;
	 FOR I in 0..diff LOOP
			incrementd:=NEW.debut + I;
			insert into employe_nom_temp(id_employe, nom, unpck_date) values(NEW.id_employe, NEW.nom, incrementd);
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
	 insert into employe_nom_DURING(id_employe, nom, debut,fin) values (OLD.id_employe, OLD.nom, OLD.nom_since, current_date);
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
			insert into employe_prenom_temp(id_employe, prenom, unpck_date) values(NEW.id_employe, NEW.prenom, incrementd);
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
	 insert into employe_prenom_DURING(id_employe, prenom, debut,fin) values (OLD.id_employe, OLD.prenom, OLD.prenom_since, current_date);
	 UPDATE employe_since SET prenom_since = current_date WHERE id_employe=OLD.id_employe;
	 RETURN NEW;
  END;
$check_p$ LANGUAGE plpgsql;

CREATE TRIGGER check_p AFTER UPDATE OF prenom ON employe_since
FOR EACH ROW EXECUTE PROCEDURE check_p();

 -- Requete pour tester l'enregistrement d'historique
 -- Voir les tables employe_nom_DURING et employe_prenom_DURING pour s'apercevoir de l'historisation effective.
UPDATE employe_since SET nom = 'NOM_TEST' WHERE id_employe= 1;
UPDATE employe_since SET prenom = 'PRENOM_TEST' WHERE id_employe=2;
