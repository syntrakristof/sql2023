/* Toon de klanten waar de functie “Owner” of
 “Purchasing Assistant” is, en toon hun volledige naam 
 als “fullname”, titel en  stad als (provinciecode – stad)
 */
 
 use northwind;
 select id, company, 
    concat(last_name, ' ', first_name) as fullname,
    concat(state_province, ' - ', city) as customer_city
 from customers
 where job_title in ('Purchasing Assistant', 'Owner')
order by customer_city, company, fullname