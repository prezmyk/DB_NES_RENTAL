CREATE OR REPLACE TRIGGER au_reservations_tr AFTER
    DELETE ON reservations
    FOR EACH ROW
BEGIN
    UPDATE cartridges
    SET availability = 'Y'
    WHERE cartridge_id = :old.cartridge_id;
END;
/
