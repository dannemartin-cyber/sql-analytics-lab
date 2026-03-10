-- Multi-step CTE example: paid order totals
WITH paid_orders AS (
  SELECT
    order_id,
    customer_id,
    order_date
  FROM orders
  WHERE status = 'paid'
),
order_totals AS (
  SELECT
    po.order_id,
    po.customer_id,
    po.order_date,
    SUM(oi.quantity * oi.unit_price) AS order_total
  FROM paid_orders po
  JOIN order_items oi
    ON po.order_id = oi.order_id
  GROUP BY po.order_id, po.customer_id, po.order_date
)
SELECT
  customer_id,
  COUNT(*) AS paid_order_count,
  SUM(order_total) AS lifetime_value
FROM order_totals
GROUP BY customer_id
ORDER BY lifetime_value DESC;
