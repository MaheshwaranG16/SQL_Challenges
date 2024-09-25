#Output 1
WITH cte as
	(Select  *
		,LAG(Marks,1,0) OVER(order by Test_id) Prev_marks
	from Student_Performance)
SELECT Test_id, Marks FROM cte
WHERE Marks>Prev_marks;

#Output 2
WITH cte as
	(Select  *
		,LAG(Marks) OVER(order by Test_id) Prev_marks
	from Student_Performance)
SELECT Test_id, Marks FROM cte
WHERE Marks>Prev_marks;