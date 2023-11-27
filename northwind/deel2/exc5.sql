CREATE TABLE northwind.products_backup LIKE northwind.products ;
INSERT INTO northwind.products_backup
SELECT * FROM northwind.products 
where list_price > 20