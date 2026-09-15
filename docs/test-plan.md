# Payment Database Test Plan

## Objective

Verify that the payment database stores valid information, maintains relationships and rejects invalid data.

## Scope

The project tests:

- Customer records
- Payment records
- Required fields
- Positive payment amounts
- Unique emails
- Unique transaction references
- Customer and payment relationships
- Allowed currencies and payment statuses
- Completed GBP payment totals

## Test Environment

- PostgreSQL 17
- SQL
- macOS
- VS Code

## Test Cases

| ID | Test | Expected Result |
|---|---|---|
| TC-01 | Validate customer count | Four customers exist |
| TC-02 | Validate payment count | Five payments exist |
| TC-03 | Find orphan payments | No orphan payments exist |
| TC-04 | Validate payment amounts | All amounts are positive |
| TC-05 | Find duplicate references | No duplicates exist |
| TC-06 | Validate completed GBP total | Total equals 249.99 |
| NTC-01 | Insert negative amount | Database rejects it |
| NTC-02 | Insert duplicate email | Database rejects it |
| NTC-03 | Insert invalid customer ID | Database rejects it |
| NTC-04 | Insert invalid status | Database rejects it |

## Exit Criteria

Testing is complete when all six validation tests and all four negative tests pass.