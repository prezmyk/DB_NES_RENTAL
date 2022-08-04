create or replace TRIGGER au_reservations AFTER
    DELETE ON reservations
    FOR EACH ROW
BEGIN
    UPDATE cartridges
    SET availability = 'Y'
    WHERE cartridge_id = :old.cartridge_id;
END;
/