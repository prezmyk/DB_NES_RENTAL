CREATE OR REPLACE PACKAGE game_cart_pkg IS    
   -- Cllection with games to cartridge
   TYPE game_array IS TABLE OF NUMBER;   
   PROCEDURE add_games_to_cartridge ( p_game_id game_array, p_price NUMBER,
        p_title VARCHAR2 DEFAULT NULL, p_color VARCHAR2 DEFAULT NULL );   
END game_cart_pkg;
/

CREATE OR REPLACE PACKAGE BODY game_cart_pkg IS  

PROCEDURE add_games_to_cartridge ( p_game_id game_array, p_price NUMBER,
                                    p_title VARCHAR2 DEFAULT NULL, p_color VARCHAR2 DEFAULT NULL) AS
v_cart_id NUMBER;                            
BEGIN
	INSERT INTO cartridges ( price, title, color) 
	VALUES ( p_price, UPPER(p_title), INITCAP(p_color))
	RETURNING cartridge_id INTO v_cart_id;

	FOR i IN p_game_id.first .. p_game_id.last
	LOOP
		INSERT INTO games_cartridges(game_id, cartridge_id)
		VALUES (p_game_id(i), v_cart_id);            
	END LOOP;        
END;
END game_cart_pkg;
/

