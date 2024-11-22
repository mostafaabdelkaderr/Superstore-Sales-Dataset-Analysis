SELECT TOP 10
    c.customer_name,
    ROUND(SUM(o.sales), 2) AS total_sales
FROM 
    order_table AS o
LEFT JOIN 
    customer_table AS c ON o.customer_id = c.customer_id
GROUP BY 
    c.customer_name
ORDER BY 
    total_sales DESC;
