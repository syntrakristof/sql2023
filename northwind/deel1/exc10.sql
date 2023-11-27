-- Wat is de maximale en minimale prijs van alle product categorieën

select category, max(list_price) as max_price, min(list_price) as min_price
from northwind.products
group by category
order by category, max_price, min_price