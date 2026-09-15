#!/bin/bash

set -e

DATABASE_NAME="${DATABASE_NAME:-payment_testing}"
DATABASE_PORT="${DATABASE_PORT:-5433}"

echo "Creating database tables..."
psql -p "$DATABASE_PORT" -d "$DATABASE_NAME" -f sql/01_schema.sql

echo "Loading test data..."
psql -p "$DATABASE_PORT" -d "$DATABASE_NAME" -f sql/02_test_data.sql

echo "Running validation tests..."
psql -p "$DATABASE_PORT" -d "$DATABASE_NAME" -f sql/03_validation_tests.sql

echo "Running negative tests..."
psql -p "$DATABASE_PORT" -d "$DATABASE_NAME" -f sql/04_negative_tests.sql

echo "All database tests completed."