SELECT TOP 10
    p.product_name,
    ROUND(SUM(o.sales), 2) AS total_sales
FROM 
    order_table AS o
LEFT JOIN 
    product_table AS p ON o.product_id = p.product_id
GROUP BY 
    p.product_name 
ORDER BY  
    total_sales DESC;
