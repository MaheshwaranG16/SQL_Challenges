with cte as
(select id,
        lag(num) over(order by id) as b,
        num,
        lead(num) over(order by id) as a
        from Logs)
select distinct num ConsecutiveNums from cte
where num=a and num=b