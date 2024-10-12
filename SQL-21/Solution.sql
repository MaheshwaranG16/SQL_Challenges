WITH cte AS
    (SELECT name Employee,Salary, departmentId d_id,
        dense_rank() OVER(PARTITION BY departmentId 
                            ORDER BY Salary DESC) rk
                FROM Employee)

SELECT d.name Department, cte.Employee, cte.Salary
    FROM cte JOIN Department d
    ON cte.d_id = d.id
    WHERE cte.rk <= 3