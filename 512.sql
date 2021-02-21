select 
    player_id,
    device_id
from 
    (select 
        player_id,
        device_id,
        row_number()over(partition by player_id ORDER by event_date ASC) as rk
        from Activity 
        group by player_id)
where rk = 1
group by player_id 
 