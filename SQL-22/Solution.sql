WITH CTE AS 
	(SELECT *
	, dates - ROW_NUMBER() OVER(PARTITION BY employee, status ORDER BY dates) AS grp
	FROM emp_attendance)
SELECT employee, MIN(dates) AS from_date 
, MAX(dates) AS end_date, status
FROM CTE
GROUP BY employee, grp, status
ORDER BY employee, from_date