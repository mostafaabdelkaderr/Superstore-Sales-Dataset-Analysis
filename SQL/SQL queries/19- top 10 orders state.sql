SELECT TOP 10
    o.state,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    order_table AS o
GROUP BY 
    o.state
ORDER BY 
    total_orders DESC;