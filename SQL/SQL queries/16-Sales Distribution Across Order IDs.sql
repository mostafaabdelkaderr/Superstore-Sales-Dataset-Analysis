WITH total_sales_per_order AS (
    SELECT 
        order_id,
        ROUND(SUM(sales), 2) AS total_sales
    FROM 
        order_table
    GROUP BY 
        order_id
)
SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    MIN(total_sales) AS minimum_sale,
    MAX(total_sales) AS maximum_sale,
    ROUND(AVG(total_sales), 2) AS average_sale
FROM 
    total_sales_per_order;