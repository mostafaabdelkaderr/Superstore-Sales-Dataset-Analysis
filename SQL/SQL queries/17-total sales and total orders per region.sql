SELECT  
    o.region,
    ROUND(SUM(o.sales), 2) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    order_table AS o
GROUP BY 
    o.region
ORDER BY 
    total_sales DESC;