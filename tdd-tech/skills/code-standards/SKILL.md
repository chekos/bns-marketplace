---
name: code-standards
description: |
  Load when reviewing code, writing code examples, or ensuring code quality.
  Contains coding standards for Python, JavaScript, SQL, and general best
  practices for publication-quality code.
---

# Code Standards Skill

## Core Philosophy

Code in tutorials and publications must be:
- **Correct**: Runs without errors
- **Clear**: Easy to understand
- **Complete**: Self-contained or with clear dependencies
- **Current**: Uses modern patterns and best practices

## Python Standards

### Style Guide (PEP 8 + Modern Python)
```python
# Imports: standard, third-party, local (separated by blank lines)
import os
from pathlib import Path

import pandas as pd
import numpy as np

from mypackage import utils

# Type hints (Python 3.10+)
def process_data(df: pd.DataFrame, threshold: float = 0.5) -> dict[str, float]:
    """Process DataFrame and return metrics."""
    pass

# f-strings over .format() or %
name = "pandas"
version = "2.0"
message = f"Using {name} version {version}"

# Walrus operator where it improves readability
if (n := len(data)) > 10:
    print(f"Processing {n} items")

# Match statements (Python 3.10+)
match status_code:
    case 200:
        return "OK"
    case 404:
        return "Not Found"
    case _:
        return "Unknown"
```

### Naming Conventions
```python
# Variables and functions: snake_case
user_count = 0
def calculate_average():
    pass

# Classes: PascalCase
class DataProcessor:
    pass

# Constants: UPPER_SNAKE_CASE
MAX_RETRIES = 3
DEFAULT_TIMEOUT = 30

# Private: leading underscore
_internal_cache = {}
def _helper_function():
    pass

# "Protected" (by convention): single underscore
class Base:
    def _protected_method(self):
        pass
```

### Docstrings (Google Style)
```python
def fetch_data(
    url: str,
    timeout: int = 30,
    retries: int = 3
) -> pd.DataFrame:
    """Fetch data from URL and return as DataFrame.

    Downloads JSON data from the specified URL with automatic
    retry logic for transient failures.

    Args:
        url: The API endpoint to fetch data from.
        timeout: Request timeout in seconds.
        retries: Number of retry attempts on failure.

    Returns:
        DataFrame containing the parsed JSON data with columns
        ['id', 'name', 'value', 'timestamp'].

    Raises:
        requests.HTTPError: If the request fails after all retries.
        ValueError: If the response cannot be parsed as JSON.

    Example:
        >>> df = fetch_data("https://api.example.com/data")
        >>> df.head()
           id   name  value           timestamp
        0   1  alpha   10.5 2024-01-01 00:00:00
    """
```

### Modern Python Patterns
```python
# Context managers for resource handling
with open("file.txt") as f:
    content = f.read()

# List comprehensions (keep simple)
squares = [x**2 for x in range(10)]

# Generator expressions for large datasets
sum_of_squares = sum(x**2 for x in range(1000000))

# dataclasses for data containers
from dataclasses import dataclass

@dataclass
class Config:
    model_name: str
    learning_rate: float = 0.001
    epochs: int = 10

# Pathlib over os.path
from pathlib import Path
data_dir = Path("data")
file_path = data_dir / "processed" / "output.csv"
```

### Common Anti-Patterns to Avoid
```python
# BAD: Mutable default arguments
def append_to(element, target=[]):  # Don't do this!
    target.append(element)
    return target

# GOOD: Use None and create inside
def append_to(element, target=None):
    if target is None:
        target = []
    target.append(element)
    return target

# BAD: Bare except
try:
    risky_operation()
except:  # Catches everything including KeyboardInterrupt
    pass

# GOOD: Specific exceptions
try:
    risky_operation()
except ValueError as e:
    logger.error(f"Invalid value: {e}")
except IOError as e:
    logger.error(f"IO error: {e}")

# BAD: Using type() for type checking
if type(x) == list:
    pass

# GOOD: Using isinstance
if isinstance(x, list):
    pass
```

## JavaScript/TypeScript Standards

### Modern ES6+ Patterns
```javascript
// Arrow functions for callbacks
const doubled = numbers.map(n => n * 2);

// Destructuring
const { name, age } = user;
const [first, ...rest] = items;

// Template literals
const message = `Hello, ${name}! You are ${age} years old.`;

// Async/await over .then()
async function fetchData(url) {
  try {
    const response = await fetch(url);
    return await response.json();
  } catch (error) {
    console.error('Fetch failed:', error);
    throw error;
  }
}

// Optional chaining and nullish coalescing
const city = user?.address?.city ?? 'Unknown';
```

### TypeScript Preferences
```typescript
// Explicit types for function parameters and returns
function processData(input: string[]): Map<string, number> {
  const result = new Map<string, number>();
  // ...
  return result;
}

// Interfaces for object shapes
interface DataPoint {
  x: number;
  y: number;
  label?: string;
}

// Use const assertions for literal types
const COLORS = ['red', 'green', 'blue'] as const;
type Color = typeof COLORS[number];
```

## SQL Standards

### Formatting
```sql
-- Keywords in UPPERCASE
-- Identifiers in snake_case
-- One clause per line for readability

SELECT
    user_id,
    user_name,
    created_at,
    COUNT(*) AS order_count
FROM users u
INNER JOIN orders o
    ON u.user_id = o.user_id
WHERE u.created_at >= '2024-01-01'
    AND o.status = 'completed'
GROUP BY
    user_id,
    user_name,
    created_at
HAVING COUNT(*) > 5
ORDER BY order_count DESC
LIMIT 100;
```

### Best Practices
- Use explicit JOINs (not comma-separated FROM)
- Alias tables for readability
- Qualify column names in JOINs
- Use CTEs for complex queries
- Comment complex logic

## Code Review Checklist

### Correctness
- [ ] Code runs without errors
- [ ] Logic is correct
- [ ] Edge cases handled
- [ ] Error handling appropriate

### Clarity
- [ ] Variable names are descriptive
- [ ] Functions have single responsibility
- [ ] Comments explain "why" not "what"
- [ ] Complex logic is broken down

### Style
- [ ] Consistent formatting
- [ ] Follows language conventions
- [ ] No unused imports/variables
- [ ] Appropriate line length (<88 for Python)

### Security
- [ ] No hardcoded secrets
- [ ] Input validation present
- [ ] SQL injection prevented (parameterized queries)
- [ ] XSS prevented (sanitized output)

### Performance
- [ ] No obvious inefficiencies
- [ ] Appropriate data structures
- [ ] Database queries optimized
- [ ] Memory usage reasonable

## Tools & Linting

### Python
```bash
# Formatting
black .
isort .

# Linting
ruff check .
mypy .

# Pre-commit config
pre-commit install
```

### JavaScript/TypeScript
```bash
# Formatting
prettier --write .

# Linting
eslint .

# Type checking
tsc --noEmit
```

## Version Compatibility

When writing tutorials, specify versions:
```toml
# pyproject.toml (recommended with uv)
dependencies = [
    "pandas>=2.0.0,<3.0.0",
    "numpy>=1.24.0",
    "scikit-learn>=1.3.0",
]
```

Install with:
```bash
uv sync  # Fast, deterministic installs
```

Always test code with specified versions.
