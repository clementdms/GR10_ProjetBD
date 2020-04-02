CREATE OR REPLACE FUNCTION AFFICHAGE_COMMANDE_CLIENT () RETURN CURSOR
IS
	CURSOR c is SELECT R.id_reservation,RESERVATION.date_reservation,R.numero_vol, V.numero_avion, A.code_modele_avion,Vd.nom_ville nom_ville_dep ,V.date_vol, V.horaire_vol,V.duree_vol,Va.nom_ville nom_ville_arr,R.numero_place, R.prixplace_reserve, V.etat_vol, RESERVATION.id_client  
FROM RESERVE R
JOIN RESERVATION ON R.id_reservation=RESERVATION.id_reservation  
JOIN VOL V ON R.numero_vol=V.numero_vol  
JOIN AVION A ON A.numero_avion=V.numero_avion  
JOIN VILLE Vd ON V.id_ville_provenir=Vd.id_ville  
JOIN VILLE Va ON V.id_ville_destiner=Va.id_ville  ;
	res c%ROWTYPE;

BEGIN
	OPEN c;
	FETCH c INTO res
	WHILE(c%FOUND)LOOP
		FETCH c into res;
	END LOOP;
	CLOSE c;
	return res;
END;
/

-- La procedure suuivante permet de supprimer la reservation du client avec comme identifiant id_client 
-- CREATE OR REPLACE PROCEDURE supprimer_clients_reservation(IN id_CR INT)
CREATE OR REPLACE PROCEDURE supprimer_clients_reservation(id_CR IN AC_CLIENT.id_client%TYPE)
IS
BEGIN 
	DELETE FROM RESERVATION WHERE id_client = id_CR ;
	COMMIT;
END;
/

