-- Update 10 producten met een minimum reorder quantity 
-- met de waarde NULL als de prijs tussen 10 en 20 is

use northwind;


select * from products 
where list_price between 10 and 20 
LIMIT 10;

update products set
  minimum_reorder_quantity = NULL
where list_price between 10 and 20 
LIMIT 10;
  