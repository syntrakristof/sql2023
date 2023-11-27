-- Geef de verschillende categorieën van medewerkers en hoeveel er per categorie zij

select job_title, count(*)
from employees
group by job_title