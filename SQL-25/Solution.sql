(SELECT u.name results FROM Users u 
    JOIN MovieRating mr
    ON u.user_id = mr.user_id
    GROUP BY mr.user_id
    ORDER BY COUNT(mr.movie_id) DESC, u.name 
    LIMIT 1)
UNION ALL
(SELECT m.title results FROM Movies m
    JOIN MovieRating mr
    ON m.movie_id = mr.movie_id
    WHERE YEAR(mr.created_at)=2020 AND
    MONTH(mr.created_at)=2
    GROUP BY mr.movie_id
    ORDER BY AVG(mr.rating) DESC, m.title 
    LIMIT 1)