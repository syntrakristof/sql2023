/* Geef mij alle prijzen weer van de producten, 
als een product leeg is dan moet er NA weergegeven worden
*/
use northwind;

select id, product_name, coalesce(list_price, 'NA') as price
from northwind.products 
order by price, product_name
