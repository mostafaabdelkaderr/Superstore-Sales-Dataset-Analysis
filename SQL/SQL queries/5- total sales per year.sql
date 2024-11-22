SELECT 
    YEAR(order_date) AS order_year,
    ROUND(SUM(o.sales), 2) AS total_sales
FROM 
    order_table o
GROUP BY 
    YEAR(order_date)
ORDER BY 
    order_year;