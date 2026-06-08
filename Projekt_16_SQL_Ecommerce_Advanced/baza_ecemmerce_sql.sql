DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    status VARCHAR(30)
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT
);

INSERT INTO customers (first_name, last_name, city, email) VALUES
('Jan', 'Kowalski', 'Warszawa', 'jan@example.com'),
('Anna', 'Nowak', 'Kraków', 'anna@example.com'),
('Piotr', 'Wiśniewski', 'Gdańsk', 'piotr@example.com'),
('Marta', 'Zielińska', 'Wrocław', 'marta@example.com'),
('Tomasz', 'Lewandowski', 'Poznań', 'tomasz@example.com'),
('Karolina', 'Wójcik', 'Warszawa', 'karolina@example.com'),
('Michał', 'Kamiński', 'Kraków', 'michal@example.com'),
('Natalia', 'Dąbrowska', 'Gdańsk', 'natalia@example.com');

INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Elektronika', 4500),
('Telefon', 'Elektronika', 3200),
('Monitor', 'Elektronika', 1200),
('Klawiatura', 'Akcesoria', 250),
('Myszka', 'Akcesoria', 120),
('Biurko', 'Meble', 900),
('Krzesło', 'Meble', 700),
('Słuchawki', 'Akcesoria', 500);

INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2026-06-01', 'Zrealizowane'),
(2, '2026-06-02', 'Zrealizowane'),
(3, '2026-06-03', 'Anulowane'),
(1, '2026-06-04', 'Zrealizowane'),
(4, '2026-06-05', 'Zrealizowane'),
(5, '2026-06-06', 'W trakcie'),
(6, '2026-06-07', 'Zrealizowane'),
(7, '2026-06-08', 'Zrealizowane'),
(8, '2026-06-09', 'Zrealizowane'),
(2, '2026-06-10', 'Zrealizowane');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 4, 1),
(2, 2, 1),
(2, 5, 2),
(3, 3, 1),
(4, 6, 1),
(4, 7, 2),
(5, 1, 1),
(6, 8, 2),
(7, 2, 1),
(7, 4, 2),
(8, 3, 2),
(9, 5, 3),
(9, 8, 1),
(10, 1, 1),
(10, 2, 1); 