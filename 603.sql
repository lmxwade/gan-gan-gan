select 
    count (distinct seat_id )
from cinema a 
join cinema b 
on ABS(a.seat_id  -b.seat_id) =1 
and a.free =1 and b.free = 1
ORDER by seat_id ASC 
