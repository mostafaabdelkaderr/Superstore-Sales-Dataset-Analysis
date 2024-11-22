SELECT  
    p.sub_category,
    ROUND(SUM(o.sales), 2) AS total_sales
FROM 
    order_table AS o
LEFT JOIN 
    product_table AS p ON o.product_id = p.product_id
GROUP BY 
    p.sub_category 
ORDER BY  
    total_sales DESC;
