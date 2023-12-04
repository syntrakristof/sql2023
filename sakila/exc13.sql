-- Toon mij hoeveel acteurs er per film te zien zijn

select mov.title, count(fa.actor_id) as total
from sakila.film_actor fa
inner join film mov on mov.film_id = fa.film_id
group by fa.film_id
order by mov.title