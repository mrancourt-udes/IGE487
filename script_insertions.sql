-------------------------------------------------------------------------------
-- Ajout des contraites
-------------------------------------------------------------------------------

/******************************************************************************
** File: script_insertions.sql
** Desc: Script d'insertion des donnes tests
**       Travail pratique 1 - Modélisation-conception d'une base de données
**       Dans le cadre du cours IGE-487
** Auth: Mamadou Cellou Soto Diallo
**       Jeremy Manceaux
**       Martin Rancourt
** Date: 15-09-2015
******************************************************************************/

INSERT INTO patient (nom, prenom, nom_mere, prenom_mere, date_naissance, no_assurance_maladie) VALUES
  ('Willmon', 'Michael', 'Medina', 'Rosemary', '10-10-1973', 'wilm73101010'),
  ('Lowrey', 'Kelly', 'Shatley', 'Andrea', '08-25-1976', 'lowk76582515'),
  ('Anderson', 'Marta', 'Lemire', 'Kathy', '08-28-1946', 'andm46582812'),
  ('Burkley', 'Vincent', 'Mercier', 'Lena', '10-16-1976', 'bukv76101609'),
  ('Harold', 'Morris', 'Howard', 'Martha', '12-06-1971', 'harm71120611'),
  ('OTommys', 'Tanya', 'Miles', 'Lillie', '11-05-1941', 'otan41610501'),
  ('Hernandez', 'Megan', 'Gonzalez', 'Valerie', '03-30-1992', 'herm92533014'),
  ('Jordan', 'Nora', 'Kinder', 'Marsha', '03-04-1950', 'jorn50530117'),
  ('Briggs', 'Miriam', 'Longoria', 'Jenny', '05-01-1995', 'brim95510518'),
  ('Rodriguez', 'Paul', 'Maddox', 'Shayna', '09-16-1992', 'rodp92091616');

INSERT INTO employe (nom, prenom) VALUES
  ('Corbeil', 'Charlotte'),
  ('Fabien', 'Therriault'),
  ('Christian', 'Houde'),
  ('Estelle', 'Arnoux'),
  ('Patrice', 'Descoteaux'),
  ('Oliver', 'Lessard'),
  ('Robert', 'Paquet'),
  ('Eloise', 'Bonneville'),
  ('Patrick', 'Deslauriers'),
  ('Didier', 'Huard');

INSERT INTO annuaire (id_employe, numero) VALUES
  (1, '1 819-238-0932'),
  (2, '1 514-777-2084'),
  (3, '1 514-636-1650'),
  (4, '1 819-794-0225'),
  (5, '1 418-941-7155'),
  (6, '1 819-587-8905'),
  (7, '1 514-996-7833'),
  (8, '1 819-824-4847'),
  (9, '1 819-949-1257'),
  (10, '1 819-540-0414');

INSERT INTO qualification (qualification) VALUES
  ('Auxiliere'),
  ('Infirmiere'),
  ('Technicien'),
  ('Médecin'),
  ('Médecin généraliste'),
  ('Infirmiere chef'),
  ('Prépose');

INSERT INTO specialite (specialite) VALUES
  ('Anesthésiologie'),
  ('Biochimie médicale'),
  ('Chirurgie cardiaque'),
  ('Chirurgie colorectale'),
  ('Chirurgie générale'),
  ('Chirurgie orthopédique'),
  ('Chirurgie plastique'),
  ('Chirurgie thoracique'),
  ('Chirurgie vasculaire'),
  ('Dermatologie'),
  ('Gastro-entérologie'),
  ('Génétique médicale'),
  ('Gériatrie'),
  ('Hématologie'),
  ('Néphrologie'),
  ('Neurochirurgie'),
  ('Neurologie'),
  ('Neuropathologie'),
  ('Oncologie'),
  ('Ophtalmologie'),
  ('Orthopédie'),
  ('Pédiatrie'),
  ('Psychiatrie'),
  ('Radio-oncologie'),
  ('Rhumatologie'),
  ('Urologie');

INSERT INTO medicament (code, medicament, format) VALUES
  ('02022826'),
  ('02216965'),
  ('01902652'),
  ('02286556'),
  ('02305682'),
  ('01997769'),
  ('02217422'),
  ('02244366'),
  ('02228955'),
  ('02238560'),
  ('02182963'),
  ('00282081');

INSERT INTO periode (heure) VALUES
  ('00:00:00'),
  ('01:00:00'),
  ('02:00:00'),
  ('03:00:00'),
  ('04:00:00'),
  ('05:00:00'),
  ('06:00:00'),
  ('07:00:00'),
  ('08:00:00'),
  ('09:00:00'),
  ('10:00:00'),
  ('11:00:00'),
  ('12:00:00'),
  ('13:00:00'),
  ('14:00:00'),
  ('15:00:00'),
  ('16:00:00'),
  ('17:00:00'),
  ('18:00:00'),
  ('19:00:00'),
  ('20:00:00'),
  ('21:00:00'),
  ('22:00:00'),
  ('23:00:00'),
  ('24:00:00');