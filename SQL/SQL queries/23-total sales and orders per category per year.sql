SELECT  
    p.category,
    YEAR(o.order_date) AS order_year,
    ROUND(SUM(o.sales), 2) AS total_sales,
    COUNT(DISTINCT o.order_id) AS number_of_orders
FROM 
    order_table AS o
LEFT JOIN 
    product_table AS p ON o.product_id = p.product_id
GROUP BY 
    p.category, YEAR(o.order_date)
ORDER BY 
    p.category;
