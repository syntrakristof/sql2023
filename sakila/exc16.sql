-- Toon mij de 5 genres van films waar we het meeste inkomsten uit halen, 
-- en de 5 genres waar we de minste inkomsten van hebben, 
-- inclusief de opbrengst gerangschik van hoog naar laag

(select cat.name, sum(pay.amount) as amount, count(ren.rental_id)  as total
from rental ren
inner join payment pay on pay.rental_id = ren.rental_id 
inner join inventory inv on inv.inventory_id = ren.inventory_id
inner join film mov on inv.film_id = mov.film_id
inner join film_category fc on fc.film_id = mov.film_id
inner join category cat on cat.category_id = fc.category_id
group by cat.name
order by amount desc limit 5)

UNION


(select cat.name, sum(pay.amount) as amount, count(ren.rental_id)  as total
from rental ren
inner join payment pay on pay.rental_id = ren.rental_id 
inner join inventory inv on inv.inventory_id = ren.inventory_id
inner join film mov on inv.film_id = mov.film_id
inner join film_category fc on fc.film_id = mov.film_id
inner join category cat on cat.category_id = fc.category_id
group by cat.name
order by amount asc limit 5)

order by 2 desc


