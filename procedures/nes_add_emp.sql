-- PROCEDURE TO ADD EMPLOYEE
create or replace PROCEDURE add_emp (    
  -- employees table columns
  p_fname         employees.first_name%type,
  p_lname         employees.last_name%type,
  p_birth_date    employees.birth_date%type,
  p_hire_date     employees.hire_date%type,	    
  p_sex           employees.sex%type,
  
  -- addresses table columns
  p_city          addresses.city%type,
  p_postcode      addresses.postcode%type, 
  p_st_name       addresses.st_name%type,
  p_house_no      addresses.house_no%type,   
  p_apartment     addresses.apartment%type DEFAULT NULL,
  p_phone         addresses.phone%type     DEFAULT NULL,
  p_email         addresses.email%type     DEFAULT NULL
    )
IS 
    v_employee_id   employees.employee_id%type;

BEGIN
	SELECT CONCAT(TO_CHAR(sysdate, 'YYMMDD'),cust_emp_seq.nextval) 
			INTO v_employee_id FROM DUAL;

	INSERT INTO 
	addresses (address_id,      st_name ,           house_no,   postcode ,  city,           apartment,   phone,   email )    
	VALUES   (v_employee_id ,INITCAP(p_st_name) ,p_house_no,  p_postcode ,INITCAP(p_city), p_apartment, p_phone, p_email); 

	INSERT INTO 
	employees (employee_id,  first_name,        last_name,          birth_date,      hire_date,    sex,          address_id) -- employees table columns
	VALUES    ( v_employee_id, INITCAP(p_fname),  INITCAP(p_lname),   p_birth_date,    p_hire_date,  UPPER(p_sex),  v_employee_id);              

END;
/
