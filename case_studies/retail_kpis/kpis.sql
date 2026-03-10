-- Monthly revenue KPI
SELECT
  DATE_TRUNC('month', o.order_date) AS revenue_month,
  SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM orders o
JOIN order_items oi
  ON o.order_id = oi.order_id
WHERE o.status = 'paid'
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY revenue_month;

-- Top customers KPI
SELECT
  c.customer_id,
  c.country,
  SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
JOIN order_items oi
  ON o.order_id = oi.order_id
WHERE o.status = 'paid'
GROUP BY c.customer_id, c.country
ORDER BY total_revenue DESC;

-- Product performance KPI
SELECT
  p.product_name,
  p.category,
  SUM(oi.quantity) AS units_sold,
  SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi
  ON p.product_id = oi.product_id
JOIN orders o
  ON oi.order_id = o.order_id
WHERE o.status = 'paid'
GROUP BY p.product_name, p.category
ORDER BY revenue DESC;
