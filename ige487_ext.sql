/* *****************************************************************************
** File: ige487_ext.sql
** Desc: Script d'extraction du journal de la base de données
** Auth: Mamadou Cellou Soto Diallo
		     Jeremy Manceaux
		     Martin Rancourt
** Date: 06-12-2015
***************************************************************************** */

/**
NOTE:
L’extraction de journaux de la base de données et l’alimentation subséquente de
la base de données temporelle à l’aide du journal est une tâche plutôt lourde
pour le bénéfice que cela apporte. C’est pourquoi, en raison de notre équipe
réduite, nous avons plutôt opté pour alimenter la base de données temporalisée
en récupérant directement les informations sur la base de données
transactionnelle en utilisant deux schémas.

Il est important de noter que cette application ne serait pas valable dans le
cadre d’un projet réel puisqu’il y aurait une perte d’information sur les dates
de transaction des insertions. Par contre, dans notre cas, toutes les données
ont été insérées à partir d’un script. Nous pouvons donc nous fier sur la date
du système et avoir des données valables.
 */