-- Geef de medewerkers weer waar in de naam an voorkom

select * 
from northwind.employees
where last_name like '%an%' or first_name like '%an%'