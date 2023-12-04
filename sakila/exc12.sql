/* Maak mij een view van 1 land alle klanten toont (bijvoorbeeld Canada) */

create or replace view customers_in_canada as
select concat(cus.first_name, ' ', cus.last_name) as customer_name,
		  cus.email,  cit.city, cou.country
from  customer cus 
inner join address adr on adr.address_id = cus.address_id
inner join city cit on cit.city_id = adr.city_id
inner join country cou on cou.country_id = cit.country_id
where cou.country = 'Canada'
order by customer_name, cit.city