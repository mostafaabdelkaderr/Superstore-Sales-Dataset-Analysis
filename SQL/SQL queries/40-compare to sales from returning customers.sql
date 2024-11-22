WITH CustomerOrders AS (
    SELECT 
        o.customer_id,
        COUNT(o.order_id) AS order_count,
        ROUND(SUM(o.sales), 2) AS total_sales
    FROM 
        order_table o
    GROUP BY 
        o.customer_id
),
NewCustomers AS (
    SELECT 
        customer_id,
        total_sales
    FROM 
        CustomerOrders
    WHERE 
        order_count = 1  
),
ReturningCustomers AS (
    SELECT 
        customer_id,
        total_sales
    FROM 
        CustomerOrders
    WHERE 
        order_count > 1  
)

SELECT 
    (SELECT COUNT(*) FROM NewCustomers) AS new_customer_count,
    (SELECT SUM(total_sales) FROM NewCustomers) AS new_customer_sales,
    (SELECT COUNT(*) FROM ReturningCustomers) AS returning_customer_count,
    (SELECT SUM(total_sales) FROM ReturningCustomers) AS returning_customer_sales;
