-- View all customers
SELECT *
FROM customers;

-- View all products
SELECT *
FROM products;

-- View all paid orders
SELECT *
FROM orders
WHERE status = 'paid';

-- Revenue by line item
SELECT
  order_id,
  product_id,
  quantity,
  unit_price,
  quantity * unit_price AS line_revenue
FROM order_items;

-- Total revenue from paid orders only
SELECT
  SUM(oi.quantity * oi.unit_price) AS total_paid_revenue
FROM orders o
JOIN order_items oi
  ON o.order_id = oi.order_id
WHERE o.status = 'paid';
