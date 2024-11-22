SELECT 
    o.ship_mode,
    AVG(DATEDIFF(DAY, o.order_date, o.ship_date)) AS average_waiting_time
FROM 
    order_table o
WHERE 
    o.ship_mode IN ('First Class', 'Same Day', 'Second Class', 'Standard Class')
GROUP BY 
    o.ship_mode
ORDER BY 
    average_waiting_time ASC;
