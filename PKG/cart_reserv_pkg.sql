CREATE OR REPLACE PACKAGE cart_reserv_pkg IS    
    -- array for reserv cartridges
    TYPE reserv_array IS TABLE OF NUMBER;     
    PROCEDURE cart_reserv ( p_cartridge_id reserv_array, p_customer_id NUMBER);
END cart_reserv_pkg;
/

CREATE OR REPLACE PACKAGE BODY cart_reserv_pkg IS 
   
PROCEDURE cart_reserv (p_cartridge_id reserv_array, p_customer_id NUMBER) IS
	v_count NUMBER;
	v_available VARCHAR2(1);
BEGIN           
	BEGIN
		-- Assignment values to v_count number of reservations this customer
		SELECT COUNT(*) INTO v_count FROM reservations
		WHERE customer_id=p_customer_id;
		EXCEPTION 
		-- Show v_count if not found
		WHEN no_data_found 
		THEN  dbms_output.put_line (v_count); 
	END;
	-- Looping through the collection of typed cartridges
	FOR i IN p_cartridge_id.first..p_cartridge_id.last 
		LOOP
		-- Assignment value to v_available if cartridge was found
		SELECT AVAILABILITY into v_available FROM cartridges 
		WHERE cartridge_id=p_cartridge_id(i);
		-- Conditional to check number of reservations this customer
		IF (v_count BETWEEN 0 AND 2)  AND v_available = 'Y' THEN
			/*  Create record in reservations table if cartridge is available 
				and customers reservations are less then 3  */
			INSERT INTO reservations ( cartridge_id, customer_id)
			VALUES        ( p_cartridge_id(i), p_customer_id); 
			-- Increase count of reservations by 1
			v_count := v_count+1;
			-- Set cartridge availability to reserved in cartridges table
			UPDATE cartridges SET availability = 'R'
			WHERE cartridge_id=p_cartridge_id(i);
			 -- Show cartridge reservation status 
			dbms_output.put_line (p_cartridge_id(i) || ' reserved successful'); 

		ELSIF (v_count BETWEEN 0 AND 2) AND v_available <> 'Y' THEN
			-- Show cartridge reservation status 
			dbms_output.put_line (p_cartridge_id(i) || ' is already reserved or rented'); 
						  
		ELSE               
			-- Show cartridge reservation status 
			dbms_output.put_line (p_customer_id || ' got full reservations'); 
			EXIT;
		END IF;
		END LOOP;
	COMMIT;
END;     
END cart_reserv_pkg;
/