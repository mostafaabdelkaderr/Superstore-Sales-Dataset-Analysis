WITH x AS (
    SELECT customer_id,
           COUNT(DISTINCT ship_mode) AS no_of_ship_mode
    FROM order_table
    GROUP BY customer_id
),
y AS (
    SELECT customer_id
    FROM x
    WHERE no_of_ship_mode = 1
)
SELECT o.ship_mode,
       COUNT(DISTINCT o.customer_id) AS nu_o_cus
FROM order_table AS o
where o.customer_id in (select customer_id from y )
GROUP BY o.ship_mode;