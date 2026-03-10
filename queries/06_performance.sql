-- Performance-minded reporting query
SELECT
  c.customer_id,
  c.country,
  DATE_TRUNC('month', o.order_date) AS revenue_month,
  SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
JOIN order_items oi
  ON o.order_id = oi.order_id
WHERE o.status = 'paid'
GROUP BY
  c.customer_id,
  c.country,
  DATE_TRUNC('month', o.order_date)
ORDER BY revenue_month, monthly_revenue DESC;

-- Example EXPLAIN statement for PostgreSQL users
EXPLAIN
SELECT
  p.category,
  SUM(oi.quantity * oi.unit_price) AS category_revenue
FROM products p
JOIN order_items oi
  ON p.product_id = oi.product_id
JOIN orders o
  ON oi.order_id = o.order_id
WHERE o.status = 'paid'
GROUP BY p.category
ORDER BY category_revenue DESC;
