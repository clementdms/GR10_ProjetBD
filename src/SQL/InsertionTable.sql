-- On insere les données pour Pays
INSERT INTO PAYS (id_pays, nom_pays) VALUES ('1', 'France');

-- On insere les données pour Ville
INSERT INTO VILLE (id_ville, nom_ville, id_pays) VALUES ('1', 'Grenoble', '1');
INSERT INTO VILLE (id_ville, nom_ville, id_pays) VALUES ('2', 'Lyon', '1');
INSERT INTO VILLE (id_ville, nom_ville, id_pays) VALUES ('3', 'Marseille', '1');
INSERT INTO VILLE (id_ville, nom_ville, id_pays) VALUES ('4', 'Paris', '1');
INSERT INTO VILLE (id_ville, nom_ville, id_pays) VALUES ('5', 'Nantes', '1');
INSERT INTO VILLE (id_ville, nom_ville, id_pays) VALUES ('6', 'Nimes', '1');
INSERT INTO VILLE (id_ville, nom_ville, id_pays) VALUES ('7', 'Strasbourg', '1');
INSERT INTO VILLE (id_ville, nom_ville, id_pays) VALUES ('8', 'Bordeaux', '1');
INSERT INTO VILLE (id_ville, nom_ville, id_pays) VALUES ('9', 'Perpignan', '1');
INSERT INTO VILLE (id_ville, nom_ville, id_pays) VALUES ('10', 'Rennes', '1');

-- On insere les données pour Hotesse
INSERT INTO HOTESSE (id_hotesse, nom_hotesse, prenom_hotesse, numeroRue_hotesse, rue_hotesse, code_postal_hotesse, ville_hotesse, pays_hotesse) VALUES ('1', 'Kardashian', 'Kim', '15', 'Avenue des champs Elysées', '75000', 'Paris','France');
INSERT INTO HOTESSE (id_hotesse, nom_hotesse, prenom_hotesse, numeroRue_hotesse, rue_hotesse, code_postal_hotesse, ville_hotesse, pays_hotesse) VALUES ('2', 'Collomb', 'Estelle', '24', 'Place de Gordes', '38000', 'Grenoble','France');

-- On insere les données pour Langue
INSERT INTO LANGUE (id_langue, nom_langue) VALUES ('1', 'Francais');
INSERT INTO LANGUE (id_langue, nom_langue) VALUES ('2', 'Espagnol');
INSERT INTO LANGUE (id_langue, nom_langue) VALUES ('3', 'Anglais');

-- On insere les données pour Parler
INSERT INTO PARLER (id_langue, id_hotesse) VALUES ('1', '1');
INSERT INTO PARLER (id_langue, id_hotesse) VALUES ('3','1');
INSERT INTO PARLER (id_langue, id_hotesse) VALUES ('1','2');
INSERT INTO PARLER (id_langue, id_hotesse) VALUES ('2','2');
INSERT INTO PARLER (id_langue, id_hotesse) VALUES ('3','2');

-- On insere les données pour Pilote
INSERT INTO PILOTE (id_pilote, nom_pilote, prenom_pilote, numeroRue_pilote, rue_pilote, code_postal_pilote, ville_pilote, pays_pilote) VALUES ('1', 'Dumas', 'Clement', '16', 'Rue Hector Berlioz','38420','Domene','France');
INSERT INTO PILOTE (id_pilote, nom_pilote, prenom_pilote, numeroRue_pilote, rue_pilote, code_postal_pilote, ville_pilote, pays_pilote) VALUES ('2', 'Meziane', 'Farid', '110', 'Rue de la victoire de l Algerie','38000','Fontaine','France');
INSERT INTO PILOTE (id_pilote, nom_pilote, prenom_pilote, numeroRue_pilote, rue_pilote, code_postal_pilote, ville_pilote, pays_pilote) VALUES ('3', 'De-Lemos', 'Pierre', '15', 'Route de l eglise','38000','Grenble','France');
INSERT INTO PILOTE (id_pilote, nom_pilote, prenom_pilote, numeroRue_pilote, rue_pilote, code_postal_pilote, ville_pilote, pays_pilote) VALUES ('4', 'Diallo','Mohamed','35', 'Chemin de la Guinee','38400','Echirolles','France');

-- On insere les données pour Modèle Avion
INSERT INTO MODELE_AVION (code_modele_avion, distancemax_avion, nbpilote_avion) VALUES ('A310', '25.5', '2');
INSERT INTO MODELE_AVION (code_modele_avion, distancemax_avion, nbpilote_avion) VALUES ('A320', '35', '3');
INSERT INTO MODELE_AVION (code_modele_avion, distancemax_avion, nbpilote_avion) VALUES ('A380', '500', '1');

-- On insere les données pour Qualifier
INSERT INTO QUALIFIER (id_pilote, code_modele_avion) VALUES ('1', 'A310');
INSERT INTO QUALIFIER (id_pilote, code_modele_avion) VALUES ('1', 'A320');
INSERT INTO QUALIFIER (id_pilote, code_modele_avion) VALUES ('1', 'A380');
INSERT INTO QUALIFIER (id_pilote, code_modele_avion) VALUES ('2', 'A310');
INSERT INTO QUALIFIER (id_pilote, code_modele_avion) VALUES ('2', 'A320');
INSERT INTO QUALIFIER (id_pilote, code_modele_avion) VALUES ('2', 'A380');
INSERT INTO QUALIFIER (id_pilote, code_modele_avion) VALUES ('3', 'A310');
INSERT INTO QUALIFIER (id_pilote, code_modele_avion) VALUES ('3', 'A320');
INSERT INTO QUALIFIER (id_pilote, code_modele_avion) VALUES ('4', 'A310');

-- On insere les données pour Avion
INSERT INTO AVION (numero_avion, code_modele_avion) VALUES (1, 'A380');
INSERT INTO AVION (numero_avion, code_modele_avion) VALUES (2, 'A380');

-- On insere les données pour Zone
INSERT INTO ZONE (id_zone, nom_zone) VALUES (1, 'Avant');
INSERT INTO ZONE (id_zone, nom_zone) VALUES (2, 'Centre');
INSERT INTO ZONE (id_zone, nom_zone) VALUES (3, 'Arriere');

-- On insere les données pour Classe
INSERT INTO CLASSE (id_classe, nom_classe) VALUES (1, 'Affaire');
INSERT INTO CLASSE (id_classe, nom_classe) VALUES (2, 'Economique');
INSERT INTO CLASSE (id_classe, nom_classe) VALUES (3, '1e Classe');

-- On insere les données pour Place
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (1, 1, 1, 3);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (2, 1, 1, 3);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (3, 1, 1, 3);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (4, 1, 1, 3);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (5, 1, 1, 3);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (6, 1, 2, 2);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (7, 1, 2, 2);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (8, 1, 2, 2);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (9, 1, 2, 2);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (10, 1, 2, 2);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (11, 1, 3, 1);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (12, 1, 3, 1);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (13, 1, 3, 1);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (14, 1, 3, 1);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (15, 1, 3, 1);

INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (1, 2, 1, 1);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (2, 2, 1, 1);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (3, 2, 1, 1);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (4, 2, 1, 1);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (5, 2, 1, 1);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (6, 2, 2, 3);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (7, 2, 2, 3);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (8, 2, 2, 3);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (9, 2, 2, 3);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (10, 2, 2, 3);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (11, 2, 3, 2);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (12, 2, 3, 2);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (13, 2, 3, 2);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (14, 2, 3, 2);
INSERT INTO PLACE (numero_place, numero_avion, id_zone, id_classe) VALUES (15, 2, 3, 2);

-- On insere les données pour Vol
INSERT INTO VOL (numero_vol, horaire_vol, date_vol,duree_vol, distance_vol, etat_vol, prix_base_vol ,id_ville_provenir, id_ville_destiner, numero_avion) VALUES (1, '15:00:00', '2020-05-15', '01:45:00' , 50, 'att',95.0, 1, 4, 1);
INSERT INTO VOL (numero_vol, horaire_vol, date_vol,duree_vol, distance_vol, etat_vol, prix_base_vol,id_ville_provenir, id_ville_destiner, numero_avion) VALUES (2, '22:00:00', '2020-05-15', '01:45:00' , 50, 'att',120.0, 1, 4, 2);

-- On insere les données pour Piloter
INSERT INTO PILOTER (id_pilote, numero_vol) VALUES (1, 1);
INSERT INTO PILOTER (id_pilote, numero_vol) VALUES (1, 2);
INSERT INTO PILOTER (id_pilote, numero_vol) VALUES (2, 1);
INSERT INTO PILOTER (id_pilote, numero_vol) VALUES (3, 2);

-- On insere les données pour Affecter
INSERT INTO AFFECTER (id_hotesse, numero_vol) VALUES (1, 1);
INSERT INTO AFFECTER (id_hotesse, numero_vol) VALUES (2, 2);
INSERT INTO AFFECTER (id_hotesse, numero_vol) VALUES (1, 2);

-- On insere les données pour Client
INSERT INTO AC_CLIENT (id_client, nom_client, prenom_client, numeroRue_client, rue_client, code_postal_client, ville_client, pays_client, nbFideliteUtilise_client, numeropassport_client) VALUES (1, 'Jouannot' , 'Fabrice', 16, 'Rue Im2ag', 38400, 'Saint Martin d Heres', 'France', 0,'1215415121');
INSERT INTO AC_CLIENT (id_client, nom_client, prenom_client, numeroRue_client, rue_client, code_postal_client, ville_client, pays_client, nbFideliteUtilise_client, numeropassport_client) VALUES (2, 'Crash' , 'Test', 16, 'Rue Im2ag', 38000, 'Grenoble', 'France', 0 ,'1356886186');

-- On insere les données pour Reservation
INSERT INTO RESERVATION (id_reservation, date_reservation, id_client) VALUES (1, '2020-03-04', 1);
INSERT INTO RESERVATION (id_reservation, date_reservation, id_client) VALUES (2, '2020-03-06', 2);

-- On insere les données pour Reserve
INSERT INTO RESERVE (numero_place, numero_vol, id_reservation, prixplace_reserve) VALUES (15, 1, 1, 50.0);
INSERT INTO RESERVE (numero_place, numero_vol, id_reservation, prixplace_reserve) VALUES (12, 1, 2, 50.0);
