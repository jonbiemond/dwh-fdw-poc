CREATE TABLE IF NOT EXISTS sales (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    total_price NUMERIC(10,2) NOT NULL CHECK (total_price > 0),
    sold_at TIMESTAMP NOT NULL
);

-- Insert 1,000,000 rows with random data
INSERT INTO sales (customer_id, product_id, quantity, total_price, sold_at)
SELECT
    FLOOR(RANDOM() * 10000 + 1)::INT AS customer_id,
    FLOOR(RANDOM() * 500 + 1)::INT AS product_id,
    FLOOR(RANDOM() * 10 + 1)::INT AS quantity,
    ROUND((RANDOM() * 500 + 10)::NUMERIC, 2) AS total_price,
    NOW() - (RANDOM() * INTERVAL '2 years') AS sold_at
FROM generate_series(1, 1000000);
