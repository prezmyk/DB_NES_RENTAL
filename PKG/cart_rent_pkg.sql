CREATE OR REPLACE PACKAGE cart_rent_pkg IS
   TYPE cart_array IS TABLE OF NUMBER; -- array for rent cartridges
   PROCEDURE cart_rent ( p_cartridge_id cart_array, p_customer_id NUMBER); 
END cart_rent_pkg;
/

CREATE OR REPLACE PACKAGE BODY cart_rent_pkg IS 

PROCEDURE cart_rent ( p_cartridge_id cart_array, p_customer_id NUMBER) IS     
	v_employee_id NUMBER; 
	v_availability VARCHAR2(1 CHAR) ;
	v_reservation NUMBER ; -- customer_id reserv
	v_flag BOOLEAN DEFAULT FALSE;
BEGIN
	-- Assignment value of current user's id to v_employee_id
	SELECT employee_id INTO v_employee_id FROM employees
	WHERE db_user = ( SELECT user FROM dual);       

	-- Looping through the collection of typed cartridges
	FOR i IN p_cartridge_id.first .. p_cartridge_id.last -- Cartridges loop
		LOOP
		-- Inside PL/SQL Block
		BEGIN 
			-- Assignment value to v_availability if cartridge was found
			SELECT availability INTO v_availability FROM cartridges
			WHERE cartridge_id = p_cartridge_id(i); 
			EXCEPTION   
			-- Show status 'not exist' if not found
			WHEN no_data_found  
			THEN  dbms_output.put_line (p_cartridge_id(i)||' is not exist');
			GOTO END_LOOP;
		END;
					   
		-- Inside PL/SQL Block
		BEGIN
			-- Assignment value to v_reservation if cartridge is reserved by this customer
			SELECT customer_id INTO v_reservation FROM reservations 
			WHERE customer_id = p_customer_id
			AND cartridge_id = p_cartridge_id(i);
			EXCEPTION 
			-- Show status 'not reserved by this customer' if not reserved
			WHEN no_data_found  
			THEN  dbms_output.put_line (p_cartridge_id(i)||' is not reserved');
		END;
						
		 -- Checking availability status if available
		IF  v_availability = 'Y' THEN 
			-- Set v_flag TRUE if is available
			v_flag := TRUE;
			-- Create new rental record in rentals table
			INSERT INTO 
			rentals ( employee_id,customer_id, cartridge_id)
			VALUES  (v_employee_id,p_customer_id, p_cartridge_id(i) ); 
			-- Set availability to N in cartridge table
			UPDATE cartridges 
			SET availability = 'N' WHERE cartridge_id = p_cartridge_id(i);

			-- Show status 'successful rented'
			dbms_output.put_line (p_cartridge_id(i)||' is successful rented');
							
			-- Checking availability status if reserved by this customer
		ELSIF  v_availability = 'R' AND p_customer_id = v_reservation THEN
			-- Set v_flag TRUE if is reserved by this customer
			v_flag := TRUE;
			-- Create new rental record in rentals table
			INSERT INTO 
			rentals ( employee_id,customer_id, cartridge_id)
			VALUES  (v_employee_id,p_customer_id, p_cartridge_id(i) );  
			-- Set availability to N in cartridge table
			UPDATE cartridges 
			SET availability = 'N' WHERE cartridge_id = p_cartridge_id(i);

			-- Show status 'successful rented'
			dbms_output.put_line (p_cartridge_id(i)||' is successful rented');                    
			-- Delete reservation this cartridge from reservations table
			DELETE FROM reservations WHERE cartridge_id = p_cartridge_id(i); 
			-- Checking availability status if is rented
		ELSIF  v_availability = 'N' THEN
			DBMS_OUTPUT.PUT_LINE(p_cartridge_id(i)||' is already rented');
		END IF;
		
		<< END_LOOP >>
		NULL;
	END LOOP;
	-- Checking v_flag status
	IF v_flag THEN 
		-- Commit if true
		COMMIT;
	ELSE
		-- Rollback if false
		ROLLBACK;
	END IF;
END;

END cart_rent_pkg;
/
