select 
    t1.ad,
    count(t1.id) ct 
from 

    (select requester_id as id from request_accepted 
    union ALL
    select accepter_id as id from request_accepted ) as t1 
GROUP by t1.ad 
order by ct DESC 
limit 1 


