-- Hoeveel customers hebben we die in de staat New York wone

select count(*) from northwind.customers 
where state_province = 'NY'
order by last_name, first_name