-- Maak mij een query die alle gebruikers weergeeft die  in het verleden een film gehuurd hebben


select ren.*, concat(cus.first_name, ' ', cus.last_name) as full_name
from rental ren 
inner join customer cus on cus.customer_id = ren.customer_id
where ren.rental_date < now()
order by full_name



-- Toon mij alle verschillende steden waar er winkels zijn ?

select cit.city, count(cit.city) as cnt
from store sto
inner join address adr on adr.address_id = sto.address_id
inner join city cit on cit.city_id = adr.city_id
group by cit.city
order by cit.city


-- Toon mij alle verschillende steden waar er meer dan 1 winkel is

select cit.city, count(cit.city) as cnt
from store sto
inner join address adr on adr.address_id = sto.address_id
inner join city cit on cit.city_id = adr.city_id
group by cit.city
having cnt > 1
order by cit.city


-- Toon mij de top 10 van de verhuurde films met een PG rating

select count(ren.rental_id) as cnt, mov.title
from rental ren
inner join inventory inv on inv.inventory_id = ren.inventory_id
inner join film mov on mov.film_id = inv.film_id
where mov.rating like '%PG%'
group by mov.title
order by cnt desc
limit 10



-- hoeveel kopieën heeft elke winkel van  “Hunchback Impossible”

select sto.store_id, count(mov.film_id) as total
from store sto
inner join inventory inv on inv.store_id = sto.store_id
inner join film mov on mov.film_id = inv.film_id
where mov.title like '%Hunchback Impossible%'
group by sto.store_id
order by sto.store_id





-- Toon mij voor elke winkel 
-- het adres en land waar deze gevestigd is

select store_id, concat(adr.address, ', ', cit.city) as address, cou.country
from store sto
inner join address adr on sto.address_id = adr.address_id
inner join city cit on cit.city_id = adr.city_id
inner join country cou on cou.country_id = cit.country_id
order by cou.country


-- Geef mij de namen en email adressen van alle klanten uit Canada


select concat(first_name, ' ', last_name) as customer_name, email
from customer cus
inner join address adr on adr.address_id = cus.address_id
inner join city cit on cit.city_id = adr.city_id
inner join country coun on cit.country_id = coun.country_id
where coun.country like '%canada%'
order by customer_name




-- Toon mij wie allemaal een PG-17 fim huurde en in welk filiaal ze dit deden en aan welke prijs




select inv.store_id, pay.amount, cus.first_name, cus.last_name
from rental ren
inner join inventory inv on inv.inventory_id = ren.inventory_id
inner join film mov on mov.film_id = inv.film_id
inner join customer cus on cus.customer_id = ren.customer_id
inner join payment pay on ren.rental_id = pay.rental_id
where mov.rating = 'PG-17'
order by inv.store_id



-- Toon mij hoeveel elke winkel opgebracht 
-- heeft in dollar per categorie, rangschik deze in 
-- dalende volgorde

select sto.store_id, sum(amount) as total_sum, cat.name
from rental ren
inner join inventory inv on inv.inventory_id = ren.inventory_id
inner join film mov on mov.film_id = inv.film_id
inner join film_category fc on mov.film_id = fc.film_id
inner join category cat on cat.category_id = fc.category_id
inner join payment pay on pay.rental_id = ren.rental_id
inner join store sto on inv.store_id = sto.store_id
group by sto.store_id, cat.name
order by total_sum desc






-- Maak een query die mij alle steden uit België geeft waar meer dan 150.000 mensen wonen
SELECT Name, Population
FROM world.city 
where CountryCode = 'BEL' and Population > 150000
order by Population desc



-- Toon mij welke talen gesproken worden in Belgïe en wat het percentage is
select Language, Percentage
from countrylanguage
where countrycode = 'BEL'
order by Percentage desc


-- Toon mij welke talen in de USA en Canda gesproken worden

select c.name, l.Language, l.Percentage
from countrylanguage l
inner join country c on c.Code = l.countrycode
where c.Code = 'USA' or c.Code = 'CAN'
order by c.name, l.Percentage desc


-- Toon mij de 25 steden met de meeste inwoners en in welk land ze liggen 
-- en welke talen gesproken worden (dit mag op 1 lijn met group_concat)

select cit.Name, cou.Name, cit.Population, group_concat(l.Language) as languages_spoken
from city cit
inner join country cou on cit.countrycode = cou.Code
inner join countrylanguage l on l.countrycode = cou.Code
group by cit.Name, cou.Name, cit.Population
order by cit.Population desc
limit 25



