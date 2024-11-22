SELECT  
    p.sub_category,
    COUNT(DISTINCT o.order_id) AS number_of_orders
FROM 
    order_table AS o
LEFT JOIN 
    product_table AS p ON o.product_id = p.product_id
GROUP BY 
    p.sub_category 
ORDER BY  
    number_of_orders DESC;
