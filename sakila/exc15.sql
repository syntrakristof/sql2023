-- Toon mij de lijst van de 10 meest gehuurde films beginnende met de meest gehuurde bovenaan

select mov.title, count(ren.rental_id) as total_times_rented
from rental ren
inner join inventory inv on inv.inventory_id = ren.inventory_id
inner join film mov on inv.film_id = mov.film_id
group by mov.film_id
order by total_times_rented desc limit 10

