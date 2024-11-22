WITH RFM_CTE AS (
    SELECT 
        o.customer_id,
        DATEDIFF(DAY, MAX(o.order_date), (SELECT MAX(order_date) FROM order_table)) AS recency, 
        COUNT(o.order_id) AS frequency,  
        ROUND(SUM(o.sales), 2) AS monetary  
    FROM 
        order_table o
    GROUP BY 
        o.customer_id
)

SELECT 
    r.customer_id,
    r.recency,
    r.frequency,
    r.monetary,
    CASE 
        WHEN r.recency <= 2 THEN '5'  
        WHEN r.recency BETWEEN 2 AND 7 THEN '4'
        WHEN r.recency BETWEEN 7 AND 30 THEN '3'
        WHEN r.recency BETWEEN 30 AND 60 THEN '2'
        ELSE '1'  
    END AS recency_score,
    CASE 
        WHEN r.frequency >= 30 THEN '5'  
        WHEN r.frequency BETWEEN 20 AND 30 THEN '4'
        WHEN r.frequency BETWEEN 10 AND 20 THEN '3'
        WHEN r.frequency BETWEEN 5 AND 10 THEN '2'
        ELSE '1'  
    END AS frequency_score,
    CASE 
        WHEN r.monetary >= 15000 THEN '5'  
        WHEN r.monetary BETWEEN 10000 AND 15000 THEN '4'
        WHEN r.monetary BETWEEN 5000 AND 10000 THEN '3'
        WHEN r.monetary BETWEEN 1000 AND 5000 THEN '2'
        ELSE '1'  
    END AS monetary_score
FROM 
    RFM_CTE r
ORDER BY 
    recency_score DESC, frequency_score DESC, monetary_score DESC;
