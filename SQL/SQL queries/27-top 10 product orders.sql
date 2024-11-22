SELECT TOP 10
    p.product_name,
    COUNT(DISTINCT o.order_id) AS number_of_orders
FROM 
    order_table AS o
LEFT JOIN 
    product_table AS p ON o.product_id = p.product_id
GROUP BY 
    p.product_name 
ORDER BY  
    number_of_orders DESC;