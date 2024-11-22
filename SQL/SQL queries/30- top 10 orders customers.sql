SELECT TOP 10
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM 
    order_table AS o
LEFT JOIN 
    customer_table AS c ON o.customer_id = c.customer_id
GROUP BY 
    c.customer_name
ORDER BY 
    total_orders DESC;
