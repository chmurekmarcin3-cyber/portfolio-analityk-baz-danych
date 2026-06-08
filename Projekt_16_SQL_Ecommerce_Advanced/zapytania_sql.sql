-- Zapytanie 1
SELECT * FROM products;

-- Zapytanie 2
SELECT *
FROM products
WHERE category = 'Elektronika';

-- Zapytanie 3
SELECT *
FROM products
ORDER BY price DESC;

-- Zapytanie 4
SELECT category,
       COUNT(*) AS liczba_produktow
FROM products
GROUP BY category;

-- Zapytanie 5
SELECT category,
       COUNT(*) AS liczba_produktow
FROM products
GROUP BY category
HAVING COUNT(*) > 2;

-- Zapytanie 6
SELECT o.order_id,
       c.first_name,
       c.last_name,
       o.order_date
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- Zapytanie 7
SELECT c.first_name,
       c.last_name,
       o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- Zapytanie 8
SELECT c.first_name,
       p.product_name,
       oi.quantity,
       o.order_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id;

-- Zapytanie 9
SELECT product_name,
       price,
       CASE
           WHEN price >= 3000 THEN 'Premium'
           WHEN price >= 1000 THEN 'Standard'
           ELSE 'Budżet'
       END AS segment
FROM products;

-- Zapytanie 10
SELECT
CASE
    WHEN price >= 3000 THEN 'Premium'
    WHEN price >= 1000 THEN 'Standard'
    ELSE 'Budżet'
END AS segment,
COUNT(*) AS liczba
FROM products
GROUP BY segment;

-- Zapytanie 11
WITH revenue AS (
    SELECT p.product_name,
           SUM(p.price * oi.quantity) AS revenue
    FROM products p
    JOIN order_items oi
      ON p.product_id = oi.product_id
    GROUP BY p.product_name
)
SELECT *
FROM revenue
ORDER BY revenue DESC;

-- Zapytanie 12
SELECT product_name,
       price,
       ROW_NUMBER() OVER(ORDER BY price DESC) AS row_num
FROM products;

-- Zapytanie 13
SELECT product_name,
       price,
       RANK() OVER(ORDER BY price DESC) AS ranking
FROM products;

-- Zapytanie 14
SELECT product_name,
       price,
       SUM(price) OVER(ORDER BY price DESC) AS running_total
FROM products;

-- Zapytanie 15
SELECT product_name,
       price,
       AVG(price) OVER() AS avg_price
FROM products;

-- Zapytanie 16
SELECT c.first_name,
       c.last_name,
       SUM(p.price * oi.quantity) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.first_name, c.last_name
ORDER BY revenue DESC;

-- Zapytanie 17
SELECT p.product_name,
       SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;

-- Zapytanie 18
SELECT p.category,
       SUM(p.price * oi.quantity) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Zapytanie 19
SELECT o.order_date,
       SUM(p.price * oi.quantity) AS daily_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_date
ORDER BY o.order_date;

-- Zapytanie 20
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;