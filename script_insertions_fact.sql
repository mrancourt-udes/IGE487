SELECT dblink_connect('myconnec','hostaddr=10.44.88.226 dbname=TP3 user=postgres password=Tg18rm55$26');

CREATE OR REPLACE VIEW vue_medecin_traitant AS
  SELECT *
    FROM dblink('myconnec', 'select id_employe, id_patient from medecin_traitant')
    AS t1(id_employe INTEGER, id_patient INTEGER);

create or replace function insert_medecin_traitant_fact() returns void as $$
declare
l vue_medecin_traitant%ROWTYPE;
p_code integer;
e_code integer;
begin
	for l in select * from vue_medecin_traitant loop
		select code_patient into p_code from patient where id_patient=l.id_patient;
		select code_employe into e_code from employe where id_employe = l.id_employe;
		insert into medecin_traitant_fact values(e_code, p_code, 10);
	end loop;
end;
$$ LANGUAGE plpgsql;

select insert_medecin_traitant_fact();


--insertion dans prescription_fact
CREATE OR REPLACE VIEW vue_prescription AS
  SELECT *
    FROM dblink('myconnec', 'select patient.id_patient, prescription.id_prescription, employe.id_employe from patient, employe, ordonnance, prescription where 
    ordonnance.id_ordonnance = prescription.id_ordonnance  and ordonnance.id_patient=patient.id_patient and ordonnance.id_employe = employe.id_employe')
    AS t1(id_patient INTEGER, id_prescription INTEGER, id_employe INTEGER);
    

create or replace function insert_prescription_fact() returns void as $$
declare
l vue_prescription%ROWTYPE;
p_code integer;
e_code integer;
pr_code integer;
begin
	for l in select * from vue_prescription loop
		select code_patient into p_code from patient where id_patient=l.id_patient;
		select code_employe into e_code from employe where id_employe = l.id_employe;
		select code_prescription into pr_code from prescription where id_prescription = l.id_prescription;
		insert into prescription_fact values(p_code, pr_code, e_code, 11, 10);
	end loop;
end;
$$ LANGUAGE plpgsql;

select insert_prescription_fact();


CREATE OR REPLACE VIEW vue_admission AS
  SELECT *
    FROM dblink('myconnec', 'select sejour.id_patient, patient.id_patient, employe.id_employe from sejour, patient, medecin_traitant, employe where 
    sejour.id_patient = patient.id_patient and patient.id_patient = medecin_traitant.id_patient and employe.id_employe = medecin_traitant.id_employe')
    AS t1(id_sejour INTEGER, id_patient INTEGER, id_employe INTEGER);
    

create or replace function insert_admission_fact() returns void as $$
declare
l vue_admission%ROWTYPE;
s_code integer;
p_code integer;
e_code integer;
begin
	for l in select * from vue_admission loop
		select code_sejour into s_code from sejour where id_patient=l.id_sejour;
		select code_patient into p_code from patient where id_patient = l.id_patient;
		select code_employe into e_code from employe where id_employe = l.id_employe;
		insert into admission_fact values(s_code,p_code , e_code, 11, 10);
	end loop;
end;
$$ LANGUAGE plpgsql;

select insert_admission_fact();



CREATE OR REPLACE VIEW vue_affectation AS
  SELECT *
    FROM dblink('myconnec', 'select employe.id_employe, quart_travail.id_quart_travail, affectation.id_affectation from employe, quart_travail, affectation, affectation_employe,affectation_quart_travail where 
    affectation.id_affectation = affectation_employe.id_affectation and 
    affectation_employe.id_employe = employe.id_employe and
    affectation_quart_travail.id_quart_travail = quart_travail.id_quart_travail and
    affectation_quart_travail.id_affectation = affectation.id_affectation
    ')
    AS t1(id_employe INTEGER, id_quart_travail INTEGER, id_affectation INTEGER);
    

create or replace function insert_affectation_fact() returns void as $$
declare
l vue_affectation%ROWTYPE;
e_code integer;
q_code integer;
a_code integer;
begin
	for l in select * from vue_affectation loop
		select code_affectation into a_code from affectation where id_affectation=l.id_affectation;
		select code_quart_travail into q_code from quart_travail where id_quart_travail = l.id_quart_travail;
		select code_employe into e_code from employe where id_employe = l.id_employe;
		insert into plannification_affectation_fact values(e_code,q_code, a_code, 11);
	end loop;
end;
$$ LANGUAGE plpgsql;

select insert_affectation_fact();


