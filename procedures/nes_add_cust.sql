-- PROCEDURE TO ADD CUSTOMER 

create or replace PROCEDURE add_cust (    
  -- customers table columns
  p_fname         customers.first_name%type,
  p_lname         customers.last_name%type,
  p_birth_date    customers.birth_date%type,   
  p_sex           customers.sex%type,  
  -- addresses table columns
  p_city          addresses.city%type,
  p_postcode      addresses.postcode%type,   
  p_st_name       addresses.st_name%type,
  p_house_no      addresses.house_no%type,   
  p_apartment     addresses.apartment%type DEFAULT NULL,
  p_phone         addresses.phone%type     DEFAULT NULL,
  p_email         addresses.email%type     DEFAULT NULL,
  -- customers DEFAULT NULL table columns
  p_patron_id     customers.patron_id%type  DEFAULT NULL,	
  p_cre_date      customers.cre_date%type DEFAULT sysdate
    )
IS 
    v_customer_id   customers.customer_id%type;


BEGIN
    SELECT CONCAT(TO_CHAR(sysdate, 'YYMMDD'),cust_emp_seq.nextval) INTO v_customer_id FROM DUAL; 
    
    INSERT INTO addresses (address_id,      st_name ,           house_no,   postcode ,  city,           apartment,   phone,   email )    
    VALUES                  (v_customer_id ,INITCAP(p_st_name) ,p_house_no,  p_postcode ,INITCAP(p_city), p_apartment, p_phone, p_email);      
    
    INSERT INTO customers (customer_id  , first_name        , last_name       , birth_date      ,  sex      , cre_date    , address_id  , patron_id) 
        VALUES          (  v_customer_id   , INITCAP(p_fname), INITCAP(p_lname)  , p_birth_date , UPPER(p_sex), p_cre_date, v_customer_id, p_patron_id  );

END;
/