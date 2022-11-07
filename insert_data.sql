
SET DEFINE OFF ;
-- alter session to correct decimal input values
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.,'; 
ALTER SESSION SET nls_date_format = 'YYYY/MM/DD';

-- Genres table
Insert into GENRES (NAME) values ('Platform');
Insert into GENRES (NAME) values ('Arcade');
Insert into GENRES (NAME) values ('Beat ''em up');
Insert into GENRES (NAME) values ('Platform');
Insert into GENRES (NAME) values ('Puzzle');
Insert into GENRES (NAME) values ('Racing');
Insert into GENRES (NAME) values ('RPG');
Insert into GENRES (NAME) values ('Shooter');
Insert into GENRES (NAME) values ('Split-Screen');
Insert into GENRES (NAME) values ('Sport');

--- COUNTRIES Table

Insert into COUNTRIES (COUNTRY_ID,NAME) values ('AUS','Australia');
Insert into COUNTRIES (COUNTRY_ID,NAME) values ('CAN','Canada');
Insert into COUNTRIES (COUNTRY_ID,NAME) values ('CHN','China');
Insert into COUNTRIES (COUNTRY_ID,NAME) values ('CZE','Czechia');
Insert into COUNTRIES (COUNTRY_ID,NAME) values ('FRA','France');
Insert into COUNTRIES (COUNTRY_ID,NAME) values ('DEU','Germany');
Insert into COUNTRIES (COUNTRY_ID,NAME) values ('JPN','Japan');
Insert into COUNTRIES (COUNTRY_ID,NAME) values ('POL','Poland');
Insert into COUNTRIES (COUNTRY_ID,NAME) values ('SGP','Singapore');
Insert into COUNTRIES (COUNTRY_ID,NAME) values ('SWE','Sweden');
Insert into COUNTRIES (COUNTRY_ID,NAME) values ('CHE','Switzerland');
Insert into COUNTRIES (COUNTRY_ID,NAME) values ('GBR','United Kingdom of Great Britain (the)');
Insert into COUNTRIES (COUNTRY_ID,NAME) values ('USA','United States of America (the)');
Insert into COUNTRIES (COUNTRY_ID,NAME) values ('ESP','Spain');

-- DEVELOPERS TABLE
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('HAL',null,'USA');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Sunsoft',null,'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('NCS',null,'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('K Amusement',null,'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Kemco',null,'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('SETA',to_date('1985/10/01','YYYY/MM/DD'),'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Capcom',to_date('1979/05/30','YYYY/MM/DD'),'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Taito',null,'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Nintendo',to_date('1989/09/23','YYYY/MM/DD'),'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('VAP',to_date('1981/01/24','YYYY/MM/DD'),'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Namco',to_date('1955/06/01','YYYY/MM/DD'),'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Hudson Soft',to_date('1973/05/18','YYYY/MM/DD'),'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Konami',to_date('1969/03/21','YYYY/MM/DD'),'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Pack-In-Video',to_date('70/08/03','YYYY/MM/DD'),'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Jaleco',to_date('1974/10/03','YYYY/MM/DD'),'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Tecmo',to_date('1967/07/31','YYYY/MM/DD'),'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Tokuma Shoten',to_date('1954/03/19','YYYY/MM/DD'),'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Data East',to_date('1976/04/20','YYYY/MM/DD'),'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Bullet-Proof Software',to_date('1983/08/10','YYYY/MM/DD'),'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Athena',null,'JPN');
Insert into DEVELOPERS (NAME,ESTB_DATE,COUNTRY_ID) values ('Square',null,'JPN');

-- GAMES Table

Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('8 Eyes',to_date('1988/09/27','YYYY/MM/DD'),'single-player',700,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('1942',to_date('1985/12/11','YYYY/MM/DD'),'single-player',800,800);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('1943',to_date('1988/06/20','YYYY/MM/DD'),'single-player',800,800);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('2010 Street Fighter',to_date('1990/08/08','YYYY/MM/DD'),'single-player',800,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Adventures of Lolo',to_date('1990/01/06','YYYY/MM/DD'),'multiplayers',100,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Adventures of Lolo 2',to_date('1990/12/26','YYYY/MM/DD'),'multiplayers',100,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Arkanoid',to_date('1986/12/26','YYYY/MM/DD'),'multiplayers',900,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Arkanoid II',to_date('1988/03/08','YYYY/MM/DD'),'multiplayers',900,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Balloon Fight',to_date('1985/01/22','YYYY/MM/DD'),'multiplayers',1000,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Baseball',to_date('1983/12/07','YYYY/MM/DD'),'multiplayers',1000,1000);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Baseball Fighter',to_date('1991/07/05','YYYY/MM/DD'),'single-player',1100,1000);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Batman',to_date('1989/12/22','YYYY/MM/DD'),'single-player',200,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Battle City',to_date('1985/09/09','YYYY/MM/DD'),'multiplayers',1200,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Battletoads',to_date('1991/12/20','YYYY/MM/DD'),'multiplayers',300,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Bomberman',to_date('1985/12/19','YYYY/MM/DD'),'single-player',1300,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Bomberman II',to_date('1991/06/28','YYYY/MM/DD'),'single-player',1300,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Bucky O''Hare',to_date('1992/01/31','YYYY/MM/DD'),'single-player',1400,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Chack''n Pop',to_date('1985/05/24','YYYY/MM/DD'),'multiplayers',900,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Chip ''N Dale: Rescue Rangers',to_date('1990/06/08','YYYY/MM/DD'),'multiplayers',800,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Chip ''N Dale: Rescue Rangers 2',to_date('1993/12/10','YYYY/MM/DD'),'multiplayers',800,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Clu Clu Land',to_date('1984/11/22','YYYY/MM/DD'),'multiplayers',1000,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Contra',to_date('1988/02/09','YYYY/MM/DD'),'multiplayers',1400,800);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('De-Block',to_date('1991/08/09','YYYY/MM/DD'),'multiplayers',2000,500);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Die Hard',to_date('1991/07/19','YYYY/MM/DD'),'multiplayers',1600,800);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Dig Dug',to_date('1985/06/04','YYYY/MM/DD'),'multiplayers',1200,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Dig Dug II',to_date('1986/04/18','YYYY/MM/DD'),'multiplayers',1200,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Donkey Kong',to_date('1983/07/15','YYYY/MM/DD'),'multiplayers',1000,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Donkey Kong 3',to_date('1984/07/04','YYYY/MM/DD'),'multiplayers',1000,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Dr. Mario',to_date('1990/07/27','YYYY/MM/DD'),'multiplayers',1000,500);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Duck Hunt',to_date('1984/04/21','YYYY/MM/DD'),'gun',1000,800);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('DuckTales 2',to_date('1993/04/23','YYYY/MM/DD'),'single-player',800,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('F-1 Race',to_date('1984/11/02','YYYY/MM/DD'),'single-player',1000,600);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Final Fantasy',to_date('1987/12/18','YYYY/MM/DD'),'single-player',2100,700);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Galaga',to_date('1985/02/15','YYYY/MM/DD'),'multiplayers',1200,800);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Galaxian',to_date('1984/09/07','YYYY/MM/DD'),'multiplayers',1200,800);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Goal !!',to_date('1992/09/25','YYYY/MM/DD'),'multiplayers',1800,1000);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Ikari III',to_date('1990/03/16','YYYY/MM/DD'),'multiplayers',400,800);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('The Jetsons: Cogswell''s Caper!',to_date('1993/04/23','YYYY/MM/DD'),'single-player',900,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Mappy',to_date('1984/11/14','YYYY/MM/DD'),'multiplayers',1200,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Mario Bros.',to_date('1983/09/09','YYYY/MM/DD'),'multiplayers',1000,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Mighty Bomb Jack',to_date('1986/04/24','YYYY/MM/DD'),'single-player',1900,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Mighty Final Fight',to_date('1993/06/11','YYYY/MM/DD'),'single-player',800,300);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Nuts & Milk',to_date('1984/07/28','YYYY/MM/DD'),'multiplayers',1300,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Pac-Man',to_date('1984/11/02','YYYY/MM/DD'),'multiplayers',1200,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Pinball',to_date('1984/02/02','YYYY/MM/DD'),'multiplayers',1000,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Pooyan',to_date('1985/09/20','YYYY/MM/DD'),'multiplayers',1300,800);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Popeye',to_date('1983/07/15','YYYY/MM/DD'),'multiplayers',1000,200);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Power Soccer',to_date('1990/03/30','YYYY/MM/DD'),'multiplayers',2000,1000);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Predator',to_date('1988/03/10','YYYY/MM/DD'),'single-player',1600,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Rambo',to_date('1987/12/04','YYYY/MM/DD'),'single-player',1600,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('RoboCop',to_date('1989/08/25','YYYY/MM/DD'),'single-player',2100,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('RoboCop 2',to_date('1905/12/06','YYYY/MM/DD'),'single-player',2100,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Rockman',to_date('1987/12/17','YYYY/MM/DD'),'single-player',800,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Rockman 2: Dr. Wily no Nazo',to_date('1988/12/24','YYYY/MM/DD'),'single-player',800,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Soccer',to_date('1985/04/09','YYYY/MM/DD'),'multiplayers',1000,1000);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Spy vs. Spy',to_date('1986/04/26','YYYY/MM/DD'),'multiplayers',500,900);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Super Contra',to_date('1990/02/02','YYYY/MM/DD'),'multiplayers',1400,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Super Mario Bros.',to_date('1985/09/13','YYYY/MM/DD'),'multiplayers',1000,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Super Mario Bros. 3',to_date('1988/10/23','YYYY/MM/DD'),'multiplayers',1000,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Terminator 2',to_date('1992/06/26','YYYY/MM/DD'),'single-player',1600,100);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Tetris',to_date('1988/12/22','YYYY/MM/DD'),'multiplayers',1900,500);
Insert into GAMES (TITLE,GRELEASE,GMODE,DEVELOPER_ID,GENRE_ID) values ('Wrecking Crew',to_date('1985/06/18','YYYY/MM/DD'),'multiplayers',1000,100);

-- EMPLOYEES

CALL add_pkg.add_emp('Mietek',	'Kowalski',	TO_DATE('1965/12/28','YYYY/MM/DD'),	TO_DATE('2015/01/01','YYYY/MM/DD')	,'M'
	,	add_pkg.add_address('Manchester','21-100','Developer Rd','21' )); 

UPDATE EMPLOYEES SET db_user = (SELECT user FROM dual)
WHERE first_name ='Mietek'; 

INSERT INTO EMPLOYEES( FIRST_NAME, LAST_NAME, BIRTH_DATE, HIRE_DATE, SEX, ADDRESS_ID) 
    VALUES ('Georgia',	'Kowalski',	'1968/03/18',	'2015/01/01'	,'F', 
    ( SELECT ADDRESS_ID FROM employees WHERE first_name ='Mietek') );

INSERT INTO EMPLOYEES ( FIRST_NAME, LAST_NAME, BIRTH_DATE, HIRE_DATE, SEX, ADDRESS_ID)
    VALUES ('Janush',	'Kowalski',	'1990/09/11',	'2016/06/17'	,'M'
,	( SELECT ADDRESS_ID FROM employees WHERE first_name ='Mietek'));

-- PL/SQL Block for insert data into CUSTOMERS/ADDRESSES tables

BEGIN

add_pkg.add_cust ('Steven','King',to_date('1978/06/17','YYYY/MM/DD'),'M'
  ,add_pkg.add_address ('manchester','21-100','Green st','11',null));  
add_pkg.add_cust ('Neena','King',to_date('2008/09/21','YYYY/MM/DD'),'F' 
  , add_pkg.get_address('Steven','King',to_date('1978/06/17','YYYY/MM/DD'))
  , add_pkg.get_patron('Steven','King',to_date('1978/06/17','YYYY/MM/DD'))) ;  
add_pkg.add_cust ('Lex','King',to_date('1997/01/13','YYYY/MM/DD'),'M'
  , add_pkg.get_address('Steven','King',to_date('1978/06/17','YYYY/MM/DD'))
  , add_pkg.get_patron('Steven','King',to_date('1978/06/17','YYYY/MM/DD')));
  
add_pkg.add_cust ('Alexander','Austin',to_date('1978/06/17','YYYY/MM/DD'),'M'
  , add_pkg.add_address('manchester','21-100','Sweet Lane','13a','2'));  
add_pkg.add_cust ('Bruce','Austin',to_date('2007/03/23','YYYY/MM/DD'),'M'
  , add_pkg.get_address('Alexander','Austin',to_date('1978/06/17','YYYY/MM/DD'))
  , add_pkg.get_patron('Alexander','Austin',to_date('1978/06/17','YYYY/MM/DD')));  
add_pkg.add_cust ('David','Austin',to_date('2009/04/10','YYYY/MM/DD'),'M'
  , add_pkg.get_address('Alexander','Austin',to_date('1978/06/17','YYYY/MM/DD'))
  , add_pkg.get_patron('Alexander','Austin',to_date('1978/06/17','YYYY/MM/DD')));
  
add_pkg.add_cust ('Valli','Pataballa',to_date('1978/06/17','YYYY/MM/DD'),'M'
  ,add_pkg.add_address('manchester','21-100','Bishop road','22')); 
add_pkg.add_cust ('Diana','Pataballa',to_date('2004/09/21','YYYY/MM/DD'),'F'  
  , add_pkg.get_address('Valli','Pataballa',to_date('1978/06/17','YYYY/MM/DD'))
  , add_pkg.get_patron('Valli','Pataballa',to_date('1978/06/17','YYYY/MM/DD')));
  
add_pkg.add_cust ('Nancy','Popp',to_date('1977/07/29','YYYY/MM/DD'),'F'
  , add_pkg.add_address('manchester','21-100','Oxford Road','2b','4'));  
add_pkg.add_cust ('Daniel','Popp',to_date('2001/12/17','YYYY/MM/DD'),'M'
  ,add_pkg.get_address('Nancy','Popp',to_date('1977/07/29','YYYY/MM/DD')));
add_pkg.add_cust ('John','Popp',to_date('2007/10/01','YYYY/MM/DD'),'M'
  , add_pkg.get_address('Nancy','Popp',to_date('1977/07/29','YYYY/MM/DD'))
  , add_pkg.get_patron ('Nancy','Popp',to_date('1977/07/29','YYYY/MM/DD')));
add_pkg.add_cust ('Ismael','Popp',to_date('2008/03/13','YYYY/MM/DD'),'M'
  , add_pkg.get_address('Nancy','Popp',to_date('1977/07/29','YYYY/MM/DD'))
  , add_pkg.get_patron ('Nancy','Popp',to_date('1977/07/29','YYYY/MM/DD'))); 
  
add_pkg.add_cust ('Jose Manuel','Urman',to_date('1982/06/17','YYYY/MM/DD'),'M'
  , add_pkg.add_address('manchester','21-100','Queen''s ave','113'));
add_pkg.add_cust ('Luis','Urman',to_date('2006/07/02','YYYY/MM/DD'),'M'
  , add_pkg.get_address('Jose Manuel','Urman',to_date('1982/06/17','YYYY/MM/DD'))
  , add_pkg.get_patron ('Jose Manuel','Urman',to_date('1982/06/17','YYYY/MM/DD')));

add_pkg.add_cust ('Den','Raphaely',to_date('1987/10/29','YYYY/MM/DD'),'M'
  ,add_pkg.add_address('manchester','21-100','Anson Rd','54'));
  
add_pkg.add_cust ('Shelli','Baida',to_date('2008/09/21','YYYY/MM/DD'),'F'
  , add_pkg.add_address('manchester','21-100','King''s street','11')
  , add_pkg.get_patron('Den','Raphaely',to_date('1987/10/29','YYYY/MM/DD')));

add_pkg.add_cust ('Sigal','Tobias',to_date('1988/11/09','YYYY/MM/DD'),'M'
  , add_pkg.add_address('Edinburgh','22-300','Leith Walk','4'));

add_pkg.add_cust ('Guy','King',to_date('1987/11/15','YYYY/MM/DD'),'M'
  , add_pkg.add_address('manchester','21-100','Swayfield Avenue','20'));
  
END;
/

-- PL/SQL Block to add cardridges with games uesed game_id started with 1
DECLARE
game_array game_cart_pkg.game_array  := game_cart_pkg.game_array(); 
BEGIN 
	-- Games List By game_id
    game_array := game_cart_pkg.game_array(19,20);
	-- rests of cartridge details price and opcional tittle and color
    game_cart_pkg.add_games_to_cartridge(game_array, 2, q'[Chip 'N Dale]', 'Black'); 
  
    game_array := game_cart_pkg.game_array(10,48,55);
    game_cart_pkg.add_games_to_cartridge(game_array, 2, q'[Sports]', 'Yellow'); 
 
    game_array := game_cart_pkg.game_array(51,52);
    game_cart_pkg.add_games_to_cartridge(game_array, 2, q'[Robocops]', 'Yellow'); 
 
    game_array := game_cart_pkg.game_array(17);
    game_cart_pkg.add_games_to_cartridge(game_array, 1, q'[Bucky O'Hare]', 'Yellow'); 

    game_array := game_cart_pkg.game_array(1);
    game_cart_pkg.add_games_to_cartridge(game_array, 1, q'[8 Eyes]', 'Red');
   
    game_array := game_cart_pkg.game_array(2,3);
    game_cart_pkg.add_games_to_cartridge(game_array, 1, q'[Flight Shooter]', 'Red'); --  

    game_array := game_cart_pkg.game_array(22);
    game_cart_pkg.add_games_to_cartridge(game_array, 1.5, q'[Contra]', 'blue');  
	
    game_array := game_cart_pkg.game_array(31);
    game_cart_pkg.add_games_to_cartridge(game_array, 2, q'[Duck Tales 2]', 'Blue');  

    game_array := game_cart_pkg.game_array(21,25,18,7,34,31,44,45,47,46);
    game_cart_pkg.add_games_to_cartridge(game_array, 2.5, q'[Classic Mix I]', 'Blue');
 
    game_array := game_cart_pkg.game_array(60);
    game_cart_pkg.add_games_to_cartridge(game_array, 2, q'[Terminator II]', 'Grey'); 

    game_array := game_cart_pkg.game_array(38);
    game_cart_pkg.add_games_to_cartridge(game_array, 1.5, q'[Jetsons]', 'Blue'); 
    
    game_array := game_cart_pkg.game_array(40,58,59);
    game_cart_pkg.add_games_to_cartridge(game_array, 2, q'[Marios]', 'Grey'); 

    game_array := game_cart_pkg.game_array(31);
    game_cart_pkg.add_games_to_cartridge(game_array, 2, q'[Duck Tales 2]', 'Yellow'); 
  
    game_array := game_cart_pkg.game_array(29);
    game_cart_pkg.add_games_to_cartridge(game_array, 1, q'[Dr. Mario]', 'Red'); 
	
    game_array := game_cart_pkg.game_array(2,18,22,25,23,37,40,30);
    game_cart_pkg.add_games_to_cartridge(game_array, 2.5, q'[Classic Mix 2]', 'Yellow'); 
	
	game_array := game_cart_pkg.game_array(22);
    game_cart_pkg.add_games_to_cartridge(game_array, 1.5, q'[Contra]', 'black');  
END;
/


COMMIT;









