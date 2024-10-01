WITH cte as
    (SELECT c1.*, c2.visited_on v2
        FROM Customer c1 CROSS JOIN customer c2
        WHERE DATEDIFF(c2.visited_on,c1.visited_on)<=6
        AND DATEDIFF(c2.visited_on,c1.visited_on)>=0
        GROUP BY c1.customer_id,c1.visited_on,v2)
SELECT  v2 visited_on, 
        sum(amount) amount, 
        round(sum(amount)/7,2) average_amount 
FROM cte
GROUP BY v2 HAVING COUNT(DISTINCT cte.visited_on)=7