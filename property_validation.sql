-- ============================================================
-- Project : Property Valuation Database Analysis
-- Database: PostgreSQL
-- ============================================================

-- STEP 1: Create the properties table
-- Run in a fresh database/session.

CREATE TABLE properties (
    property_id SERIAL PRIMARY KEY,
    location VARCHAR(100) NOT NULL,
    property_type VARCHAR(50) NOT NULL,
    area_sqft INTEGER NOT NULL CHECK (area_sqft > 0),
    estimated_value NUMERIC(12, 2) NOT NULL
        CHECK (estimated_value >= 0),
    valuation_status VARCHAR(30) NOT NULL
        CHECK (
            valuation_status IN (
                'Pending',
                'In Progress',
                'Completed'
            )
        )
);

-- STEP 2: Insert sample property records
-- Values are illustrative and not verified market valuations.

INSERT INTO properties (
    location,
    property_type,
    area_sqft,
    estimated_value,
    valuation_status
)
VALUES
    ('Rajajinagar',  'Apartment',         1200,  7200000.00, 'Completed'),
    ('Rajajinagar',  'Independent House', 1800, 13500000.00, 'Pending'),
    ('Rajajinagar',  'Villa',             2400, 18000000.00, 'In Progress'),

    ('Malleshwaram', 'Apartment',          950,  5700000.00, 'Completed'),
    ('Malleshwaram', 'Independent House', 1600, 12800000.00, 'Completed'),
    ('Malleshwaram', 'Villa',             2200, 17600000.00, 'Pending'),

    ('Whitefield',   'Apartment',         1500,  9000000.00, 'In Progress'),
    ('Whitefield',   'Independent House', 2000, 14000000.00, 'Pending'),
    ('Whitefield',   'Villa',             3000, 24000000.00, 'Completed'),

    ('Yeshwanthpur', 'Apartment',         1100,  6050000.00, 'Pending'),
    ('Yeshwanthpur', 'Independent House', 1700, 11900000.00, 'In Progress'),
    ('Yeshwanthpur', 'Villa',             2500, 18750000.00, 'Completed'),

    ('Jayanagar',    'Apartment',         1300,  9100000.00, 'Completed'),
    ('Jayanagar',    'Independent House', 2200, 17600000.00, 'Pending'),
    ('Jayanagar',    'Villa',             2800, 22400000.00, 'In Progress');


-- STEP 3: Verify the inserted data
SELECT COUNT(*) AS total_properties
FROM properties;

-- Expected: 15


-- QUERY 1: Display all properties and estimated values
SELECT
    property_id,
    location,
    property_type,
    estimated_value
FROM properties
ORDER BY property_id;


-- QUERY 2: Find properties valued above Rs. 50,00,000
SELECT
    property_id,
    location,
    property_type,
    area_sqft,
    estimated_value,
    valuation_status
FROM properties
WHERE estimated_value > 5000000
ORDER BY estimated_value DESC;


-- QUERY 3: Average estimated value for each property type
SELECT
    property_type,
    ROUND(AVG(estimated_value), 2) AS average_estimated_value
FROM properties
GROUP BY property_type
ORDER BY average_estimated_value DESC;


-- QUERY 4: Count properties in each location
SELECT
    location,
    COUNT(*) AS property_count
FROM properties
GROUP BY location
ORDER BY property_count DESC, location ASC;


-- QUERY 5: Three properties with the highest estimated values
SELECT
    property_id,
    location,
    property_type,
    area_sqft,
    estimated_value
FROM properties
ORDER BY estimated_value DESC, property_id ASC
LIMIT 3;


-- QUERY 6: Find all properties with Pending valuation status
SELECT
    property_id,
    location,
    property_type,
    estimated_value,
    valuation_status
FROM properties
WHERE valuation_status = 'Pending'
ORDER BY property_id;


-- QUERY 7: Average price per square foot for each property type
SELECT
    property_type,
    ROUND(
        AVG(estimated_value / area_sqft),
        2
    ) AS average_price_per_sqft
FROM properties
GROUP BY property_type
ORDER BY average_price_per_sqft DESC;


-- QUERY 8: Total estimated value grouped by valuation status
SELECT
    valuation_status,
    COUNT(*) AS property_count,
    SUM(estimated_value) AS total_estimated_value
FROM properties
GROUP BY valuation_status
ORDER BY total_estimated_value DESC;