-- Maak een query die mij weergeeft hoeveel films er per categorie zijn, 
-- inclusief de categorienaam

select count(*), cat.name
from  film_category fc 
inner join category cat on cat.category_id = fc.category_id
group by cat.name
order by cat.name



