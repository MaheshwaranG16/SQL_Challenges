Select dates, product_id as products from Products
UNION
Select dates,group_concat(product_id) as products from Products
group by customer_id,dates
order by dates, products;
