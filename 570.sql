with cte as (
    select ManagerId 
    from employee
    group by ManagerId HAVING count(Id) >= 4

)
select Name from employee e join cte c on e.Id = c.ManagerId


SELECT 
    Name 
from employee e 
join employee t on e.ManagerId = t.Id
group by t.Name 
having count(t.Name) >=5 
