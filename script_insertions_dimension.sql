CREATE EXTENSION dblink;
SELECT dblink_connect('myconnec','hostaddr=10.44.88.226 dbname=TP3 user=postgres password=Tg18rm55$26');

CREATE OR REPLACE VIEW vue_emp AS
  SELECT *
    FROM dblink('myconnec', 'select id_employe, nom, prenom from employe')
    AS t1(id_employe INTEGER, nom VARCHAR, prenom VARCHAR);


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


select insert_dim_employe();


-- Vue patient
SELECT dblink_connect('myconnec','hostaddr=10.44.88.226 dbname=TP3 user=postgres password=Tg18rm55$26');
CREATE OR REPLACE VIEW vue_patient AS
  SELECT *
    FROM dblink('myconnec', 'select id_patient, nom, prenom, nom_mere, prenom_mere, date_naissance, no_assurance_maladie from patient')
    AS t2(id_patient INTEGER, nom VARCHAR, prenom VARCHAR, nom_mere VARCHAR, prenom_mere VARCHAR, date_naissance DATE, no_assurance_maladie VARCHAR );
    

CREATE OR REPLACE FUNCTION insert_dim_patient() RETURNS void AS $$
    DECLARE
    ma_ligne   vue_patient%ROWTYPE;
   
    BEGIN
    FOR ma_ligne IN SELECT * FROM vue_patient LOOP
       insert into patient(id_patient, nom, prenom, nom_mere, prenom_mere, date_naissance,no_assurance_maladie) values(ma_ligne.id_patient, ma_ligne.nom , ma_ligne.prenom, ma_ligne.nom_mere, ma_ligne.prenom_mere,ma_ligne.date_naissance,ma_ligne.no_assurance_maladie);
    END LOOP;
    END;
$$ LANGUAGE plpgsql;

select insert_dim_patient();

--vue sejour
SELECT dblink_connect('myconnec','hostaddr=10.44.88.226 dbname=TP3 user=postgres password=Tg18rm55$26');
CREATE OR REPLACE VIEW vue_sejour AS
  SELECT *
    FROM dblink('myconnec', 'select id_patient, date_debut, date_fin from sejour')
    AS t3(id_patient INTEGER, date_debut DATE, date_fin DATE);
 
CREATE OR REPLACE FUNCTION insert_dim_sejour() RETURNS void AS $$
    DECLARE
    ma_ligne   vue_sejour%ROWTYPE;
   
    BEGIN
    FOR ma_ligne IN SELECT * FROM vue_sejour LOOP
       insert into sejour(id_patient, date_debut, date_fin) values(ma_ligne.id_patient, ma_ligne.date_debut , ma_ligne.date_fin);
    END LOOP;
    END;
$$ LANGUAGE plpgsql;

-- vue medicament
SELECT dblink_connect('myconnec','hostaddr=10.44.88.226 dbname=TP3 user=postgres password=Tg18rm55$26');
CREATE OR REPLACE VIEW vue_medicament AS
  SELECT *
    FROM dblink('myconnec', 'select code_medicament from medicament')
    AS t4(code_medicament INTEGER);
 
 CREATE OR REPLACE FUNCTION insert_dim_medicament() RETURNS void AS $$
    DECLARE
    ma_ligne   vue_medicament%ROWTYPE;
   
    BEGIN
    FOR ma_ligne IN SELECT * FROM vue_medicament LOOP
       insert into medicament(code_medicament) values(ma_ligne.code_medicament);
    END LOOP;
    END;
$$ LANGUAGE plpgsql;

select insert_dim_medicament();

--vue prescription
SELECT dblink_connect('myconnec','hostaddr=10.44.88.226 dbname=TP3 user=postgres password=Tg18rm55$26');
CREATE OR REPLACE VIEW vue_prescription AS
  SELECT *
    FROM dblink('myconnec', 'select id_prescription, dose, conseils from prescription')
    AS t5(id_prescription INTEGER, dose VARCHAR, conseils TEXT);
 
 CREATE OR REPLACE FUNCTION insert_dim_prescription() RETURNS void AS $$
    DECLARE
    ma_ligne   vue_prescription%ROWTYPE;
   
    BEGIN
    FOR ma_ligne IN SELECT * FROM vue_prescription LOOP
       insert into prescription(id_prescription, dose, conseils) values(ma_ligne.id_prescription, ma_ligne.dose, ma_ligne.conseils);
    END LOOP;
    END;
$$ LANGUAGE plpgsql;

select insert_dim_prescription();


--vue affectation
SELECT dblink_connect('myconnec','hostaddr=10.44.88.226 dbname=TP3 user=postgres password=Tg18rm55$26');
CREATE OR REPLACE VIEW vue_affectation AS
  SELECT *
    FROM dblink('myconnec', 'select id_affectation, date, urgence from affectation')
    AS t5(id_affectation INTEGER, date, DATE, urgence SMALLINT);
 
 CREATE OR REPLACE FUNCTION insert_dim_affectation() RETURNS void AS $$
    DECLARE
    ma_ligne   vue_affectation%ROWTYPE;
   
    BEGIN
    FOR ma_ligne IN SELECT * FROM vue_affectation LOOP
       insert into affectation(id_affectation, date, urgence) values(ma_ligne.id_affectation, ma_ligne.date, ma_ligne.urgence);
    END LOOP;
    END;
$$ LANGUAGE plpgsql;

select insert_dim_affectation();