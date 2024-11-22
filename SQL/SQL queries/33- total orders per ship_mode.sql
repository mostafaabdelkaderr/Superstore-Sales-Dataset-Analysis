SELECT 
    ship_mode,
    COUNT(DISTINCT order_id) AS total_orders 
FROM 
    order_table
GROUP BY 
    ship_mode
ORDER BY 
    total_orders DESC;
