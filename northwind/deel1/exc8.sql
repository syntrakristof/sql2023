-- Hoeveel producten hebben we waar de prijs groter is dan 20 en de minimum reorder per bestelling niet leeg is

SELECT *
FROM northwind.products
where list_price > 20 and minimum_reorder_quantity is not null
order by list_price
