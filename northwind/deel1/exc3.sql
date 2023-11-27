-- Selecteer alle customers uit de stad Chicago of seattle

select * from northwind.customers 
where city = 'Chicago' or city = 'Seattle'
order by last_name, first_name