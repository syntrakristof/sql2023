-- Hoeveel verschillende achternamen van acteurs hebben we ?

select count(distinct(last_name))
from actor
