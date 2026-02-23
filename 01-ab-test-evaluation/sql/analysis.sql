CREATE TABLE ab_test_data AS
SELECT *
FROM read_csv_auto('G:/Course_or_project/Girish_portfolio/projects/product-analytics-portfolio/01-ab-test-evaluation/data/ab_test_data.csv');

-- 1. Load Data 
SELECT * FROM ab_test_data Limit 10;

-- 2. Conversion Rate by Group
SELECT "group", AVG(day7_engaged)::decimal(5,4) AS conversion_rate,
    COUNT(*) AS users
FROM ab_test_data
GROUP BY "group";

-- 3. RAndomization Check (Country Distribution)
SELECT "group", country, COUNT(*) AS users
FROM ab_test_data
GROUP BY country, "group"
ORDER BY country, "group";

-- 4. Feature Usage Comparison
SELECT "group", AVG(feature_used)::decimal(5,4) AS feature_usage_rate
FROM ab_test_data
GROUP BY "group";

-- 5.Guardrail Metrics
SELECT "group",
    AVG(error_rate) AS avg_error_rate,
    AVG(page_load_ms) AS avg_page_load
FROM ab_test_data
GROUP BY "group";

-- 6. Session Time Comparison
SELECT "group",
    AVG(avg_session_time) AS avg_session_time
FROM ab_test_data
GROUP BY "group";

-- 7. Conversion rate by country and group
WITH conv AS (
    SELECT 
        country,
        "group",
        AVG(day7_engaged) AS conversion_rate
    FROM ab_test_data
    GROUP BY country, "group"
)
SELECT 
    a.country,
    a.conversion_rate AS conv_A,
    b.conversion_rate AS conv_B,
    (b.conversion_rate - a.conversion_rate) AS absolute_lift,
    (b.conversion_rate - a.conversion_rate) / a.conversion_rate AS relative_lift
FROM conv a
JOIN conv b
    ON a.country = b.country
WHERE a."group" = 'A'
  AND b."group" = 'B'
ORDER BY a.country;






