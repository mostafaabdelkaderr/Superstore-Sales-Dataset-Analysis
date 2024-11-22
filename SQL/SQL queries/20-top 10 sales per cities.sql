SELECT TOP 10
    o.city,
    ROUND(SUM(o.sales), 2) AS total_sales
FROM 
    order_table AS o
GROUP BY 
    o.city
ORDER BY 
    total_sales DESC;