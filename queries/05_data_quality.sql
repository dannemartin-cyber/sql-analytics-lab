-- Check for negative or zero pricing
SELECT *
FROM products
WHERE price <= 0;

-- Check for invalid quantities
SELECT *
FROM order_items
WHERE quantity <= 0;

-- Orders with no items
SELECT o.*
FROM orders o
LEFT JOIN order_items oi
  ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL;

-- Customers with no orders
SELECT c.*
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- Refunded or cancelled orders still contributing item revenue
SELECT
  o.order_id,
  o.status,
  SUM(oi.quantity * oi.unit_price) AS associated_value
FROM orders o
JOIN order_items oi
  ON o.order_id = oi.order_id
WHERE o.status IN ('refunded', 'cancelled')
GROUP BY o.order_id, o.status;
