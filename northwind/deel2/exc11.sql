-- Maak een som van alle prijzen van de producten
-- als default prijs nemen we 15

use northwind;

select sum(coalesce(list_price, 15)) as total
from products;




