-- Update 5 prijzen van producten met de waarde NULL 
-- als de prijs tussen 21 en 30 is

use northwind;

select * from products 
where list_price between 21 and 30
LIMIT 5;

update products set
  list_price = NULL
where list_price between 21 and 30
LIMIT 5;
  