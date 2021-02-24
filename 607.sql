SELECT distinct name 
from salesperson t2
join 
(select sales_id from orders 
where com_id <> 1 ) t1 
on t2.sales_id = t1.sales_id 
