-- Maak een query die mij weergeeft welke films je in 
-- de categorie Sci-Fi kan terugvinden

select mov.title, mov.release_year, mov.description
from film mov
inner join film_category fc on fc.film_id = mov.film_id
inner join category cat on fc.category_id = cat.category_id
where cat.name like '%SCI-FI%'
order by mov.release_year, mov.title