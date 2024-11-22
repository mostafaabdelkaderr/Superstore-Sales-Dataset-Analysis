WITH CoPurchased AS (
    SELECT 
        o1.order_id,
        p1.category AS category_1,
        p1.sub_category AS sub_category_1,
        p2.category AS category_2,
        p2.sub_category AS sub_category_2
    FROM 
        order_table o1
    JOIN 
        product_table p1 ON o1.product_id = p1.product_id
    JOIN 
        order_table o2 ON o1.order_id = o2.order_id
    JOIN 
        product_table p2 ON o2.product_id = p2.product_id
    WHERE 
        p1.product_id <> p2.product_id  
)

SELECT 
    category_1,
    sub_category_1,
    category_2,
    sub_category_2,
    COUNT(*) AS purchase_count
FROM 
    CoPurchased
GROUP BY 
    category_1, sub_category_1, category_2, sub_category_2
ORDER BY 
    purchase_count DESC;
