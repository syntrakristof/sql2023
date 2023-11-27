-- Update de listing prijs van alle producten die meer kosten dan 20 met 5 euro extra

/*select * 
from northwind.products
where list_price > 20
*/
update northwind.products set
 list_price = list_price + 5
 where list_price > 20 and id > 0;
 
 -- Update de listing prijs van alle producten die tussen 5 en 20 euro kosten met 1 euro extra

update northwind.products set
 list_price = list_price + 1
 where list_price <= 20 and list_price >= 5 and id > 0;
 
