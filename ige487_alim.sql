/******************************************************************************
** File: ige487_alim.sql
** Desc: Script de creation de tables
**       Travail pratique 3 - Conception d'un entrepôt de données dimensionnel
**       Dans le cadre du cours IGE-487
**       modelisation de base de donnees
** Auth: Jeremy Manceaux
**       Martin Rancourt
**       Mamadou Cellou Soto Diallo

** Date: 28-11-2015
******************************************************************************/

CREATE EXTENSION dblink;
SELECT dblink_connect('myconnec','hostaddr=10.44.88.226 dbname=TP3 user=postgres password=Tg18rm55$26');

CREATE OR REPLACE VIEW vue_emp AS
  SELECT *
    FROM dblink('myconnec', 'select id_employe, nom, prenom from employe')
    AS t1(id_employe INTEGER, nom VARCHAR, prenom VARCHAR);

CREATE OR REPLACE VIEW vue_patient AS
  SELECT *
    FROM dblink('myconnec', 'select id_patient, nom, prenom, nom_mere, prenom_mere, date_naissance, no_assurance_maladie from patient')
    AS t2(id_patient INTEGER, nom VARCHAR, prenom VARCHAR, nom_mere VARCHAR, prenom_mere VARCHAR, date_naissance DATE, no_assurance_maladie VARCHAR );
    
CREATE OR REPLACE VIEW vue_sejour AS
  SELECT *
    FROM dblink('myconnec', 'select id_patient, date_debut, date_fin from sejour')
    AS t3(id_patient INTEGER, date_debut DATE, date_fin DATE);
    
CREATE OR REPLACE VIEW vue_medicament AS
  SELECT *
    FROM dblink('myconnec', 'select code_medicament from medicament')
    AS t4(code_medicament INTEGER);
CREATE OR REPLACE VIEW vue_prescription AS
  SELECT *
    FROM dblink('myconnec', 'select id_prescription, dose, conseils from prescription')
    AS t5(id_prescription INTEGER, dose VARCHAR, conseils TEXT);
 
CREATE OR REPLACE VIEW vue_affectation AS
  SELECT *
    FROM dblink('myconnec', 'select id_affectation, date, urgence from affectation')
    AS t6(id_affectation INTEGER, date DATE, urgence SMALLINT);

CREATE OR REPLACE VIEW vue_quart_travail AS
  SELECT *
    FROM dblink('myconnec', 'select id_quart_travail from quart_travail')
    AS t7(id_quart_travail INTEGER);

CREATE OR REPLACE VIEW vue_medecin_traitant AS
  SELECT *
    FROM dblink('myconnec', 'select id_employe, id_patient from medecin_traitant')
    AS t8(id_employe INTEGER, id_patient INTEGER);

CREATE OR REPLACE VIEW vue_prescriptions AS
  SELECT *
    FROM dblink('myconnec', 'select patient.id_patient, prescription.id_prescription, employe.id_employe from patient, employe, ordonnance, prescription where 
    ordonnance.id_ordonnance = prescription.id_ordonnance  and 
    ordonnance.id_patient=patient.id_patient and 
    ordonnance.id_employe = employe.id_employe')
    AS t9(id_patient INTEGER, id_prescription INTEGER, id_employe INTEGER);

CREATE OR REPLACE VIEW vue_admission AS
  SELECT *
    FROM dblink('myconnec', 'select sejour.id_patient, patient.id_patient, employe.id_employe, sejour.date_debut, sejour.date_fin from sejour, patient, medecin_traitant, employe where 
    sejour.id_patient = patient.id_patient and 
    patient.id_patient = medecin_traitant.id_patient and 
    employe.id_employe = medecin_traitant.id_employe')
    AS t10(id_sejour INTEGER, id_patient INTEGER, id_employe INTEGER, date_debut DATE, date_fin DATE);

CREATE OR REPLACE VIEW vue_affectations AS
  SELECT *
    FROM dblink('myconnec', 'select employe.id_employe, quart_travail.id_quart_travail, affectation.id_affectation from employe, quart_travail, affectation, affectation_employe,affectation_quart_travail where 
    affectation.id_affectation = affectation_employe.id_affectation and 
    affectation_employe.id_employe = employe.id_employe and
    affectation_quart_travail.id_quart_travail = quart_travail.id_quart_travail and
    affectation_quart_travail.id_affectation = affectation.id_affectation
    ')
    AS t11(id_employe INTEGER, id_quart_travail INTEGER, id_affectation INTEGER);

CREATE OR REPLACE FUNCTION insert_dim_employe() RETURNS void AS $$
    DECLARE
    vid integer;
    vnom varchar;
    vprenom varchar;
    ma_ligne   vue_emp%ROWTYPE;
   
    BEGIN
	FOR ma_ligne IN SELECT * FROM vue_emp LOOP
	   insert into employe(id_employe, nom, prenom) values(ma_ligne.id_employe, ma_ligne.nom , ma_ligne.prenom);
	END LOOP;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_dim_patient() RETURNS void AS $$
    DECLARE
    ma_ligne   vue_patient%ROWTYPE;
   
    BEGIN
    FOR ma_ligne IN SELECT * FROM vue_patient LOOP
       insert into patient(id_patient, nom, prenom, nom_mere, prenom_mere, date_naissance,no_assurance_maladie) values(ma_ligne.id_patient, ma_ligne.nom , ma_ligne.prenom, ma_ligne.nom_mere, ma_ligne.prenom_mere,ma_ligne.date_naissance,ma_ligne.no_assurance_maladie);
    END LOOP;
    END;
$$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION insert_dim_sejour() RETURNS void AS $$
    DECLARE
    ma_ligne   vue_sejour%ROWTYPE;
   
    BEGIN
    FOR ma_ligne IN SELECT * FROM vue_sejour LOOP
       insert into sejour(id_patient, date_debut, date_fin) values(ma_ligne.id_patient, ma_ligne.date_debut , ma_ligne.date_fin);
    END LOOP;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_dim_medicament() RETURNS void AS $$
    DECLARE
    ma_ligne   vue_medicament%ROWTYPE;
   
    BEGIN
    FOR ma_ligne IN SELECT * FROM vue_medicament LOOP
       insert into medicament(code_medicament) values(ma_ligne.code_medicament);
    END LOOP;
    END;
$$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION insert_dim_prescription() RETURNS void AS $$
    DECLARE
    ma_ligne   vue_prescription%ROWTYPE;
   
    BEGIN
    FOR ma_ligne IN SELECT * FROM vue_prescription LOOP
       insert into prescription(id_prescription, dose, conseils) values(ma_ligne.id_prescription, ma_ligne.dose, ma_ligne.conseils);
    END LOOP;
    END;
$$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION insert_dim_affectation() RETURNS void AS $$
    DECLARE
    ma_ligne   vue_affectation%ROWTYPE;
   
    BEGIN
    FOR ma_ligne IN SELECT * FROM vue_affectation LOOP
       insert into affectation(id_affectation, date, urgence) values(ma_ligne.id_affectation, ma_ligne.date, ma_ligne.urgence);
    END LOOP;
    END;
$$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION insert_dim_quart_travail() RETURNS void AS $$
    DECLARE
    ma_ligne   vue_quart_travail%ROWTYPE;
   
    BEGIN
    FOR ma_ligne IN SELECT * FROM vue_quart_travail LOOP
       insert into quart_travail(id_quart_travail) values(ma_ligne.id_quart_travail);
    END LOOP;
    END;
$$ LANGUAGE plpgsql;

create or replace function insert_admission_fact() returns void as $$
declare
l vue_admission%ROWTYPE;
s_code integer;
p_code integer;
e_code integer;
duree  integer;
begin
	for l in select * from vue_admission loop
		duree:= l.date_fin-l.date_debut;
		select code_sejour into s_code from sejour where id_patient=l.id_sejour;
		select code_patient into p_code from patient where id_patient = l.id_patient;
		select code_employe into e_code from employe where id_employe = l.id_employe;
		insert into admission_fact values(p_code, e_code, s_code, duree);
	end loop;
end;
$$ LANGUAGE plpgsql;

create or replace function insert_prescription_fact() returns void as $$
declare
l vue_prescriptions%ROWTYPE;
p_code integer;
e_code integer;
pr_code integer;
begin
	for l in select * from vue_prescriptions loop
		select code_patient into p_code from patient where id_patient=l.id_patient;
		select code_employe into e_code from employe where id_employe = l.id_employe;
		select code_prescription into pr_code from prescription where id_prescription = l.id_prescription;
		insert into prescription_fact values(p_code, pr_code, e_code);
	end loop;
end;
$$ LANGUAGE plpgsql;

create or replace function insert_medecin_traitant_fact() returns void as $$
declare
l vue_medecin_traitant%ROWTYPE;
p_code integer;
e_code integer;
begin
	for l in select * from vue_medecin_traitant loop
		select code_patient into p_code from patient where id_patient=l.id_patient;
		select code_employe into e_code from employe where id_employe = l.id_employe;
		insert into medecin_traitant_fact values(e_code, p_code);
	end loop;
end;
$$ LANGUAGE plpgsql;


create or replace function insert_affectation_fact() returns void as $$
declare
l vue_affectations%ROWTYPE;
e_code integer;
q_code integer;
a_code integer;
begin
	for l in select * from vue_affectations loop
		select code_affectation into a_code from affectation where id_affectation=l.id_affectation;
		select code_quart_travail into q_code from quart_travail where id_quart_travail = l.id_quart_travail;
		select code_employe into e_code from employe where id_employe = l.id_employe;
		insert into plannification_affectation_fact values(e_code,q_code, a_code);
	end loop;
end;
$$ LANGUAGE plpgsql;
select insert_dim_employe();
select insert_dim_patient();
select insert_dim_sejour();
select insert_dim_medicament();
select insert_dim_prescription();
select insert_dim_affectation();
select insert_dim_quart_travail();
select insert_medecin_traitant_fact();
select insert_prescription_fact();
select insert_admission_fact();
select insert_affectation_fact();