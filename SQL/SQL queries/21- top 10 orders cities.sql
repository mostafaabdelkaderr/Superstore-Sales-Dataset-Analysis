SELECT TOP 10
    o.city,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    order_table AS o
GROUP BY 
    o.city
ORDER BY 
    total_orders DESC;