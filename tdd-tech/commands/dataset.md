---
description: Find or recommend datasets for a specific topic or tutorial
---

When /dataset is used with the following topic or requirements:

$ARGUMENTS

Research and recommend appropriate datasets following this process:

## 1. Understand Requirements

Analyze the request to determine:
- **Purpose**: Tutorial, practice, project, or publication
- **Domain**: What area (finance, health, social, etc.)
- **Size needed**: Quick demo vs. substantial practice
- **Complexity**: Simple schema vs. complex relationships
- **Special requirements**: Time series, geographic, text, images, etc.

## 2. Search for Datasets

Look for datasets in these sources:
- Kaggle
- UCI Machine Learning Repository
- Government open data (data.gov, datos.gob.mx)
- Academic datasets
- Our own tacosdedatos datasets
- API sources (if real-time data appropriate)

## 3. Evaluate Options

For each potential dataset, assess:
- **Accessibility**: Easy to download? API available?
- **License**: Can we use it in tutorials?
- **Quality**: Clean enough for educational use?
- **Size**: Appropriate for the purpose?
- **Documentation**: Schema and context available?
- **Relevance**: Fits the topic well?

## 4. Generate Recommendations

```markdown
# Dataset Recommendations: [Topic]

## Purpose
[What the dataset will be used for]

## Recommended Datasets

### Option 1: [Dataset Name] ⭐ Top Pick

**Source**: [URL]
**License**: [License type]
**Size**: [Rows x Columns, file size]
**Format**: CSV / Parquet / JSON / API

**Description**:
[What this dataset contains]

**Schema**:
| Column | Type | Description |
|--------|------|-------------|
| col1 | type | description |
| col2 | type | description |

**Why this works**:
- [Reason 1]
- [Reason 2]
- [Reason 3]

**Potential issues**:
- [Issue 1 and mitigation]
- [Issue 2 and mitigation]

**Quick start**:
```python
import pandas as pd
url = "[direct download URL]"
df = pd.read_csv(url)
df.head()
```

---

### Option 2: [Dataset Name]

[Same structure as above]

---

### Option 3: [Dataset Name]

[Same structure as above]

## Comparison

| Aspect | Option 1 | Option 2 | Option 3 |
|--------|----------|----------|----------|
| Size | | | |
| Complexity | | | |
| Learning value | | | |
| Accessibility | | | |
| Spanish relevance | | | |

## Recommendation

For [stated purpose], I recommend **[Option X]** because:
1. [Primary reason]
2. [Secondary reason]
3. [Additional benefit]

## Alternative: Create Synthetic Data

If none of these fit perfectly, we can create a custom dataset:

```python
import pandas as pd
import numpy as np
from faker import Faker

fake = Faker('es_MX')
np.random.seed(42)

# [Sample generation code for this topic]
df = pd.DataFrame({
    # ...
})
```

## Notes

- **Data cleaning needed**: [Yes/No, what kind]
- **Preprocessing for tutorial**: [Suggestions]
- **Related datasets**: [Links to complementary data]
```

## 5. Special Considerations for tacosdedatos

- Prefer datasets relevant to Latin American/Spanish-speaking contexts when possible
- Consider whether data examples make sense culturally
- Check that any personally identifiable information is properly anonymized
- Ensure the dataset license allows use in commercial publication
