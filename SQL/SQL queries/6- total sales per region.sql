SELECT  
    o.region,
    ROUND(SUM(o.sales), 2) AS total_sales
FROM 
    order_table AS o
GROUP BY 
    o.region
ORDER BY 
    total_sales DESC;