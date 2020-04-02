
-- Proc�dure Q3
CREATE OR REPLACE FUNCTION deplaceClient (volSupprime INTEGER, placeSupprime INTEGER, idClasse INTEGER, idReservation INTEGER) RETURNS integer AS $$
DECLARE
    -- declarations
    volDeplace INTEGER;
    placeNouvelle INTEGER;
BEGIN
    SELECT TMP.numero_vol
	FROM (SELECT  COUNT(PLACE.numero_place) AS nb_place_max ,VOL.numero_vol INTO volDeplace
		FROM VOL
		INNER JOIN AVION ON AVION.numero_avion = VOL.numero_avion
		INNER JOIN PLACE ON PLACE.numero_avion = AVION.numero_avion
		WHERE VOL.id_ville_destiner = (SELECT id_ville_destiner
									FROM VOL
		    	        			WHERE numero_vol = volSupprime)
		AND VOL.id_ville_provenir = (SELECT id_ville_provenir
		    	        			FROM VOL
		    	        			WHERE numero_vol = volSupprime)
		AND ((VOL.date_vol > (SELECT VOL.date_vol
		    	        	FROM VOL
		    	        	WHERE VOL.numero_vol = volSupprime))
		OR (VOL.horaire_vol >= (SELECT VOL.horaire_vol
    							FROM VOL
                                WHERE VOL.numero_vol = volSupprime)
		AND VOL.date_vol = (SELECT VOL.date_vol
        					FROM VOL
		    	    		WHERE VOL.numero_vol = volSupprime)))
		AND VOL.etat_vol = 'att'
		AND VOL.numero_vol != volSupprime
		AND PLACE.id_classe = idClasse
		GROUP BY numero_vol) TMP 
	LEFT OUTER JOIN (SELECT VOL.numero_vol, COUNT(PLACE.numero_place) AS nb_place
		    	    FROM VOL
		    	    INNER JOIN RESERVE ON RESERVE.numero_vol = VOL.numero_vol
		    	    INNER JOIN PLACE ON PLACE.numero_place = RESERVE.numero_place AND VOL.numero_avion = PLACE.numero_avion
		    	    WHERE PLACE.id_classe = idClasse 
                    GROUP BY VOL.numero_vol) TMP2 ON TMP2.numero_vol = TMP.numero_vol
	WHERE nb_place_max > COALESCE(nb_place,0)
	LIMIT 1;


    SELECT numero_place INTO placeNouvelle
    FROM PLACE
    INNER JOIN AVION ON AVION.numero_avion = PLACE.numero_avion
	INNER JOIN VOL ON VOL.numero_avion = AVION.numero_avion
	WHERE VOL.numero_vol = volDeplace
	AND PLACE.id_classe = idClasse 
	AND PLACE.numero_place NOT IN (SELECT PLACE.numero_place
		    	        			FROM PLACE
		    	        			INNER JOIN RESERVE ON RESERVE.numero_place = PLACE.numero_place
		    	        			INNER JOIN VOL ON RESERVE.numero_vol = VOL.numero_vol
		    	        			WHERE VOL.numero_vol = volDeplace)
	LIMIT 1;


    UPDATE RESERVE
    SET numero_vol = volDeplace, numero_place = placeNouvelle
	WHERE id_reservation = idReservation
	AND numero_vol = volSupprime
	AND numero_place = placeSupprime;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Proc�dure Q7
CREATE OR REPLACE FUNCTION reservePlace (idClasse INTEGER, idReservation INTEGER, numeroVol INTEGER, prix DECIMAL(10,2)) RETURNS integer AS $$
DECLARE
    -- declarations
    numeroPlace INTEGER;
BEGIN
    SELECT  PLACE.numero_place INTO numeroPlace
    FROM VOL
    INNER JOIN AVION ON VOL.numero_avion = AVION.numero_avion
    INNER JOIN PLACE ON AVION.numero_avion = PLACE.numero_avion
    LEFT OUTER JOIN RESERVE ON PLACE.numero_place = RESERVE.numero_place
    WHERE RESERVE.prixplace_reserve IS NULL
    AND PLACE.id_classe = idClasse
    AND VOL.numero_vol = numeroVol;
    INSERT INTO RESERVE (numero_place, numero_vol, id_reservation, prixplace_reserve) VALUES (numeroPlace, numeroVol, idReservation, prix);
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;
