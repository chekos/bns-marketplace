---
name: data-engineering
description: |
  Load when working on data pipelines, datasets, reproducibility, or data
  infrastructure topics. Contains best practices for data engineering,
  ETL/ELT patterns, and ensuring reproducible data workflows.
---

# Data Engineering Skill

## Core Philosophy

Data engineering enables reliable, reproducible data workflows. Good data engineering makes data:
- **Accessible**: Easy to find and use
- **Reliable**: Consistent and trustworthy
- **Reproducible**: Same inputs → same outputs
- **Documented**: Clear lineage and meaning

## Reproducibility Fundamentals

### Version Control Everything
```
version-control/
├── code/           # All transformation logic
├── configs/        # Pipeline configurations
├── schemas/        # Data schemas (JSON Schema, Avro, etc.)
├── infra/          # Infrastructure as Code
└── docs/           # Documentation
```

### Pin Dependencies
```toml
# pyproject.toml - Recommended with uv for fast, reproducible installs
[project]
name = "my-pipeline"
requires-python = ">=3.10"
dependencies = [
    "pandas==2.1.4",
    "numpy==1.26.3",
    "dbt-core==1.7.4",
    "sqlalchemy==2.0.25",
]
```

Install with `uv`:
```bash
uv sync  # Fast, deterministic dependency resolution
```

### Containerization
```dockerfile
# Dockerfile - Modern approach with uv
FROM python:3.11-slim

WORKDIR /app

# Install uv for fast dependency installation
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.cargo/bin:${PATH}"

# Install dependencies first (caching layer)
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev

# Copy application
COPY . .

CMD ["uv", "run", "python", "main.py"]
```

### Environment Reproducibility
```yaml
# environment.yml (conda)
name: data-pipeline
channels:
  - conda-forge
dependencies:
  - python=3.11
  - pandas=2.1.4
  - numpy=1.26.3
  - pip:
    - dbt-core==1.7.4
```

## Data Pipeline Patterns

### ETL vs ELT

**ETL (Extract, Transform, Load)**
```
Source → Transform → Target
- Transform before loading
- Good for: legacy systems, limited target compute
- Tools: Apache Airflow, Prefect, custom scripts
```

**ELT (Extract, Load, Transform)**
```
Source → Target → Transform
- Transform in the warehouse
- Good for: modern data warehouses, complex transforms
- Tools: dbt, Fivetran + dbt, Airbyte + dbt
```

### Idempotent Pipelines

Pipelines should produce the same output when run multiple times:

```python
# BAD: Appends every time
def load_data(df, table_name):
    df.to_sql(table_name, engine, if_exists='append')

# GOOD: Replace with date partition
def load_data(df, table_name, date):
    # Delete existing data for this date
    engine.execute(f"DELETE FROM {table_name} WHERE date = '{date}'")
    # Insert new data
    df.to_sql(table_name, engine, if_exists='append')
```

```sql
-- dbt incremental model (idempotent)
{{
  config(
    materialized='incremental',
    unique_key='id'
  )
}}

SELECT * FROM {{ source('raw', 'events') }}
{% if is_incremental() %}
WHERE updated_at > (SELECT MAX(updated_at) FROM {{ this }})
{% endif %}
```

### Error Handling
```python
from typing import Optional
import logging

logger = logging.getLogger(__name__)

def extract_with_retry(
    url: str,
    max_retries: int = 3,
    backoff_factor: float = 2.0
) -> Optional[dict]:
    """Extract data with exponential backoff retry."""
    for attempt in range(max_retries):
        try:
            response = requests.get(url, timeout=30)
            response.raise_for_status()
            return response.json()
        except requests.RequestException as e:
            wait_time = backoff_factor ** attempt
            logger.warning(
                f"Attempt {attempt + 1} failed: {e}. "
                f"Retrying in {wait_time}s..."
            )
            time.sleep(wait_time)

    logger.error(f"All {max_retries} attempts failed for {url}")
    return None
```

## Data Quality

### Schema Validation
```python
from pydantic import BaseModel, field_validator
from datetime import date

class Transaction(BaseModel):
    id: str
    amount: float
    currency: str
    transaction_date: date

    @field_validator('amount')
    @classmethod
    def amount_must_be_positive(cls, v):
        if v <= 0:
            raise ValueError('amount must be positive')
        return v

    @field_validator('currency')
    @classmethod
    def currency_must_be_valid(cls, v):
        valid_currencies = {'USD', 'EUR', 'GBP', 'MXN'}
        if v not in valid_currencies:
            raise ValueError(f'currency must be one of {valid_currencies}')
        return v
```

### Data Tests with Great Expectations
```python
import great_expectations as gx

# Create expectation suite
context = gx.get_context()

validator = context.sources.pandas_default.read_dataframe(df)
validator.expect_column_to_exist("user_id")
validator.expect_column_values_to_not_be_null("user_id")
validator.expect_column_values_to_be_unique("user_id")
validator.expect_column_values_to_be_between("age", min_value=0, max_value=120)
```

### dbt Tests
```yaml
# schema.yml
version: 2

models:
  - name: users
    columns:
      - name: user_id
        tests:
          - unique
          - not_null
      - name: email
        tests:
          - unique
          - not_null
      - name: created_at
        tests:
          - not_null
          - dbt_utils.expression_is_true:
              expression: "created_at <= current_timestamp"
```

## Data Lineage & Documentation

### Column-Level Documentation
```yaml
# dbt schema.yml
models:
  - name: orders
    description: "One row per order placed on the platform"
    columns:
      - name: order_id
        description: "Unique identifier for the order (UUID)"
      - name: customer_id
        description: "Foreign key to customers table"
      - name: order_total
        description: "Total order amount in USD, including tax and shipping"
      - name: order_status
        description: "Current status: pending, processing, shipped, delivered, cancelled"
```

### Data Contracts
```yaml
# data_contract.yml
version: 1.0
name: user_events
owner: data-platform-team
description: User interaction events from the web application

schema:
  type: object
  properties:
    event_id:
      type: string
      format: uuid
    user_id:
      type: string
    event_type:
      type: string
      enum: [page_view, click, purchase, signup]
    timestamp:
      type: string
      format: date-time
  required: [event_id, user_id, event_type, timestamp]

quality:
  - name: freshness
    description: Data should be no older than 1 hour
    check: max_age < 1 hour
  - name: completeness
    description: No null values in required fields
    check: null_rate < 0.001

sla:
  availability: 99.9%
  latency: < 5 minutes
```

## Common Patterns for Tutorials

### Reading Data
```python
import pandas as pd
from pathlib import Path

# From CSV
df = pd.read_csv("data/input.csv")

# From multiple files
files = Path("data/").glob("*.csv")
df = pd.concat([pd.read_csv(f) for f in files], ignore_index=True)

# From SQL
from sqlalchemy import create_engine
engine = create_engine("postgresql://user:pass@localhost/db")
df = pd.read_sql("SELECT * FROM users", engine)

# From API
import requests
response = requests.get("https://api.example.com/data")
df = pd.DataFrame(response.json())
```

### Data Transformation
```python
# Method chaining for clarity
df_clean = (
    df
    .dropna(subset=['required_column'])
    .assign(
        date=lambda x: pd.to_datetime(x['date_string']),
        amount_usd=lambda x: x['amount'] * x['exchange_rate']
    )
    .query('amount_usd > 0')
    .drop(columns=['date_string', 'exchange_rate'])
    .rename(columns={'old_name': 'new_name'})
)
```

### Writing Data
```python
# To CSV (with index handling)
df.to_csv("output/result.csv", index=False)

# To Parquet (preferred for large data)
df.to_parquet("output/result.parquet", index=False)

# To SQL (with chunking for large data)
df.to_sql(
    "table_name",
    engine,
    if_exists='replace',
    index=False,
    chunksize=10000
)
```

## Dataset Best Practices

### Publishing Datasets
```markdown
# Dataset: Sales Transactions 2024

## Overview
Monthly sales transaction data from e-commerce platform.

## Schema
| Column | Type | Description |
|--------|------|-------------|
| transaction_id | string | Unique identifier (UUID) |
| customer_id | string | Customer identifier |
| amount | float | Transaction amount in USD |
| timestamp | datetime | Transaction timestamp (UTC) |

## Data Quality
- Coverage: 2024-01-01 to 2024-12-31
- Completeness: No null values in required fields
- Freshness: Updated daily by 6:00 AM UTC

## Access
```python
import pandas as pd
df = pd.read_parquet("s3://bucket/sales_2024.parquet")
```

## Limitations
- Amounts are rounded to 2 decimal places
- Cancelled transactions are excluded
```

## Tools Reference

| Category | Tools |
|----------|-------|
| Orchestration | Airflow, Prefect, Dagster, Mage |
| Transformation | dbt, SQLMesh, pandas |
| Quality | Great Expectations, dbt tests, Soda |
| Storage | PostgreSQL, BigQuery, Snowflake, DuckDB |
| Format | Parquet, Delta Lake, Iceberg |
| Streaming | Kafka, Flink, Spark Streaming |
