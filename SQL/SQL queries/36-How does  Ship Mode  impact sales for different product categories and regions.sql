SELECT 
    o.ship_mode,
    p.category,
    o.region,
    ROUND(SUM(o.sales), 2) AS total_sales
FROM 
    order_table o
JOIN 
    product_table p ON o.product_id = p.product_id
JOIN 
    customer_table c ON o.customer_id = c.customer_id
GROUP BY 
    o.ship_mode, p.category, o.region
ORDER BY 
    o.ship_mode, p.category, o.region;
