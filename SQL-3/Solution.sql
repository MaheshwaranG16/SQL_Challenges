#Solution_1
with cte as
	(select   *
			,sum(case when job_role is not null then 1 else 0 end)
			over(order by row_id) flag
	from missing_value)
SELECT row_id
		,first_value(job_role) over(partition by flag order by flag) job_role,
        Skills
 from cte;
 
 #Solution_2
 with recursive cte as
	(select * from missing_value
	 WHERE row_id=1
     Union
     select mv.row_id, coalesce(mv.job_role,cte.job_role),mv.skills
     from missing_value mv join cte 
     on mv.row_id=cte.row_id+1)
select * from cte;