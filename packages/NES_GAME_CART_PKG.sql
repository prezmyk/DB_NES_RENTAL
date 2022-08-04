CREATE OR REPLACE PACKAGE game_cart_pkg IS    
   TYPE game_array IS TABLE OF NUMBER;
   PROCEDURE add_games_to_cartridge ( p_game_id game_array, p_price NUMBER,
                                    p_title VARCHAR2 DEFAULT NULL, p_color VARCHAR2 DEFAULT NULL );   
    v_id NUMBER;
END game_cart_pkg;
/


CREATE OR REPLACE PACKAGE BODY game_cart_pkg IS  

    PROCEDURE add_games_to_cartridge ( p_game_id game_array, p_price NUMBER,
                                    p_title VARCHAR2 DEFAULT NULL, p_color VARCHAR2 DEFAULT NULL) AS
        BEGIN
            INSERT INTO cartridges ( price, title, color) 
                         VALUES ( p_price, UPPER(p_title), INITCAP(p_color));

            v_id := CARTRIDGES_ID_SEQ.currval; -- CARTRIGES TABLE CARTRIGE_ID SEQUENCE
            FOR i IN p_game_id.first .. p_game_id.last
            LOOP
                INSERT INTO games_cartridges(game_id, cartridge_id)
                           VALUES (p_game_id(i), v_id);            
            END LOOP;        
        END;
/* 
DECLARE
    game_array game_cart_pkg.game_array 
    := game_cart_pkg.game_array(); -- Game_id to cartridge  
BEGIN   
    game_cart_pkg.add_games_to_cartridge(game_array, p_price => , p_title, p_color); -- rests of cartridge details
END;
*/
END game_cart_pkg;
/
