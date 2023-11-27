use northwind;

/* Selecteer alle producten, als de prijs boven de 40 is, 
geef dan categorie A weer, als het onder de 40 is geef 
van C weer*/
select  id, product_name, list_price, 
   case
      when list_price < 40 then 'C'
      else 'A'
	end as category
from products
order by category, list_price, product_name