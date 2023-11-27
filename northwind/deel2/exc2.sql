-- Wis alle producten duurder dan 40 en met een minimum reorder van minstens 15

/*
select * 
from northwind.products
where list_price > 40 and minimum_reorder_quantity >= 15 */

delete from northwind.products
where list_price > 40 and minimum_reorder_quantity >= 15 and id > -1


10:44:27	delete from northwind.products where list_price > 40 and minimum_reorder_quantity >= 15 and id > -1	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`northwind`.`inventory_transactions`, CONSTRAINT `fk_inventory_transactions_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION)	0.032 sec
