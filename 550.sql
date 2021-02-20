-- 用min date 取筛选activity 表，根据date +1
SELECT round(count(distinct b.player_id)/count(a.player_id), 2) as fraction
from 
    (select 
        player_id, MIN(event_date) as event_date
    from 
        Activity 
    group by 
        player_id) a 
left JOIN Activity b on a.player_id = b.player_id and a.event_date +1 = b.event_date


