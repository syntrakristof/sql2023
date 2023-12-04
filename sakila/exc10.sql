--  Toon mij per categorie de gemiddele/maximale/minimale lengte van de film
select cat.name, max(mov.length) as max_duration, 
	min(mov.length) as min_duration, avg(mov.length) as avg_duration
from category cat
inner join film_category fc on fc.category_id = cat.category_id
inner join film mov on fc.film_id = mov.film_id
group by cat.name
order by cat.name
