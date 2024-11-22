SELECT  
    p.category,
    ROUND(SUM(o.sales), 2) AS total_sales,
    COUNT(DISTINCT o.order_id) AS number_of_orders
FROM 
    order_table AS o
LEFT JOIN 
    product_table AS p ON o.product_id = p.product_id
GROUP BY 
    p.category 
ORDER BY  
    total_sales DESC;
