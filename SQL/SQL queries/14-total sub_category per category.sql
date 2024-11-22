SELECT 
    category,
    COUNT(DISTINCT sub_category) AS total_sub_category
FROM 
    product_table
GROUP BY 
    category
ORDER BY 
    total_sub_category DESC;