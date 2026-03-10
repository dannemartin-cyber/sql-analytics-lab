-- Rank customers by total paid revenue
WITH customer_revenue AS (
  SELECT
    c.customer_id,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
  FROM customers c
  JOIN orders o
    ON c.customer_id = o.customer_id
  JOIN order_items oi
    ON o.order_id = oi.order_id
  WHERE o.status = 'paid'
  GROUP BY c.customer_id
)
SELECT
  customer_id,
  total_revenue,
  RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM customer_revenue
ORDER BY revenue_rank;

-- Running monthly revenue
WITH monthly_revenue AS (
  SELECT
    DATE_TRUNC('month', o.order_date) AS revenue_month,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue
  FROM orders o
  JOIN order_items oi
    ON o.order_id = oi.order_id
  WHERE o.status = 'paid'
  GROUP BY DATE_TRUNC('month', o.order_date)
)
SELECT
  revenue_month,
  monthly_revenue,
  SUM(monthly_revenue) OVER (ORDER BY revenue_month) AS running_revenue
FROM monthly_revenue
ORDER BY revenue_month;

-- Cohort retention example
WITH first_paid AS (
  SELECT
    customer_id,
    DATE_TRUNC('month', MIN(order_date)) AS cohort_month
  FROM orders
  WHERE status = 'paid'
  GROUP BY customer_id
),
activity AS (
  SELECT
    o.customer_id,
    fp.cohort_month,
    DATE_TRUNC('month', o.order_date) AS activity_month
  FROM orders o
  JOIN first_paid fp
    ON o.customer_id = fp.customer_id
  WHERE o.status = 'paid'
),
cohort_retention AS (
  SELECT
    cohort_month,
    activity_month,
    COUNT(DISTINCT customer_id) AS active_customers
  FROM activity
  GROUP BY cohort_month, activity_month
)
SELECT
  cohort_month,
  activity_month,
  active_customers,
  active_customers::numeric
    / NULLIF(
        FIRST_VALUE(active_customers) OVER (
          PARTITION BY cohort_month
          ORDER BY activity_month
        ),
        0
      ) AS retention_rate
FROM cohort_retention
ORDER BY cohort_month, activity_month;
