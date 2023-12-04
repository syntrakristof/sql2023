-- Welke acteur komt het meest voor in onze film databank ?

select count(fa.actor_id) as cnt,
     concat(act.first_name, ' ', act.last_name) as fullname
from actor act
inner join film_actor fa on act.actor_id = fa.actor_id
group by act.actor_id
order by cnt desc, act.actor_id desc limit 1