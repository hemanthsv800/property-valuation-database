# Property Valuation Database Analysis

## Overview

This project implements a property valuation database using PostgreSQL. It stores property records and analyzes estimated values, property types, locations, price per square foot, and valuation status.

## Objectives

- Create a structured property database.
- Insert representative property records.
- Analyze property values by property type.
- Count properties by location.
- Identify the three highest-valued properties.
- Filter properties by valuation status.
- Calculate average price per square foot.
- Summarize estimated values by valuation status.

## Database Schema

**Table:** `properties`

| Column | Data Type | Description |
|---|---|---|
| `property_id` | SERIAL PRIMARY KEY | Unique property identifier |
| `location` | VARCHAR(100) | Property location |
| `property_type` | VARCHAR(50) | Type of property |
| `area_sqft` | INTEGER | Property area in square feet |
| `estimated_value` | NUMERIC(12,2) | Estimated property value |
| `valuation_status` | VARCHAR(30) | Current valuation status |

## Data Quality

The table uses a primary key and constraints to prevent missing required values, non-positive property areas, negative valuations, and unsupported valuation statuses.

The dataset contains 15 illustrative property records across five Bengaluru locations. It includes apartments, independent houses, and villas.

**Note:** All property records and values are illustrative sample data, not verified market valuations.

## SQL Analysis

1. Display all properties and estimated values.
2. Find properties valued above ₹50,00,000.
3. Calculate average estimated value by property type.
4. Count properties by location.
5. Retrieve the three highest-valued properties.
6. Find properties with Pending valuation status.
7. Calculate average price per square foot by property type.
8. Calculate total estimated value by valuation status.

## How to Execute

1. Open a PostgreSQL-compatible SQL editor.
2. Use a fresh database or session.
3. Execute `property_valuation.sql`.
4. Verify that 15 property records are inserted.
5. Execute the analysis queries and inspect their results.
6. Capture screenshots of the actual query outputs.

If rerunning the script, use a fresh session or remove the existing table before recreating it.

## Technologies

- PostgreSQL
- SQL

## Project Structure

```text
property-valuation-database/
├── property_valuation.sql
├── README.md
└── screenshots
```

## Conclusion

This project demonstrates relational table design, data validation, filtering, sorting, grouping, and aggregate functions for property valuation analysis.
