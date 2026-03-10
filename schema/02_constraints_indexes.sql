CREATE INDEX IF NOT EXISTS idx_orders_customer_date
ON orders(customer_id, order_date);

CREATE INDEX IF NOT EXISTS idx_orders_status
ON orders(status);

CREATE INDEX IF NOT EXISTS idx_order_items_product
ON order_items(product_id);

CREATE INDEX IF NOT EXISTS idx_products_category
ON products(category);
