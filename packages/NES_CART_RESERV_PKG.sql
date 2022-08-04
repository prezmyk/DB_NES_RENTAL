CREATE OR REPLACE PACKAGE cart_reserv_pkg IS

   TYPE reserv_array IS TABLE OF NUMBER; -- array for reserv cartridges

   PROCEDURE cart_reserv ( p_cartridge_id reserv_array, p_customer_id NUMBER);
    v_count NUMBER;
    v_available VARCHAR2(1);
END cart_reserv_pkg;
/


CREATE OR REPLACE PACKAGE BODY cart_reserv_pkg IS    
        PROCEDURE cart_reserv (p_cartridge_id reserv_array, p_customer_id NUMBER) AS
        BEGIN           
            BEGIN
                  SELECT COUNT(*) INTO v_count FROM reservations
                   WHERE customer_id=p_customer_id;
            EXCEPTION WHEN no_data_found 
            THEN  dbms_output.put_line (v_count); 
            END;

            FOR i IN p_cartridge_id.first..p_cartridge_id.last 
            LOOP

            SELECT AVAILABILITY into v_available FROM cartridges 
            WHERE cartridge_id=p_cartridge_id(i);

                IF (v_count BETWEEN 0 AND 2)  AND v_available = 'Y' THEN
                    INSERT INTO RESERVATIONS ( CARTRIDGE_ID, CUSTOMER_ID)
                    VALUES        ( p_cartridge_id(i), p_customer_id);               
                    v_count := v_count+1;
                    UPDATE cartridges SET availability = 'R'
                    WHERE cartridge_id=p_cartridge_id(i);
                    dbms_output.put_line (p_cartridge_id(i) || ' reserved successful'); 
                ELSIF (v_count BETWEEN 0 AND 2) AND v_available <> 'Y' THEN
                    dbms_output.put_line (p_cartridge_id(i) || ' is already reserved or rented'); 
                   -- CONTINUE;               
                ELSE               
                    dbms_output.put_line (p_customer_id || ' got full reservations'); 
                    EXIT;
                END IF;
            END LOOP;
        END;
/*
DECLARE
reserv_array cart_reserv_pkg.reserv_array 
:= cart_reserv_pkg.reserv_array(); -- Cartridges array
BEGIN
cart_reserv_pkg.cart_reserv (reserv_array, customer_id); -- customer_id
END;
*/        
END cart_reserv_pkg;
/
