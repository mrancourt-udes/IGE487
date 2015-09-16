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

INSERT INTO qualification (qualification) VALUES
  ('Auxiliere'),
  ('Infirmiere'),
  ('Technicien'),
  ('Médecin'),
  ('Médecin généraliste'),
  ('Infirmiere chef'),
  ('Prépose');

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