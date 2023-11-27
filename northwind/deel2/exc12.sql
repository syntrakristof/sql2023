/*
Selecteer 2 medewerkers en toon hun volledige naam 
als “fullname” en hun job titel, gebruik een union. Als 
medewerkers gebruiken we de id 2 en 5
*/

use northwind;

(select id, company, concat(last_name, ' ', first_name) as fullname
from employees
where id = 2)
union
(select id, company, concat(last_name, ' ', first_name) as fullname
from employees
where id = 5)
order by fullname