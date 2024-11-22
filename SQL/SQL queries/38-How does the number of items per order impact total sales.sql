WITH OrderItems AS (
    SELECT 
        order_id,
        COUNT(product_id) AS number_of_items,
        SUM(sales) AS total_sales
    FROM 
        order_table
    GROUP BY 
        order_id
)

SELECT 
    number_of_items,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(total_sales), 2) AS total_sales_amount,
    ROUND(AVG(total_sales), 2) AS average_sales_per_order
FROM 
    OrderItems
GROUP BY 
    number_of_items
ORDER BY 
    number_of_items;
