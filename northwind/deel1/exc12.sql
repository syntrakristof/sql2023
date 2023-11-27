-- Geef per productie categorie de totale som van de producten en hoeveel producten er in die categorie zijn

select category, count(*) as total, sum(list_price) as total_value
from northwind.products
group by category