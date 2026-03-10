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
