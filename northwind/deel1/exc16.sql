-- Vervang klant 7 zijn gegevens door jouw eigen gegevens

/*select * 
from northwind.customers
where id = 7*/

update northwind.customers set
 last_name = 'Degros',
 first_name = 'Kristof'
 where id = 7
