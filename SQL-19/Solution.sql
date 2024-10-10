WITH cte as
    (SELECT id,
        LEAD(id) OVER(ORDER BY id) nxt_id,
        LEAD(id,2) OVER(ORDER BY id) aft
    FROM Stadium
    WHERE people >=100),
cte2 as
    (SELECT * FROM cte
    WHERE nxt_id - id =1  
		AND aft - nxt_id = 1)
        
SELECT s.* FROM Stadium AS s
JOIN (
    SELECT id FROM cte2
    UNION
    SELECT nxt_id FROM cte2
    UNION
    SELECT aft FROM cte2
) AS sub ON s.id = sub.id