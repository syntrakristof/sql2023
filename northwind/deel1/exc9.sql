-- Hoeveel klanten hebben we in elke staat en provincie wonen


select count(*) as aantal, state_province, country_region
from northwind.customers
group by state_province, country_region
order by aantal, state_province, country_region

