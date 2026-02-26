-- SQL Queries  for Data Extraction

CREATE TABLE ab_test_data AS
SELECT *
FROM read_csv_auto('G:/Course_or_project/Girish_portfolio/projects/product-analytics-portfolio/02-funnel-analysis/data/funnel_data.csv');


-- 1. Funnel Events Extraction

SELECT 
    user_id,
    device_added_ts,
    device_configured_ts,
    alert_viewed_ts,
    alert_resolved_ts
FROM user_events;


-- 2. Funnel Step Flags (1/0)
-- Converts timestamps into binary funnel steps.

SELECT
    user_id,
    CASE WHEN device_added_ts IS NOT NULL THEN 1 ELSE 0 END AS device_added,
    CASE WHEN device_configured_ts IS NOT NULL THEN 1 ELSE 0 END AS device_configured,
    CASE WHEN alert_viewed_ts IS NOT NULL THEN 1 ELSE 0 END AS alert_viewed,
    CASE WHEN alert_resolved_ts IS NOT NULL THEN 1 ELSE 0 END AS alert_resolved
FROM user_events;

-- 3. Time‑to‑Convert (Device Added → Configured)

SELECT
    user_id,
    TIMESTAMPDIFF(HOUR, device_added_ts, device_configured_ts) AS t_add_to_config
FROM user_events
WHERE device_added_ts IS NOT NULL
  AND device_configured_ts IS NOT NULL;

-- 4. Country Segmentation Query
SELECT
    u.user_id,
    u.country,
    CASE WHEN device_added_ts IS NOT NULL THEN 1 ELSE 0 END AS device_added,
    CASE WHEN device_configured_ts IS NOT NULL THEN 1 ELSE 0 END AS device_configured,
    CASE WHEN alert_viewed_ts IS NOT NULL THEN 1 ELSE 0 END AS alert_viewed,
    CASE WHEN alert_resolved_ts IS NOT NULL THEN 1 ELSE 0 END AS alert_resolved
FROM user_events u;

-- 5. Cohort Extraction (Signup Month)
SELECT
    user_id,
    DATE_TRUNC('month', signup_ts) AS signup_month,
    device_added_ts,
    device_configured_ts,
    alert_viewed_ts,
    alert_resolved_ts
FROM user_events;

-- 6. Plan Type Segmentation
SELECT
    u.user_id,
    u.plan_type,
    CASE WHEN device_added_ts IS NOT NULL THEN 1 ELSE 0 END AS device_added,
    CASE WHEN device_configured_ts IS NOT NULL THEN 1 ELSE 0 END AS device_configured,
    CASE WHEN alert_viewed_ts IS NOT NULL THEN 1 ELSE 0 END AS alert_viewed,
    CASE WHEN alert_resolved_ts IS NOT NULL THEN 1 ELSE 0 END AS alert_resolved
FROM user_events u
JOIN user_plans p
    ON u.user_id = p.user_id;

-- 7. Path Analysis Query
SELECT
    user_id,
    CONCAT(
        CASE WHEN device_added_ts IS NOT NULL THEN '1' ELSE '0' END, '>',
        CASE WHEN device_configured_ts IS NOT NULL THEN '1' ELSE '0' END, '>',
        CASE WHEN alert_viewed_ts IS NOT NULL THEN '1' ELSE '0' END, '>',
        CASE WHEN alert_resolved_ts IS NOT NULL THEN '1' ELSE '0' END
    ) AS path
FROM user_events;
