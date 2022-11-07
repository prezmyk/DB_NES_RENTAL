CREATE OR REPLACE PROCEDURE cart_back (p_cartridge_id NUMBER)
IS
v_out           DATE;
v_rental_id     NUMBER;
v_customer_id   NUMBER;
v_price         NUMBER;
BEGIN
	-- Assignment values to v_rental_id and v_out this cartridge
    SELECT out_date ,rental_id ,customer_id INTO v_out ,v_rental_id ,v_customer_id FROM rentals
    WHERE cartridge_id = p_cartridge_id
    AND in_date IS NULL;  

    -- Conditional to check days between rented and back the cartridge
    IF TRUNC((sysdate - v_out)) > 1 THEN
        -- Assignment values to v_price from view if held one or more days
        SELECT  TO_NUMBER(price_to_pay) INTO v_price FROM DETAINED_TO_PAY
        WHERE rental_id=v_rental_id AND cartridge_id=p_cartridge_id;
        -- Show numbers of holded days and a price to pay
        DBMS_OUTPUT.PUT_LINE(p_cartridge_id || ' was hold by '
        ||  TRUNC((sysdate - v_out)-1) || ' day(s) more. To pay '|| v_price );        

    ELSE
        -- Show ok status 
        DBMS_OUTPUT.PUT_LINE(p_cartridge_id||' is ok' );
    END IF;    

    -- Change in_date value to sysdate      
    UPDATE rentals SET in_date = sysdate
    WHERE cartridge_id = p_cartridge_id
    AND in_date IS NULL;

    COMMIT;

    /*  detained_cartridges record and availability status in cartridges table
        is created  by bu_detained_cart_bckup_tr trigger     */
END;
/

