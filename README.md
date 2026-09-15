# SQL Payment Database Testing

A PostgreSQL database testing project that validates payment data, business rules and data integrity.

## Project Overview

This project demonstrates how SQL can be used by a QA engineer to verify database records and confirm that invalid data is rejected.

## Test Coverage

- Customer and payment record counts
- Positive payment amounts
- Unique customer emails
- Unique transaction references
- Customer-payment relationships
- Supported currencies
- Supported payment statuses
- Completed payment totals
- Invalid and duplicate data rejection

## Test Results

- Total tests: 10
- Passed: 10
- Failed: 0

See the complete [test plan](docs/test-plan.md) and [test results](docs/test-results.md).

## Technologies

- PostgreSQL 17
- SQL
- Bash
- Git
- GitHub

## Project Structure

```text
sql-payment-database-testing
├── docs
│   ├── test-plan.md
│   └── test-results.md
├── sql
│   ├── 01_schema.sql
│   ├── 02_test_data.sql
│   ├── 03_validation_tests.sql
│   └── 04_negative_tests.sql
├── run-tests.sh
└── README.md