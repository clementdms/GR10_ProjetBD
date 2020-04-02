CREATE TABLE PAYS
(
    id_pays INT,
    nom_pays VARCHAR(100),
    CONSTRAINT pk_pays PRIMARY KEY (id_pays)
);
-- La table VILLE recupère les attributs de l'association ETRE car il y a les cardinalité 1,1 et 0,N donc on ne créée pas de table ETRE
CREATE TABLE VILLE
(
    id_ville INT,
    nom_ville VARCHAR(100),
    id_pays INT NOT NULL,
    CONSTRAINT pk_ville PRIMARY KEY (id_ville),
    CONSTRAINT fk_ville_pays FOREIGN KEY (id_pays) REFERENCES PAYS(id_pays)
);

CREATE TABLE HOTESSE
(
    id_hotesse INT,
    nom_hotesse VARCHAR(100),
    prenom_hotesse VARCHAR(100),
    numeroRue_hotesse INT,
    rue_hotesse VARCHAR(100),
    code_postal_hotesse INT,
    ville_hotesse VARCHAR(100),
    pays_hotesse VARCHAR(100),
    CONSTRAINT pk_hotesse PRIMARY KEY (id_hotesse)    
);

CREATE TABLE LANGUE 
(
    id_langue INT,
    nom_langue VARCHAR(100),
    CONSTRAINT pk_langue PRIMARY KEY (id_langue)
);

CREATE TABLE PARLER
(
    id_langue INT NOT NULL,
    id_hotesse INT NOT NULL,
    CONSTRAINT pk_parler PRIMARY KEY (id_langue,id_hotesse),
    CONSTRAINT fk_parler_langue FOREIGN KEY (id_langue) REFERENCES LANGUE(id_langue),
    CONSTRAINT fk_parler_hotesse FOREIGN KEY (id_hotesse) REFERENCES HOTESSE(id_hotesse) ON DELETE CASCADE
);

CREATE TABLE PILOTE
(
    id_pilote INT,
    nom_pilote VARCHAR(100),
    prenom_pilote VARCHAR(100),
    numeroRue_pilote INT,
    rue_pilote VARCHAR(100),
    code_postal_pilote INT,
    ville_pilote VARCHAR(100),
    pays_pilote VARCHAR(100),
    CONSTRAINT pk_pilote PRIMARY KEY (id_pilote)
);

CREATE TABLE MODELE_AVION
(
    code_modele_avion VARCHAR(20),
    distancemax_avion DECIMAL(10,2) NOT NULL,
    nbpilote_avion INT NOT NULL,
    CONSTRAINT pk_modele_avion PRIMARY KEY (code_modele_avion)
);

CREATE TABLE QUALIFIER
(
    id_pilote INT,
    code_modele_avion VARCHAR(20) NOT NULL,
    CONSTRAINT pk_qualifier PRIMARY KEY (id_pilote,code_modele_avion),
    CONSTRAINT fk_qualifier_pilote FOREIGN KEY (id_pilote) REFERENCES PILOTE(id_pilote) ON DELETE CASCADE,
    CONSTRAINT fk_qualifier_modele_avion FOREIGN KEY (code_modele_avion) REFERENCES MODELE_AVION(code_modele_avion)
);

CREATE TABLE AVION
(
    numero_avion INT,
    code_modele_avion VARCHAR(20) NOT NULL,
    CONSTRAINT pk_avion PRIMARY KEY (numero_avion),
    CONSTRAINT fk_modele_avion FOREIGN KEY (code_modele_avion) REFERENCES MODELE_AVION(code_modele_avion)
);

CREATE TABLE AC_CLIENT
(
    id_client INT,
    nom_client VARCHAR(100),
    prenom_client VARCHAR(100),
    numeroRue_client INT,
    rue_client VARCHAR(100),
    code_postal_client INT,
    ville_client VARCHAR(100),
    pays_client VARCHAR(100),
    nbFideliteUtilise_client INT,
    numeropassport_client VARCHAR(100),
    CONSTRAINT pk_AC_client PRIMARY KEY (id_client)
);

CREATE TABLE RESERVATION
(
    id_reservation INT,
    date_reservation VARCHAR(15),
    id_client INT NOT NULL,
    CONSTRAINT pk_reservation PRIMARY KEY (id_reservation),
    CONSTRAINT fk_reservation_client FOREIGN KEY (id_client) REFERENCES AC_CLIENT(id_client)
);

CREATE TABLE VOL
(
    numero_vol INT,
    horaire_vol VARCHAR(10),
    date_vol VARCHAR(15),
    duree_vol VARCHAR(10),
    distance_vol DECIMAL(10,2),
    -- etat est soit att/vol/arrive/suppr
    etat_vol VARCHAR(10),
    prix_base_vol DECIMAL(10,2),
    id_ville_provenir INT NOT NULL,
    id_ville_destiner INT NOT NULL,
    numero_avion INT NOT NULL,
    CONSTRAINT pk_vol PRIMARY KEY (numero_vol),
    CONSTRAINT fk_vol_ville_provenir FOREIGN KEY (id_ville_provenir) REFERENCES VILLE(id_ville),
    CONSTRAINT fk_vol_ville_destiner FOREIGN KEY (id_ville_destiner) REFERENCES VILLE(id_ville),
    CONSTRAINT fk_vol_avion FOREIGN KEY (numero_avion) REFERENCES AVION(numero_avion)
);

CREATE TABLE PILOTER
(
    id_pilote INT,
    numero_vol INT,
    CONSTRAINT pk_piloter PRIMARY KEY (id_pilote, numero_vol),
    CONSTRAINT fk_piloter_pilote FOREIGN KEY (id_pilote) REFERENCES PILOTE(id_pilote) ON DELETE CASCADE,
    CONSTRAINT fk_piloter_vol FOREIGN KEY (numero_vol) REFERENCES VOL(numero_vol)
);

CREATE TABLE AFFECTER
(
    id_hotesse INT,
    numero_vol INT,
    CONSTRAINT pk_affecter PRIMARY KEY (id_hotesse, numero_vol),
    CONSTRAINT fk_affecter_hotesse FOREIGN KEY (id_hotesse) REFERENCES HOTESSE(id_hotesse) ON DELETE CASCADE,
    CONSTRAINT fk_affecter_vol FOREIGN KEY (numero_vol) REFERENCES VOL(numero_vol)
);

CREATE TABLE ZONE 
(
    id_zone INT,
    nom_zone VARCHAR(100),
    CONSTRAINT pk_zone PRIMARY KEY (id_zone)
);

CREATE TABLE CLASSE 
(
    id_classe INT,
    nom_classe VARCHAR(100),
    CONSTRAINT pk_classe PRIMARY KEY (id_classe)
);
-- La table place a comme clé primaire numero_avion et numero_place car la place n° 1 peut etre dans plusieurs avions differentes
CREATE TABLE PLACE 
(
    numero_place INT,
    numero_avion INT,
    id_zone INT NOT NULL,
    id_classe INT NOT NULL,
    CONSTRAINT pk_place PRIMARY KEY (numero_place, numero_avion),
    CONSTRAINT fk_place_avion FOREIGN KEY (numero_avion) REFERENCES AVION(numero_avion),
    CONSTRAINT fk_place_zone FOREIGN KEY (id_zone) REFERENCES ZONE(id_zone),
    CONSTRAINT fk_place_classe FOREIGN KEY (id_classe) REFERENCES CLASSE(id_classe)
);

CREATE TABLE RESERVE
(
    numero_place INT,
    numero_vol INT,
    id_reservation INT,
    numero_avion INT,
    prixplace_reserve DECIMAL(10,2),
    CONSTRAINT pk_reserve PRIMARY KEY (numero_place, numero_vol, id_reservation),
    CONSTRAINT fk_reserve_place FOREIGN KEY (numero_place, numero_avion) REFERENCES PLACE(numero_place,numero_avion),
    CONSTRAINT fk_reserve_vol FOREIGN KEY (numero_vol) REFERENCES VOL(numero_vol),
    CONSTRAINT fk_reserve_reservation FOREIGN KEY (id_reservation) REFERENCES RESERVATION(id_reservation) ON DELETE CASCADE
);

