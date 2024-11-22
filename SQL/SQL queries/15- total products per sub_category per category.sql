SELECT 
    category,
    sub_category,
    COUNT(product_id) AS total_products
FROM 
    product_table
GROUP BY 
    category, sub_category
ORDER BY 
    total_products DESC;