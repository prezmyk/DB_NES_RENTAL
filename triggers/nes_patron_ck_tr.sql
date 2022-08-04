create or replace TRIGGER patron_ck_tr
BEFORE INSERT OR UPDATE OF patron_id ON customers 
FOR EACH ROW
DECLARE
PRAGMA AUTONOMOUS_TRANSACTION;
TYPE cust_typ IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
                collection_cust_typ cust_typ := cust_typ();
v_flag BOOLEAN := FALSE;


BEGIN 
-- CHECK Year of customers
    IF TRUNC(months_between(sysdate,:NEW.birth_date)/12) < 18 
        AND :NEW.patron_id IS NULL THEN
            -- If under 18 and patron_id is null then error
            RAISE_APPLICATION_ERROR(-20001, 'Customer under 18 must have a patron who is 18 or older'); 
           
        ELSIF TRUNC(months_between(sysdate,:NEW.birth_date)/12) > 18 THEN
            :NEW.patron_id := NULL;
            DBMS_OUTPUT.PUT_LINE(:NEW.customer_id|| q'[ desn't need a patron]');
    END IF; 
    
        -- array of patrons 18 and older
        SELECT customer_id BULK COLLECT INTO collection_cust_typ FROM customers 
                            WHERE TRUNC(months_between(sysdate,birth_date)/12) > 18;        
    
    IF collection_cust_typ.COUNT > 0 AND TRUNC(months_between(sysdate,:NEW.birth_date)/12) > 18
    THEN 
        FOR i IN collection_cust_typ.first .. collection_cust_typ.last
        LOOP
            -- Check the selected patron is in array
            IF :new.patron_id IN (collection_cust_typ(i))  OR :new.patron_id IS NULL
            THEN
                    -- If yes then true and commit;
                v_flag := TRUE;
                COMMIT;                          
            END IF;        
        END LOOP;
        IF NOT v_flag THEN 
            -- If selected patron is not in arrya then v_flag false and error
             RAISE_APPLICATION_ERROR(-20002, 'Patron has to be 18 years old and more or incorrect CUSTOMER_ID');        
        END IF;
    ELSE 
        COMMIT;
    END IF;    
END;
/