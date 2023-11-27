-- Welke achternamen hebben we slechts 1 maal bij de acteurs ?

select count(*) as cnt, last_name
from actor
group by last_name
having cnt = 1
order by last_name

