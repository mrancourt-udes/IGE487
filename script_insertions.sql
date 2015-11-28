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

-------------------------------------------------------------------------------
-- Nettoyage complet des donnees et des sequences
-------------------------------------------------------------------------------
TRUNCATE
patient, lit, chambre, unite_soin, equipe, employe, annuaire, qualification,
specialite, medicament, format, voie_administration, prescription, ordonnance,
periode, quart_travail, affectation, chambre_lit,
unite_soin_chambre, equipe_unite_soin, employe_equipe, employe_qualification,
employe_specialite, qualification_prealable, medicament_specialite,
medicament_qualification, prescription_medicament, format_medicament,
voie_administration_medicament,
prescription_periode, periode_quart_travail,
affectation_quart_travail, employe_quart_travail, error
RESTART IDENTITY CASCADE;

INSERT INTO employe (nom, prenom) VALUES
  ('Corbeil', 'Charlotte'),
  ('Therriault', 'Fabien'),
  ('Houde', 'Christian'),
  ('Arnoux' ,'Estelle'),
  ('Descoteaux', 'Patrice'),
  ('Lessard', 'Oliver'),
  ('Paquet', 'Robert'),
  ('Bonneville', 'Eloise'),
  ('Deslauriers', 'Patrick'),
  ('Huard', 'Didier'),
  ('Masson', 'Lorraine'),
  ('Deniger', 'René'),
  ('Blais', 'Tyson'),
  ('Butz', 'Élizabeth'),
  ('Pinneau', 'Marie'),
  ('Potvin', 'Solaine'),
  ('Star', 'Roxanne'),
  ('Pitre', 'Bernard'),
  ('Bédard', 'Thiery'),
  ('Poulin', 'Thomas'),
  ('Allard', 'Alexandre'),
  ('Deschamps', 'Francis'),
  ('Lécuyer', 'Nicolas'),
  ('Vachon', 'Laurence'),
  ('Priest', 'Philippe'),
  ('Reousseau', 'Arthur'),
  ('Bélanger', 'Mike'),
  ('Lafortune', 'Gabriel');

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

INSERT INTO annuaire (id_employe, numero_telephone) VALUES
  (1, '1 819-238-0932'),
  (2, '1 514-777-2084'),
  (3, '1 514-636-1650'),
  (4, '1 819-794-0225'),
  (5, '1 418-941-7155'),
  (6, '1 819-587-8905'),
  (7, '1 514-996-7833'),
  (7, '1 514-732-2017'),
  (8, '1 819-824-4847'),
  (9, '1 819-949-1257'),
  (10, '1 819-540-0414'),
  (11, '1 819-632-6724'),
  (12, '1 819-798-1367'),
  (13, '1 819-433-9284'),
  (14, '1 819-799-5408'),
  (15, '1 819-625-6411'),
  (15, '1 418-660-5022'),
  (16, '1 819-368-9917'),
  (17, '1 819-495-0996'),
  (18, '1 418-242-5078'),
  (19, '1 819-516-4889'),
  (20, '1 514-538-1806'),
  (21, '1 819-377-1628'),
  (22, '1 819-864-5906'),
  (23, '1 819-528-2436'),
  (24, '1 450-458-0287'),
  (25, '1 819-777-1218'),
  (26, '1 819-731-8824'),
  (27, '1 819-954-4271'),
  (28, '1 819-761-0366');

INSERT INTO qualification (qualification) VALUES
  ('Médecin'),
  ('Technicien'),
  ('Infirmiere'),
  ('Infirmiere chef'),
  ('Auxiliere'),
  ('Prépose');

INSERT INTO qualification_prealable (id_qualification, id_prealable) VALUES
  /* Une infirmiere peut administrer un medicament exigeant la qualification
   d'auxiliaire */
  (3, 5),
  /* l'infirmiere chef aussi */
  (4, 5),
  /* un medecin celle d'infirmiere */
  (1, 3),
  /* un medecin celle d'une prepose */
  (1, 6),
  /* un medecin celle d'un technicien dans la mesure ou le medecin possede
     egalement la spécialite requise. */
  (3, 2);

/*
* Note : La medecine generale est consideree comme une specialite, mais elle n'a
* pas de correspondance pour les techniciens
*/
INSERT INTO specialite (specialite) VALUES
  ('Médecin généraliste'),
  ('Anesthésiologie'),
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
  ('Rhumatologie'),
  ('Urologie');

INSERT INTO medicament (code_medicament) VALUES
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

INSERT INTO medicament_specialite (code_medicament, id_specialite) VALUES
  ('02022826', 12),
  ('02216965', 11),
  ('01902652', 16),
  ('02286556', 2),
  ('02305682', 4),
  ('01997769', 10),
  ('02217422', 17),
  ('02244366', 14),
  ('02228955', 2),
  ('02238560', 3),
  ('02182963', 4),
  ('00282081', 4);

INSERT INTO medicament_qualification (code_medicament, id_qualification) VALUES
  ('02022826', 5),
  ('02216965', 4),
  ('01902652', 4),
  ('02286556', 6),
  ('02305682', 4),
  ('01997769', 1),
  ('02217422', 6),
  ('02244366', 4),
  ('02228955', 5),
  ('02238560', 3),
  ('02182963', 3),
  ('00282081', 1);

/**
*  Association des qualifications :
*   1 => Médecin
*   2 => Technicien
*   3 => Infirmiere
*   4 => Infirmiere chef
*   5 => Auxiliere
*   6 => Prépose
*/
INSERT INTO employe_qualification (id_employe, id_qualification) VALUES
  (1, 2),
  (2, 3),
  (3, 3),
  (4, 5),
  (5, 6),
  (6, 1),
  (8, 6),
  (9, 1),
  (11, 5),
  (12, 2),
  (13, 4),
  (14, 6),
  (15, 2),
  (16, 3),
  (17, 1),
  (18, 4),
  (19, 2),
  (20, 6),
  (21, 1),
  (22, 2),
  (23, 3),
  (24, 5),
  (25, 2),
  (26, 3),
  (27, 5),
  (28, 3);

/*
*  NOTE :
*   La medecine generale est consideree comme une specialite, mais elle
*   n'a pas de correspondance pour les techniciens
*/
INSERT INTO employe_specialite (id_employe, id_specialite) VALUES
  (1, 2),
  (1, 10),
  (5, 3),
  (6, 7),
  (6, 8),
  (6, 11),
  (9, 17),
  (9, 9),
  (10, 5),
  (11,1),
  (12,1),
  (13,1),
  (14,1),
  (15,1),
  (16,1),
  (17,1),
  (18,1),
  (19,1),
  (20,1);

INSERT INTO equipe (id_equipe, id_infirmiere_chef) VALUES
  (1, 13),
  (2, 18);

/* NOTE :
*   Une equipe est composee
*     - D'une infirmiere-chef (reference dans la table equipe)
*     - D'infirmieres
*     - D'auxiliaires
*     - De preposes
*/
INSERT INTO employe_equipe (id_equipe, id_employe) VALUES
  -- Equipe 1
    -- Infirmiere
  (1, 3),
  (1, 2),
  (1, 16),
  (1, 23),
  -- Auxiliaires
  (1, 4),
  (1, 24),
  -- Preposes
  (1, 5),
  (1, 8),

  -- Equipe 2
    -- Infirmieres
  (2, 3),
  (2, 26),
  (2, 28),
  -- Auxiliaires
  (2, 11),
  (2, 27),
  -- Preposes
  (2, 14),
  (2, 20);

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

INSERT INTO lit (id_lit) VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (9),
  (10);

INSERT INTO chambre (id_chambre) VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (9),
  (10);

INSERT INTO chambre_lit (id_chambre, id_lit) VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (2, 5),
  (2, 6),
  (2, 7),
  (2, 8),
  (3, 9),
  (3, 10);

INSERT INTO unite_soin (id_unite_soin) VALUES
  (1),
  (2),
  (3),
  (4);

INSERT INTO unite_soin_chambre (id_unite_soin, id_chambre)  VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (2, 5),
  (2, 6),
  (2, 7),
  (3, 8),
  (3, 9),
  (3, 10);

INSERT INTO equipe_unite_soin (id_equipe, id_unite_soin)  VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (2, 4);


INSERT INTO sejour(id_patient, date_debut, date_fin, id_unite_soin, id_chambre, id_lit) VALUES
  (1, '11-02-2015', '11-12-2015', 1, 1, 3),
  (2, '11-02-2015', '11-08-2015', 2, 2, 1),
  (3, '11-03-2015', '11-06-2015', 1, 4, 5),
  (4, '11-05-2015', '11-09-2015', 3, 3, 6),
  (5, '11-05-2015', '11-06-2015', 1, 2, 1),
  (6, '11-07-2015', '11-15-2015', 4, 5, 3),
  (7, '11-07-2015', '11-22-2015', 4, 7, 1),
  (8, '11-07-2015', '11-13-2015', 2, 8, 8),
  (9, '11-08-2015', '11-16-2015', 3, 1, 10),
  (10, '11-12-2015', '11-16-2015', 1, 10, 9);

INSERT INTO medecin_traitant(id_employe, id_patient, date_debut, date_fin) VALUES
  (1, 1, '11-02-2015', '11-12-2015'),
  (5, 2, '11-02-2015', '11-08-2015'),
  (8, 3, '11-03-2015', '11-06-2015'),
  (5, 4, '11-05-2015', '11-09-2015'),
  (3, 5, '11-05-2015', '11-06-2015'),
  (10, 6, '11-07-2015', '11-15-2015'),
  (6, 7, '11-07-2015', '11-22-2015'),
  (8, 8, '11-07-2015', '11-10-2015'),
  (3, 9, '11-08-2015', '11-16-2015'),
  (8, 10, '11-12-2015', '11-16-2015');

INSERT INTO format (format) VALUES
  (1),
  (1.5),
  (2),
  (3),
  (3.8),
  (7),
  (8),
  (10),
  (12),
  (20),
  (21),
  (28),
  (30),
  (36),
  (40),
  (42),
  (50),
  (53),
  (56),
  (60),
  (90),
  (100),
  (108),
  (120),
  (160),
  (210),
  (225),
  (240),
  (475),
  (500);

INSERT INTO format_medicament (id_format, code_medicament) VALUES
  (1,02022826),
  (1,02216965),
  (1,02305682),
  (2,02286556),
  (2,02182963),
  (3,00282081),
  (3,02228955),
  (4,01902652),
  (4,02217422),
  (4,02244366),
  (6,02182963),
  (6,02286556),
  (6,01997769),
  (6,02305682),
  (8,02238560),
  (9,00282081),
  (9,01997769),
  (11,02228955),
  (12,02216965),
  (12,02217422),
  (12,02305682),
  (12,02022826),
  (15,01997769),
  (17,02238560),
  (17,00282081),
  (18,01902652),
  (21,02238560),
  (21,02305682),
  (21,02286556),
  (23,02217422),
  (23,02238560),
  (26,00282081),
  (26,02238560),
  (26,02022826),
  (27,02217422),
  (27,02228955),
  (28,02182963),
  (29,01902652),
  (30,02305682),
  (30,01997769);

INSERT INTO voie_administration (voie_administration) VALUES
  ('Orale'),
  ('Injection'),
  ('Topique'),
  ('Perfusion');

INSERT INTO voie_administration_medicament (id_voie_administration, code_medicament) VALUES
  (1,02022826),
  (1,02216965),
  (1,01902652),
  (1,02286556),
  (2,02305682),
  (2,02022826),
  (2,01997769),
  (2,02217422),
  (2,01902652),
  (3,02244366),
  (3,02305682),
  (3,02228955),
  (3,02238560),
  (3,02182963);

INSERT INTO ordonnance (id_ordonnance, id_employe, id_patient, date_emission, date_fin) VALUES
  (1, 6, 2, '09-10-2015', '09-10-2015'),
  (2, 9, 4, '09-12-2015', '09-12-2015'),
  (3, 17, 5, '09-13-2015', '09-13-2015'),
  (4, 17, 6, '09-15-2015', '09-15-2015'),
  (5, 21, 10, '09-16-2015', '09-16-2015');

INSERT INTO prescription (id_ordonnance, validee, dose, id_voie_administration, conseils)  VALUES
  (1, 1, 400, 1,
   'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed gravida
   nulla non fringilla efficitur. Phasellus vehicula porttitor elementum.'),
  (2, 1, 1200, 2,
   'Vestibulum quam mauris, congue vitae pretium sit amet, mattis ac ipsum.
   Integer viverra finibus tortor, quis sagittis felis. Nullam varius nibh
   eu lectus euismod, vel malesuada magna euismod.'),
  (3, 0, 50, 2,
   'In mi ex, placerat a est in, consequat auctor libero. Sed pulvinar
   odio sit amet sem finibus, vel porta turpis euismod. Donec vestibulum
   ultrices neque ac accumsan.'),
  (4, 1, 100, 3,
   'In suscipit, ligula at ultrices lacinia, mauris ligula auctor lacus'),
  (5, 0, 10, 1,
   'Condimentum bibendum metus pharetra accumsan. In placerat magna sit
   amet pharetra scelerisque. Quisque ut iaculis ipsum. Maecenas aliquam
    ultricies nisl, at ultricies enim hendrerit at.');

INSERT INTO prescription_medicament (id_prescription, code_medicament) VALUES
  (1, 02244366),
  (2, 02305682),
  (3, 02244366),
  (4, 01902652),
  (5, 02022826);

INSERT INTO quart_travail (id_quart_travail) VALUES
  (1),
  (2),
  (3);

INSERT INTO periode_quart_travail (id_periode, id_quart_travail) VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 1),
  (5, 1),
  (6, 1),
  (7, 1),
  (8, 1),
  (9, 2),
  (10,2),
  (11, 2),
  (12, 2),
  (13, 2),
  (14, 2),
  (15, 2),
  (16, 2),
  (17, 3),
  (18, 3),
  (19, 3),
  (20, 3),
  (21, 3),
  (22, 3),
  (23, 3),
  (24, 3);

INSERT INTO employe_quart_travail (id_employe, id_quart_travail) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 1),
  (5, 2),
  (6, 3),
  (7, 1),
  (8, 2),
  (9, 3),
  (10, 1),
  (11, 1),
  (12, 2),
  (13, 3),
  (14, 3),
  (15, 1),
  (16, 2),
  (17, 2),
  (18, 3),
  (19, 1),
  (20, 2),
  (21, 3),
  (22, 3),
  (23, 1),
  (24, 1),
  (25, 1),
  (26, 2),
  (27, 2),
  (28, 2);

INSERT INTO prescription_periode (id_prescription, id_periode) VALUES
  (1, 9),
  (1, 12),
  (1, 15),
  (1, 18),
  (1, 21),
  (2, 3),
  (2, 7),
  (3, 1),
  (3, 12),
  (4, 13),
  (4, 17),
  (4, 22),
  (5, 9),
  (5, 12),
  (5, 15);

INSERT INTO affectation (date,urgence) VALUES
  ('2013-06-09',0),
  ('2012-10-09',0),
  ('2015-12-09',0),
  ('2014-10-09',0);

INSERT INTO affectation_employe (id_affectation, id_employe) VALUES
  (1,2),
  (2,4),
  (3,6),
  (4,5);

INSERT INTO affectation_quart_travail (id_affectation, id_quart_travail) VALUES
  (1,2),
  (2,3),
  (3,1),
  (4,2);

INSERT INTO error (code_error,libelle_error) VALUES
  (100,'Seul un medeci peut établir une ordonnance'),
  (101,'Seul un medecin généraliste peut être affecté à un patient'),
  (102,'Seuls les medecins et les techniciens peuvent avoir de specialité'),
  (103,'Un technicien ne peut pas être medecin généraliste'),
  (104,'Le chef d equipe doit être Infirmière Chef'),
  (105,'Cette chambre a atteint son nombre maximum de lits'),
  (106,'Pas d affectation à cette date, AFFECTATION URGENTE'),
  (107,'Il n y a pas de medecin habilité à faire cette administration, AFFECTATION URGENTE');