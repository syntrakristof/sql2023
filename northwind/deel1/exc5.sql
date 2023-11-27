-- Hoeveel bestellingen hebben we verzonden naar de staat New York en waar de shipping fees meer dan 10 dollar waren
SELECT * 
FROM northwind.orders
where state_province = 'NY' and shipping_fee > 10
