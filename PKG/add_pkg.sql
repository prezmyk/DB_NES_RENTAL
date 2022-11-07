CREATE OR REPLACE PACKAGE add_pkg IS
  FUNCTION add_address (
    p_city          addresses.city%type,
    p_postcode      addresses.postcode%type,   
    p_st_name       addresses.st_name%type,
    p_house_no      addresses.house_no%type,   
    p_apartment     addresses.apartment%type  DEFAULT NULL
  ) RETURN NUMBER; 
  
  PROCEDURE add_emp (    
    p_fname         employees.first_name%type,
    p_lname         employees.last_name%type,
    p_birth_date    employees.birth_date%type,
    p_hire_date     employees.hire_date%type,	    
    p_sex           employees.sex%type,
    p_address_id    addresses.address_id%type
  );  
  
  PROCEDURE add_cust (    
    p_fname         customers.first_name%type,
    p_lname         customers.last_name%type,
    p_birth_date    customers.birth_date%type,   
    p_sex           customers.sex%type,
    p_address_id    addresses.address_id%type,
    p_patron_id     customers.patron_id%type  DEFAULT NULL
  ); 
  
  FUNCTION get_address (p_fname VARCHAR, p_lname VARCHAR, p_bdate DATE) RETURN NUMBER;
  FUNCTION get_patron (p_fname VARCHAR, p_lname VARCHAR, p_bdate DATE) RETURN NUMBER;
  
END add_pkg;
/


CREATE OR REPLACE PACKAGE  BODY add_pkg IS
  FUNCTION add_address (
    p_city          addresses.city%type,
    p_postcode      addresses.postcode%type,   
    p_st_name       addresses.st_name%type,
    p_house_no      addresses.house_no%type,   
    p_apartment     addresses.apartment%type  DEFAULT NULL
  ) RETURN NUMBER IS
    -- value for address_id
    v_address_id    NUMBER;
  BEGIN
    INSERT INTO 
    addresses ( st_name,house_no,postcode , city, apartment )    
    VALUES   (INITCAP(p_st_name) ,p_house_no,  p_postcode ,INITCAP(p_city), p_apartment)
    -- Assignment identity column value to  v_address_id 
    RETURNING address_id INTO v_address_id; 

    RETURN v_address_id;  
  END add_address;


  PROCEDURE add_emp (    
    p_fname         employees.first_name%type,
    p_lname         employees.last_name%type,
    p_birth_date    employees.birth_date%type,
    p_hire_date     employees.hire_date%type,	    
    p_sex           employees.sex%type,
    p_address_id    addresses.address_id%type
  ) IS
    v_employee_id   employees.employee_id%type;
  BEGIN
     -- Assignment value to  v_employee_id 
    SELECT CONCAT(TO_CHAR(sysdate, 'YYMMDD'),cust_emp_seq.nextval) 
    INTO v_employee_id FROM DUAL;

    INSERT INTO 
    employees (employee_id,  first_name, last_name, birth_date, hire_date, sex,address_id) 
    VALUES    ( v_employee_id, INITCAP(p_fname),  INITCAP(p_lname),   p_birth_date, p_hire_date,  UPPER(p_sex),  p_address_id);        
  END add_emp;  


  PROCEDURE add_cust (    
    p_fname         customers.first_name%type,
    p_lname         customers.last_name%type,
    p_birth_date    customers.birth_date%type,   
    p_sex           customers.sex%type,
    p_address_id    addresses.address_id%type,
    p_patron_id     customers.patron_id%type  DEFAULT NULL
  )
  IS 
    v_customer_id   employees.employee_id%type;
  BEGIN
    -- Assignment value to v_customer_id 
    SELECT CONCAT(TO_CHAR(sysdate, 'YYMMDD'),cust_emp_seq.nextval) 
    INTO v_customer_id FROM DUAL;    

    INSERT INTO 
    customers (customer_id  , first_name        , last_name       , birth_date      ,  sex          , address_id  , patron_id) 
    VALUES    (  v_customer_id   , INITCAP(p_fname), INITCAP(p_lname)  , p_birth_date , UPPER(p_sex), p_address_id, p_patron_id  );  
  END add_cust;

  
  FUNCTION get_address (p_fname VARCHAR, p_lname VARCHAR, p_bdate DATE) 
  RETURN NUMBER
  IS 
    v_address_id NUMBER;
  BEGIN 
    SELECT address_id INTO v_address_id FROM customers 
    WHERE FIRST_NAME = p_fname and LAST_NAME = p_lname
    AND to_date(birth_date,'YYYY/MM/DD') = to_date(p_bdate,'YYYY/MM/DD');
    
    RETURN v_address_id;   
  END get_address;

  
  FUNCTION get_patron (p_fname VARCHAR, p_lname VARCHAR, p_bdate DATE) 
  RETURN NUMBER 
  IS
     v_patron_id NUMBER;
  BEGIN 
    SELECT customer_id INTO v_patron_id FROM customers 
    WHERE FIRST_NAME = p_fname and LAST_NAME = p_lname
    AND to_date(birth_date,'YYYY/MM/DD') = to_date(p_bdate,'YYYY/MM/DD');
    
    RETURN v_patron_id;   
  END get_patron;
  
END add_pkg;