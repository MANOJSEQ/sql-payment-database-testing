INSERT INTO customers (full_name, email)
VALUES
    ('Aisha Khan', 'aisha.khan@example.com'),
    ('Daniel Jones', 'daniel.jones@example.com'),
    ('Priya Patel', 'priya.patel@example.com'),
    ('Liam Smith', 'liam.smith@example.com');

INSERT INTO payments (
    customer_id,
    amount,
    currency,
    payment_status,
    transaction_reference
)
VALUES
    (1, 49.99, 'GBP', 'COMPLETED', 'TXN-1001'),
    (1, 15.50, 'GBP', 'REFUNDED',  'TXN-1002'),
    (2, 120.00, 'EUR', 'PENDING',  'TXN-1003'),
    (3, 75.25, 'USD', 'FAILED',    'TXN-1004'),
    (4, 200.00, 'GBP', 'COMPLETED','TXN-1005');