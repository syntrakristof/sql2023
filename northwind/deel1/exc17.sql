-- Vervang de gegevens van klant 14 en 15 door dezelfde gegevens


/*select * 
from northwind.customers
where id in (14, 15) */


update northwind.customers set
 last_name = 'Degros',
 first_name = 'Kristof'
where id = 14 or id = 15