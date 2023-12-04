/* Maak mij een query waar je 1 acteur kiest en dan weergeeft in welke films hij te zien is */

select first_name, last_name, title
from actor act
inner join film_actor fa on fa.actor_id = act.actor_id
inner join film mov on fa.film_id = mov.film_id
where act.actor_id = 1
order by title