WITH sales_trend AS (
    SELECT  
        YEAR(o.order_date) AS order_year,
        p.category,
        ROUND(SUM(o.sales), 2) AS total_sales
    FROM 
        order_table AS o
    LEFT JOIN 
        product_table AS p ON o.product_id = p.product_id
    GROUP BY 
        p.category, YEAR(o.order_date)
)

SELECT 
    order_year,
    category,
    total_sales,
    LAG(total_sales) OVER (PARTITION BY category ORDER BY order_year) AS previous_year_sales,
    ROUND((total_sales - LAG(total_sales) OVER (PARTITION BY category ORDER BY order_year)), 2) AS sales_change
FROM 
    sales_trend
ORDER BY 
    category, order_year;
