--Unify table view 
CREATE OR REPLACE VIEW `rfm-analysis-493219.RFM_Sales2025.all_sales2025` AS

-- 2025_01 (5 columns → add 3 NULLs)
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  ProductType,
  OrderValue,
  NULL AS string_field_5,
  NULL AS string_field_6,
  NULL AS string_field_7
FROM `rfm-analysis-493219.RFM_Sales2025.2025_01`

UNION ALL

-- 2025_02
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  ProductType,
  OrderValue,
  NULL AS string_field_5,
  NULL AS string_field_6,
  NULL AS string_field_7
FROM `rfm-analysis-493219.RFM_Sales2025.2025_02`

UNION ALL

-- 2025_03
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  ProductType,
  OrderValue,
  NULL AS string_field_5,
  NULL AS string_field_6,
  NULL AS string_field_7
FROM `rfm-analysis-493219.RFM_Sales2025.2025_03`

UNION ALL

-- 2025_04
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  ProductType,
  OrderValue,
  NULL AS string_field_5,
  NULL AS string_field_6,
  NULL AS string_field_7
FROM `rfm-analysis-493219.RFM_Sales2025.2025_04`

UNION ALL

-- 2025_05
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  ProductType,
  OrderValue,
  NULL AS string_field_5,
  NULL AS string_field_6,
  NULL AS string_field_7
FROM `rfm-analysis-493219.RFM_Sales2025.2025_05`

UNION ALL

-- 2025_06
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  ProductType,
  OrderValue,
  NULL AS string_field_5,
  NULL AS string_field_6,
  NULL AS string_field_7
FROM `rfm-analysis-493219.RFM_Sales2025.2025_06`

UNION ALL

-- 2025_07
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  ProductType,
  OrderValue,
  NULL AS string_field_5,
  NULL AS string_field_6,
  NULL AS string_field_7
FROM `rfm-analysis-493219.RFM_Sales2025.2025_07`

UNION ALL

-- 2025_08
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  ProductType,
  OrderValue,
  NULL AS string_field_5,
  NULL AS string_field_6,
  NULL AS string_field_7
FROM `rfm-analysis-493219.RFM_Sales2025.2025_08`

UNION ALL

-- 2025_09
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  ProductType,
  OrderValue,
  NULL AS string_field_5,
  NULL AS string_field_6,
  NULL AS string_field_7
FROM `rfm-analysis-493219.RFM_Sales2025.2025_09`

UNION ALL

-- 2025_10
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  ProductType,
  OrderValue,
  NULL AS string_field_5,
  NULL AS string_field_6,
  NULL AS string_field_7
FROM `rfm-analysis-493219.RFM_Sales2025.2025_10`

UNION ALL

-- 2025_11
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  ProductType,
  OrderValue,
  NULL AS string_field_5,
  NULL AS string_field_6,
  NULL AS string_field_7
FROM `rfm-analysis-493219.RFM_Sales2025.2025_11`

UNION ALL

-- 2025_12 (already has all 8 columns)
SELECT
  OrderID,
  CustomerID,
  OrderDate,
  ProductType,
  OrderValue,
  string_field_5,
  string_field_6,
  string_field_7
FROM `rfm-analysis-493219.RFM_Sales2025.2025_12`;

--create a view rfm_metrics
CREATE OR REPLACE VIEW `rfm-analysis-493219.RFM_Sales2025.rfm_metrics` AS
WITH current_date AS (
  SELECT DATE('2026-04-04') AS analysis_date
),
rfm AS (
  SELECT
    CustomerID,
    MAX(OrderDate) AS last_order_date,
    DATE_DIFF(
      (SELECT analysis_date FROM current_date),
      MAX(OrderDate),
      DAY
    ) AS recency,
    COUNT(*) AS frequency,
    SUM(OrderValue) AS monetary
  FROM `rfm-analysis-493219.RFM_Sales2025.all_sales2025`
  GROUP BY CustomerID
)
SELECT *
FROM rfm;


-- 3. Add ranking scores for R, F, M

CREATE OR REPLACE VIEW `rfm-analysis-493219.RFM_Sales2025.rfm_metrics` AS
WITH current_date AS (
  SELECT DATE('2026-04-04') AS analysis_date
),
rfm AS (
  SELECT
    CustomerID,
    MAX(OrderDate) AS last_order_date,
    DATE_DIFF(
      (SELECT analysis_date FROM current_date),
      MAX(OrderDate),
      DAY
    ) AS recency,
    COUNT(*) AS frequency,
    SUM(OrderValue) AS monetary
  FROM `rfm-analysis-493219.RFM_Sales2025.all_sales2025`
  GROUP BY CustomerID
)
SELECT
  *
FROM rfm;

--create a scoring table

CREATE OR REPLACE TABLE `rfm-analysis-493219.RFM_Sales2025.rfm_scores` AS
SELECT 
  *,
  NTILE(10) OVER (ORDER BY recency ASC) AS r_score,
  NTILE(10) OVER (ORDER BY frequency DESC) AS f_score,
  NTILE(10) OVER (ORDER BY monetary DESC) AS m_score
FROM `rfm-analysis-493219.RFM_Sales2025.rfm_metrics`;

--Assigning deciles

CREATE OR REPLACE VIEW `rfm-analysis-493219.RFM_Sales2025.rfm_total_scores` AS 
SELECT 
  CustomerID,
  recency,
  frequency,
  monetary,
  r_score,
  f_score,
  m_score,
  (r_score + f_score + m_score) AS rfm_total_score
FROM `rfm-analysis-493219.RFM_Sales2025.rfm_scores`;

-- total scores

-- Step 5: Review total scores (optional preview)
SELECT *
FROM `rfm-analysis-493219.RFM_Sales2025.rfm_total_scores`
ORDER BY rfm_total_score DESC;

-- Step 5: Create BI-ready RFM segments table
CREATE OR REPLACE TABLE `rfm-analysis-493219.RFM_Sales2025.rfm_segments_final` AS
SELECT
  CustomerID,
  recency,
  frequency,
  monetary,
  r_score,
  f_score,
  m_score,
  rfm_total_score,
  CASE
    WHEN rfm_total_score >= 28 THEN 'Champions'          -- 28–30
    WHEN rfm_total_score >= 24 THEN 'VIP'                -- 24–27
    WHEN rfm_total_score >= 20 THEN 'Potentially VIP'    -- 20–23
    WHEN rfm_total_score >= 16 THEN 'Promising'          -- 16–19
    WHEN rfm_total_score >= 12 THEN 'Engaged'            -- 12–15
    WHEN rfm_total_score >= 8  THEN 'Requires Attention' -- 8–11
    WHEN rfm_total_score >= 4  THEN 'At Risk'            -- 4–7
    ELSE 'Lost/Inactive'                                 -- 0–3
  END AS rfm_segment
FROM `rfm-analysis-493219.RFM_Sales2025.rfm_total_scores`
ORDER BY rfm_total_score DESC;

-- Segment breakdown
SELECT 
  rfm_segment,
  COUNT(*) AS customer_count
FROM `rfm-analysis-493219.RFM_Sales2025.rfm_segments_final`
GROUP BY rfm_segment
ORDER BY customer_count DESC;