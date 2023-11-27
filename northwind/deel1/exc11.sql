-- Hoeveel producten hebben we per categorie, supplier id en geef ook telkens de min en max waarde weer

select category, supplier_ids, max(list_price), min(list_price)
from northwind.products
group by category, supplier_ids