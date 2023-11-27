-- Hoeveel producten hebben we waar de minimum reorder quantity minstens 10 is
SELECT count(*)
FROM northwind.products
where minimum_reorder_quantity > 10
