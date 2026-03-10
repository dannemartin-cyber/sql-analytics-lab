INSERT INTO customers (customer_id, created_at, country) VALUES
(1, '2025-01-05', 'USA'),
(2, '2025-01-15', 'USA'),
(3, '2025-02-01', 'Canada'),
(4, '2025-02-10', 'USA'),
(5, '2025-03-01', 'UK');

INSERT INTO products (product_id, category, product_name, price) VALUES
(101, 'Electronics', 'Wireless Mouse', 25.00),
(102, 'Electronics', 'Mechanical Keyboard', 80.00),
(103, 'Office', 'Notebook Pack', 15.00),
(104, 'Office', 'Desk Lamp', 40.00),
(105, 'Accessories', 'Laptop Stand', 35.00);

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(1001, 1, '2025-03-01', 'paid'),
(1002, 2, '2025-03-02', 'paid'),
(1003, 1, '2025-03-15', 'paid'),
(1004, 3, '2025-04-01', 'refunded'),
(1005, 4, '2025-04-05', 'paid'),
(1006, 5, '2025-04-10', 'cancelled'),
(1007, 2, '2025-05-01', 'paid'),
(1008, 3, '2025-05-03', 'paid');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1001, 101, 2, 25.00),
(1001, 103, 1, 15.00),
(1002, 102, 1, 80.00),
(1003, 105, 1, 35.00),
(1004, 104, 1, 40.00),
(1005, 103, 3, 15.00),
(1005, 104, 1, 40.00),
(1007, 101, 1, 25.00),
(1007, 105, 2, 35.00),
(1008, 102, 1, 80.00);
