# DB_NES_RENTAL
NES cartridges rental shop project in Oracle 18c database

# USER STORY

I have many cartridges with games to NES console. There are rent for one day. Each cartridge can have got different price. It can be rented for one day only. One customer can rents maximum 3 cartridges. Customers can make reservations at the renting day. They are not able to do it for the next day. Reservations limit is maximum 3 as well. Cartridges have to be returned nest day or customer is chared price of cartridge plus 0.5 for each extra day and the have to be registered. Customers who made reservation but have not been realized it, they don't bear any responsibility but they have to be also registered.

My wife and my son help me with running the company. I would like the system to register by whom renting were made.

The cartridges can be of different colors and should have a title. A cartridge can contain from one to many games. Each named game have to assigned a genre and one of the three game modes (single player, multiplayer or gun). It might contain a release year  and a publisher. The publisher may have additional information such as country and date of establishment.

Customers are above and below 18 years of age. Customers under 18 years old has to be assigned a patron, who may be a customer who is 18 years or older. In addition to personal data, the address of each customer is obtained as well.

# 

![ER](https://user-images.githubusercontent.com/109458567/200366457-8f078a54-dcb5-4ebe-be55-95e43a38a0d4.png)

# CONTENT

<lu>    
<li>Schema.sql  -  Tables</li>    
<li>Views.sql   -  Views</li>  
<li>PKG         -  Folder with packages</li>  
<li>TRIGGERS    -  Folder with triggers</li>
<li>insert_data.sql -  Example data(uses procedures)</li>
</lu>

#  

```BASH
The file run.sql loads the database from C:\NES directory. 
Copy there the content and create user with privileges.
Logon, run - @c:\NES\run.sql;
```