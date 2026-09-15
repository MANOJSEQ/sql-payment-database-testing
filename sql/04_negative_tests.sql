-- NTC-01: Reject a negative payment amount
DO $$
BEGIN
    BEGIN
        INSERT INTO payments (
            customer_id,
            amount,
            currency,
            payment_status,
            transaction_reference
        )
        VALUES (1, -10.00, 'GBP', 'COMPLETED', 'NEG-1001');

        RAISE EXCEPTION 'NTC-01 FAIL: Negative amount was accepted';
    EXCEPTION
        WHEN check_violation THEN
            RAISE NOTICE 'NTC-01 PASS: Negative amount was rejected';
    END;
END $$;


-- NTC-02: Reject a duplicate customer email
DO $$
BEGIN
    BEGIN
        INSERT INTO customers (full_name, email)
        VALUES ('Duplicate Customer', 'aisha.khan@example.com');

        RAISE EXCEPTION 'NTC-02 FAIL: Duplicate email was accepted';
    EXCEPTION
        WHEN unique_violation THEN
            RAISE NOTICE 'NTC-02 PASS: Duplicate email was rejected';
    END;
END $$;


-- NTC-03: Reject a payment for a customer who does not exist
DO $$
BEGIN
    BEGIN
        INSERT INTO payments (
            customer_id,
            amount,
            currency,
            payment_status,
            transaction_reference
        )
        VALUES (999, 25.00, 'GBP', 'PENDING', 'NEG-1003');

        RAISE EXCEPTION 'NTC-03 FAIL: Invalid customer was accepted';
    EXCEPTION
        WHEN foreign_key_violation THEN
            RAISE NOTICE 'NTC-03 PASS: Invalid customer was rejected';
    END;
END $$;


-- NTC-04: Reject an unsupported payment status
DO $$
BEGIN
    BEGIN
        INSERT INTO payments (
            customer_id,
            amount,
            currency,
            payment_status,
            transaction_reference
        )
        VALUES (1, 30.00, 'GBP', 'CANCELLED', 'NEG-1004');

        RAISE EXCEPTION 'NTC-04 FAIL: Invalid status was accepted';
    EXCEPTION
        WHEN check_violation THEN
            RAISE NOTICE 'NTC-04 PASS: Invalid status was rejected';
    END;
END $$;