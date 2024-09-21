use PracticeDB;

with cte as
	(
    select *,
		case when Brand1<Brand2 then concat(Brand1,Brand2,Year) 
		else concat(Brand2,Brand1,Year) end as pair_id
		from brands),
cte2 as
	(select *,
	row_number() over(partition by pair_id) as rn
	from cte)
select Brand1, Brand2, Year, Custom1, Custom2, Custom3, Custom4 from cte2
where rn=1 or (Custom1 <> Custom3 and Custom2 <> Custom4);