CREATE OR REPLACE PACKAGE cart_rent_pkg IS

   TYPE cart_array IS TABLE OF NUMBER; -- array for rent cartridges

   PROCEDURE cart_rent ( p_cartridge_id cart_array, p_customer_id NUMBER); 

    v_employee_id NUMBER; 
    v_rental_id NUMBER; -- Rentals table rental_id
    v_availability VARCHAR2(1) ;
    v_reservation NUMBER ; -- customer_id reserv
    v_flag BOOLEAN := FALSE;

END cart_rent_pkg;
/

CREATE OR REPLACE PACKAGE BODY cart_rent_pkg IS 

     PROCEDURE cart_rent ( p_cartridge_id cart_array, p_customer_id NUMBER) AS
BEGIN
            -- employee_id finding select and declare to v_employee_id
            SELECT employee_id INTO v_employee_id FROM employees
            WHERE db_user = ( SELECT user FROM dual); 

            INSERT INTO rentals (  customer_id, employee_id)  -- Creating rental record
                         VALUES (  p_customer_id, v_employee_id );

            v_rental_id := RENTALS_ID_SEQ.currval; -- Rentals table rental_id sequence      


        FOR i IN p_cartridge_id.first .. p_cartridge_id.last -- Cartridges loop
            LOOP
               BEGIN
                    SELECT availability INTO v_availability FROM cartridges
                    WHERE cartridge_id = p_cartridge_id(i); -- Check cartridge is available
                 exception when no_data_found  then  dbms_output.put_line (p_cartridge_id(i)||' is not available'); 

               END; 
                BEGIN
                    SELECT customer_id INTO v_reservation FROM reservations -- Check cartridge is reserved
                                             WHERE customer_id = p_customer_id
                                             AND cartridge_id = p_cartridge_id(i);
                exception when no_data_found  then  dbms_output.put_line (p_cartridge_id(i)||' is not reserved by this customer');

                END;
                IF  v_availability = 'Y' THEN 
                    v_flag := TRUE;
                    INSERT INTO cartridges_rentals(rental_id, cartridge_id)
                                      VALUES (v_rental_id, p_cartridge_id(i) ); -- IF yes then rent

                    UPDATE cartridges -- SET availability to N if YES 
                    SET availability = 'N' WHERE cartridge_id = p_cartridge_id(i);
                dbms_output.put_line (p_cartridge_id(i)||' is successful rented');
                -- If is reserved check by selected customer    
                ELSIF  v_availability = 'R' AND p_customer_id = v_reservation THEN
                    v_flag := TRUE;
                    INSERT INTO cartridges_rentals(rental_id, cartridge_id)
                    VALUES (v_rental_id, p_cartridge_id(i) ); -- IF yes then rent

                    UPDATE cartridges -- SET availability to N if YES 
                    SET availability = 'N' WHERE cartridge_id = p_cartridge_id(i);
                    dbms_output.put_line (p_cartridge_id(i)||' is successful rented');                    

                    DELETE FROM reservations WHERE cartridge_id = p_cartridge_id(i); -- Delete reservation
                    -- Availibility to 'N' on cartridges table changes au_reservations trigger; 
                ELSE
                    DBMS_OUTPUT.PUT_LINE(p_cartridge_id(i)||' is already rented');
                END IF;

            END LOOP;
    IF v_flag = TRUE THEN 
        COMMIT;
    ELSE 
        ROLLBACK;
    END IF;

END;
/*
DECLARE
cart_array cart_rent_pkg.cart_array 
:= cart_rent_pkg.cart_array(1170,1180,1200); -- Cartridges array
BEGIN
cart_rent_pkg.cart_rent (cart_array, 220724179); -- customer_id
END;
*/
END cart_rent_pkg;
/
