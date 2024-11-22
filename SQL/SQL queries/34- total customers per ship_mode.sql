WITH total_customers AS (
    SELECT COUNT(DISTINCT customer_id) AS total_customer_count
    FROM order_table
)
SELECT 
    o.ship_mode, 
    COUNT(DISTINCT o.customer_id) AS total_customers,
    (tc.total_customer_count - COUNT(DISTINCT o.customer_id)) AS remaining_customers
FROM 
    order_table AS o
CROSS JOIN 
    total_customers AS tc
GROUP BY 
    o.ship_mode, tc.total_customer_count
ORDER BY 
    total_customers DESC;
