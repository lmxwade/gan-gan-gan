    
SELECT 
    t1.pay_month,
    t1.department_id，
    (case 
        when t1.ct < t2.ct then "lower" 
        when t1.ct = t2.ct then "same"
        else "higher" end   =) comparison
FROM
    (select 
        SUBSTRING(pay_date,7) pay_month,
        department_id as department_id,
        AVG(amount) ct
    from 
        salary s
    join 
    employee e on s.employee_id = e.employee_id 
    group by e.department_id, SUBSTRING(pay_date,7)) t1

    join 

    (SELECT 
        avg(amount) ct,
        SUBSTRING(pay_date,7) pay_month
    from 
        salary s
    join 
    employee e on s.employee_id = e.employee_id 
    group by  SUBSTRING(pay_date,7)) t2 
    )
    on t1. pay_month = t2.pay_month 

group by 
    t1.department_id