-- Toon mij alle volledige namen, job titel en stad van zowel 
-- medewerkers als klanten in 1 query, als het een klant is dan 
-- krijgt deze persoon een type C, 
-- als het een medewerker is type E, 
-- sorteer op type en naam
use northwind;

(select concat(first_name, ' ', last_name) as fullname, 'C' as category, job_title, city
from customers)
union
(select concat(first_name, ' ', last_name) as fullname, 'E' as category, job_title, city
from employees)
order by category, fullname