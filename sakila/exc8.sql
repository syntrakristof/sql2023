/* Maak mij een query die mij weergeeft wie welke film gehuurd heeft inclusief de namen */

select concat(cus.first_name, ' ', cus.last_name) as customer_name, 
        mov.title as movie_name
from sakila.rental ren
inner join customer cus on cus.customer_id = ren.customer_id
inner join inventory inv on inv.inventory_id = ren.inventory_id
inner join film mov on mov.film_id = inv.film_id
order by customer_name
