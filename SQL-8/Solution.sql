#Table 1
with cte as
	(Select * from Salary
		cross join Income
	union
	Select * from Salary
		cross join Deduction)
select 
	emp_id,
    emp_name,
    income as TRNS_TYPE,
    round((base_salary*percent)/100,0) as Amount
from cte
order by emp_id;

#Table 2
with cte as
	(Select * from Salary
		cross join Income
	union
	Select * from Salary
		cross join Deduction),
	cte2 as
    (select 
	emp_id,
    emp_name,
    income as TRNS_TYPE,
    round((base_salary*percent)/100,0) as Amount
	from cte
	order by emp_id)

select emp_name
	,sum(case when Trns_type = "Basic" then amount else 0 end) Basic
    ,sum(case when Trns_type = "Allowance" then amount else 0 end) Allowance
    ,sum(case when Trns_type = "Others" then amount else 0 end) Others
    ,sum(
		 if(Trns_type = "Basic",amount,0)
		 +if(Trns_type = "Allowance",amount,0)
		 +if(Trns_type = "Others",amount,0)
		 ) Gross
    ,sum(case when Trns_type = "Insurance" then amount else 0 end) Insurance
    ,sum(case when Trns_type = "Health" then amount else 0 end) Health
    ,sum(case when Trns_type = "House" then amount else 0 end) House
    ,sum(
		 if(Trns_type = "Insurance",amount,0)
         +if(Trns_type = "Health",amount,0)
         +if(Trns_type = "House",amount,0)
         ) Total_Deduction
	,(if(Trns_type = "Basic",amount,0)+if(Trns_type = "Allowance",amount,0)+if(Trns_type = "Others",amount,0))
    -(if(Trns_type = "Insurance",amount,0)+if(Trns_type = "Health",amount,0)+if(Trns_type = "House",amount,0)) Net_Pay
from cte2
group by emp_name
order by emp_name;










