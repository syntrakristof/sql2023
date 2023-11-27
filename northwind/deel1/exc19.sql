-- Update alle producten met een minimum herbestelling hoeveelheid met 1 als er geen is


SELECT * 
FROM northwind.products
where minimum_reorder_quantity is null

update northwind.products SET
	minimum_reorder_quantity  = 1
where minimum_reorder_quantity is null