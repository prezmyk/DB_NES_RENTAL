CREATE OR REPLACE TRIGGER biu_patron_ck_tr
BEFORE INSERT OR UPDATE OF patron_id ON customers 
FOR EACH ROW
DECLARE
    v_customer_id NUMBER;
	
	-- Cursor with customers id over 18 years
    CURSOR cur_patron_id IS 
			SELECT customer_id  INTO v_customer_id  FROM customers 
			WHERE TRUNC(months_between(to_char(sysdate,'YYYY/MM/DD')
			, to_CHAR(birth_date,'YYYY/MM/DD'))/12) > 18;
	
    v_flag BOOLEAN DEFAULT FALSE;

BEGIN 
	-- Conditional to check years of patron
	IF TRUNC(months_between(to_char(sysdate,'YYYY/MM/DD'), to_date(:NEW.birth_date,'YYYY/MM/DD'))/12) < 18 
		AND :NEW.patron_id IS NULL THEN
			-- If under 18 and patron_id is null then error
			RAISE_APPLICATION_ERROR(-20001, 'Customer under 18 must have a patron who is 18 or older'); 
	
		-- If over 18 then set null and flag to true
		ELSIF TRUNC(months_between(to_char(sysdate,'YYYY/MM/DD'), to_date(:NEW.birth_date,'YYYY/MM/DD'))/12) > 18 THEN
			:NEW.patron_id := NULL;
			v_flag := TRUE; 
		-- Show line desn't need a patron		
			DBMS_OUTPUT.PUT_LINE(:NEW.customer_id|| q'[ desn't need a patron]');
		ELSE
		-- Cursor loop to check chosen patron is adult
			FOR i IN cur_patron_id LOOP          
				IF :NEW.patron_id = i.customer_id THEN
					-- Set flag true if yes
					v_flag := TRUE;                
				END IF;
			END LOOP;        
	END IF;

    IF NOT v_flag THEN 
        -- If v_flag is false then error
        RAISE_APPLICATION_ERROR(-20002, 'Patron has to be 18 years old and more or incorrect CUSTOMER_ID'); 
    END IF;
END;
/