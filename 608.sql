select id ,
    (case 
        when p_id  = null then 'Root'
        when p_id in (select distinct p_id from tree) then "Inner"
        else "leaf"
        end ) Type 
from tree 
