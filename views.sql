CREATE OR REPLACE FORCE EDITIONABLE VIEW CART_GAME_DET ("CARTRIDGE_ID", "CART_TITLE", "GAME_TITLE", "PRICE", "GAME_RELEASE", "GAME_MODE", "GENRE", "PUBLISHER_NAME", "COUNTRY") AS 
SELECT 
    c.cartridge_id,  c.title cart_title,g.title game_title, c.price, g.grelease game_release
    , g.gmode game_mode, gn.name genre 
    ,d.name publisher_name ,cu.name country
FROM cartridges c
JOIN games_cartridges gc
ON c.CARTRIDGE_ID=gc.CARTRIDGE_ID
JOIN games g
ON gc.game_id=g.game_id
JOIN genres gn
ON gn.genre_id=g.genre_id
JOIN developers d
ON g.developer_id=d.developer_id
JOIN countries cu
ON d.country_id=cu.country_id
ORDER BY c.title,c.cartridge_id, g.title;

--

  CREATE OR REPLACE FORCE EDITIONABLE VIEW CARTRIDGES_GAMES_QT ("CARTRIDGE_ID", "TITLE", "PRICE", "COLOR", "AVAILABILITY", "GAMES_QT") AS 
  SELECT c.cartridge_id, c.title, c.price, c.color,c.availability
, gc.my_count AS games_qt FROM cartridges c
JOIN (SELECT CARTRIDGE_ID, COUNT(*) my_count FROM GAMES_CARTRIDGES 
        GROUP BY CARTRIDGE_ID) gc
ON c.cartridge_id=gc.cartridge_id 
ORDER BY my_count DESC;

--

  CREATE OR REPLACE FORCE EDITIONABLE VIEW DETAINED_TO_PAY ("FULL_NAME", "CUSTOMER_ID", "RENTAL_ID", "CARTRIDGE_ID", "OUT_DATE", "PRICE_TO_PAY") AS 
  SELECT 
    cu.first_name||' '||cu.last_name full_name, cu.customer_id, r.rental_id 
    ,c.cartridge_id, cr.out_date, c.price * TRUNC(sysdate-1 - cr.out_date) price_to_pay
FROM cartridges c
JOIN cartridges_rentals cr
ON c.cartridge_id=cr.cartridge_id
JOIN rentals r
ON cr.rental_id=r.rental_id
JOIN customers cu
ON cu.customer_id=r.customer_id
WHERE cr.in_date IS NULL
AND  c.price * TRUNC(sysdate-1 - cr.out_date)  > 0;

--

CREATE OR REPLACE FORCE EDITIONABLE VIEW DOUBLE_CARTS ("CARTRIDGE_ID", "TITLE", "PRICE", "COLOR", "AVAILABILITY") AS 
SELECT 
	"CARTRIDGE_ID","TITLE","PRICE","COLOR","AVAILABILITY" FROM cartridges
WHERE title IN (SELECT title FROM cartridges
                GROUP BY title
                HAVING COUNT(title) > 1);

--

CREATE OR REPLACE FORCE EDITIONABLE VIEW REN_CUST_PRICE ("RENTAL_ID", "CUSTOMER_ID", "FULL_NAME", "AMMOUNT", "CART_QT") AS 
SELECT 
    rn.rental_id, cu.customer_id, cu.first_name||' '||cu.last_name full_name 
    ,SUM(price) ammount, COUNT(*) cart_qt FROM cartridges c
JOIN cartridges_rentals rn
ON c.cartridge_id=rn.cartridge_id
JOIN rentals r
ON r.rental_id=rn.rental_id
JOIN customers cu
ON cu.customer_id=r.customer_id
GROUP BY rn.rental_id, cu.customer_id
    , cu.first_name||' '||cu.last_name
ORDER BY 1,2;

COMMENT ON TABLE CART_GAME_DET IS 'View shows cartridges and games with details';

COMMENT ON TABLE CARTRIDGES_GAMES_QT IS 'View shows cartridges with games amount';

COMMENT ON TABLE DETAINED_TO_PAY IS 'View shows extra charge for detention';

COMMENT ON TABLE DOUBLE_CARTS IS 'View shows duplicate of games';

COMMENT ON TABLE REN_CUST_PRICE IS 'View shows amount per rentals';



			
				
				