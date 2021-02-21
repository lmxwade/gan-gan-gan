select 
    dept_name,
    count(distinct student_id) as student_number
from 
student_talbe s
right join department_table d on s.dept_id = d.dept_id
GROUP by dept_name
order by student_number DESC, dept_name;
