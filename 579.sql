select 
    Id,
    Month,
    sum(e1.Salary) 
from Employee e 
join Employee e1 on 
e.Month -e1.Month >= 0 
and e.Month - e1.Month <=3 
group by e.Id, e.Month 
having (e.Id, e.Month) not in ( select Id, Max(Month) from Employee group by Id)
order by e.Id,e.Month DESC





SELECT A.id,A.month,A.tsalary AS `Salary`
from
(
	SELECT E1.Id,E1.MONTH,SUM(E2.Salary) AS `tsalary`
	FROM employee AS E1 JOIN employee AS E2 ON (E1.Id = E2.Id AND E1.MONTH >= E2.MONTH and E2.MONTH >= E1.MONTH - 2)
	GROUP BY E1.Id,E1.MONTH
) AS A
JOIN 
(
	SELECT E.Id, MAX(E.MONTH) AS `max_month`
	FROM employee AS E
	GROUP BY E.Id
) AS B
	ON (A.Id=B.Id AND A.MONTH < B.max_month) --选出最大月,join来选取小于最大月即可
order by A.id,A.month desc