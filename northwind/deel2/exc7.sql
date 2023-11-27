/* Geef mij een lijst van medewerkers die in Redmond of Seattle 
wonen. Als deze in Redmond wonen geef 
dan het bedrijf ‘Microsoft’ weer in de plaats van 
Northwind Traders */
use northwind;

select id, last_name, first_name,
	case
		when city = 'Redmond' then 'Microsoft'
        else company
    end as company_Name
from employees
order by company_name, last_name, first_name



