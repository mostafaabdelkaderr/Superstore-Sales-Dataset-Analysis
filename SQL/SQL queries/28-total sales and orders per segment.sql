SELECT 
    c.segment,
    ROUND(SUM(o.sales), 2) AS total_sales,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM 
    order_table AS o
LEFT JOIN 
    customer_table AS c ON o.customer_id = c.customer_id
GROUP BY 
    c.segment
ORDER BY 
    total_sales DESC;
