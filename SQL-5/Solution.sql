with cte as
    (Select *,
	case when substring(day_indicator,weekday(dates)+1,1)="1"
		 then 1 else 0 end flag
	from Relevant_date)
SELECT product_id, day_indicator, dates
FROM cte
WHERE flag = 1;