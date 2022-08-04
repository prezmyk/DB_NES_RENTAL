-- PROCEDURE TO TAKE BACK CARTRIDGE

create or replace PROCEDURE cart_back (p_cartridge_id NUMBER)
IS
v_out       DATE;
v_rental_id NUMBER;
v_price     NUMBER;
BEGIN
    
	-- Take retal_id and rented date 
    SELECT out_date, rental_id INTO v_out, v_rental_id FROM cartridges_rentals
    WHERE cartridge_id = p_cartridge_id
    AND in_date IS NULL;  
    
    IF TRUNC((sysdate - v_out)) > 1 THEN
        -- If held more than one day show price to pay
        SELECT  TO_NUMBER(price_to_pay) INTO v_price FROM DETAINED_TO_PAY
        WHERE rental_id=v_rental_id AND cartridge_id=p_cartridge_id;
        DBMS_OUTPUT.PUT_LINE(p_cartridge_id || ' was hold by '
        ||  TRUNC((sysdate - v_out)-1) || ' day(s) more. To pay '|| v_price );       
    ELSE
        DBMS_OUTPUT.PUT_LINE(p_cartridge_id||' is ok' );
    END IF;    
    --Close     
    UPDATE CARTRIDGES_RENTALS SET IN_DATE = sysdate
    WHERE cartridge_id = p_cartridge_id
    AND in_date IS NULL;
    
    -- SET availability to Yes
    UPDATE cartridges   SET availability = 'Y'
    WHERE cartridge_id = p_cartridge_id;
END;
/


