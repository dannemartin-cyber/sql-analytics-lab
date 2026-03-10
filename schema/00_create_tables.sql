DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  customer_id   BIGINT PRIMARY KEY,
  created_at    DATE NOT NULL,
  country       TEXT NOT NULL
);

CREATE TABLE products (
  product_id    BIGINT PRIMARY KEY,
  category      TEXT NOT NULL,
  product_name  TEXT NOT NULL,
  price         NUMERIC(10,2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE orders (
  order_id      BIGINT PRIMARY KEY,
  customer_id   BIGINT NOT NULL REFERENCES customers(customer_id),
  order_date    DATE NOT NULL,
  status        TEXT NOT NULL CHECK (status IN ('paid','refunded','cancelled'))
);

CREATE TABLE order_items (
  order_id      BIGINT NOT NULL REFERENCES orders(order_id),
  product_id    BIGINT NOT NULL REFERENCES products(product_id),
  quantity      INT NOT NULL CHECK (quantity > 0),
  unit_price    NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
  PRIMARY KEY (order_id, product_id)
);
