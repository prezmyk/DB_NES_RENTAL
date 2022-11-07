CREATE OR REPLACE TRIGGER bu_detained_cart_bckup_tr
BEFORE UPDATE OF in_date ON rentals
FOR EACH ROW 
DECLARE
v_price NUMBER;
BEGIN
     -- Conditional check of the days between the rental  and the return 
    IF TRUNC(:NEW.in_date-1 - :OLD.out_date) > 0 THEN
     -- Assignment value of cartridge price  to v_price
        SELECT price INTO v_price FROM cartridges
        WHERE cartridge_id = :OLD.cartridge_id;    
    -- Create detained_cartridges record
        INSERT INTO detained_cartridges (rental_id,customer_id,cartridge_id,out_date,in_date,price_paid)
        VALUES (:OLD.rental_id,:OLD.customer_id,:OLD.cartridge_id,:OLD.out_date,:NEW.in_date, (v_price +0.5) * TRUNC(:NEW.in_date-1 - :OLD.out_date));
    -- DBMS_OUTPUT.PUT_LINE(:OLD.cartridge_id);
    END IF;
    
    -- Set cartridge to availability status in cartridges table
    UPDATE cartridges   SET availability = 'Y'
    WHERE cartridge_id = :OLD.cartridge_id;

END;
/

