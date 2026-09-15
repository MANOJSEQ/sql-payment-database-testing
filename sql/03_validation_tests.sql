-- TC-01: Confirm that four customers were inserted
SELECT
    'TC-01' AS test_id,
    'Customer count is correct' AS test_name,
    CASE
        WHEN COUNT(*) = 4 THEN 'PASS'
        ELSE 'FAIL'
    END AS result
FROM customers;


-- TC-02: Confirm that five payments were inserted
SELECT
    'TC-02' AS test_id,
    'Payment count is correct' AS test_name,
    CASE
        WHEN COUNT(*) = 5 THEN 'PASS'
        ELSE 'FAIL'
    END AS result
FROM payments;


-- TC-03: Check that every payment belongs to a customer
SELECT
    'TC-03' AS test_id,
    'No orphan payments exist' AS test_name,
    CASE
        WHEN COUNT(*) = 0 THEN 'PASS'
        ELSE 'FAIL'
    END AS result
FROM payments p
LEFT JOIN customers c
    ON p.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- TC-04: Check that all payment amounts are positive
SELECT
    'TC-04' AS test_id,
    'All payment amounts are positive' AS test_name,
    CASE
        WHEN COUNT(*) = 0 THEN 'PASS'
        ELSE 'FAIL'
    END AS result
FROM payments
WHERE amount <= 0;


-- TC-05: Check for duplicate transaction references
SELECT
    'TC-05' AS test_id,
    'Transaction references are unique' AS test_name,
    CASE
        WHEN COUNT(*) = 0 THEN 'PASS'
        ELSE 'FAIL'
    END AS result
FROM (
    SELECT transaction_reference
    FROM payments
    GROUP BY transaction_reference
    HAVING COUNT(*) > 1
) duplicate_references;


-- TC-06: Validate the completed payment total
SELECT
    'TC-06' AS test_id,
    'Completed GBP payment total is correct' AS test_name,
    CASE
        WHEN SUM(amount) = 249.99 THEN 'PASS'
        ELSE 'FAIL'
    END AS result
FROM payments
WHERE payment_status = 'COMPLETED'
  AND currency = 'GBP';