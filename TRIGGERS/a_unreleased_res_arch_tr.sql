CREATE OR REPLACE TRIGGER a_unreleased_res_arch_tr
AFTER LOGON ON SCHEMA
BEGIN
    -- Create archives
    INSERT INTO unreleased_res  (SELECT * FROM reservations 
    WHERE TO_CHAR(res_date, 'MMDD') < TO_CHAR(sysdate, 'MMDD'));
    -- DELETE records
    DELETE FROM reservations 
    WHERE TO_CHAR(res_date, 'MMDD') < TO_CHAR(sysdate, 'MMDD');
END;
/
