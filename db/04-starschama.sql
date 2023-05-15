-- Facts: model_id, model_name, price_per_event, brand, trait, revenue 
-- Dimensions: area, category, agent, event_date
\c top_model

DROP TABLE IF EXISTS dim_area
;
CREATE TABLE dim_area AS (
    SELECT DISTINCT area FROM models
)
;
ALTER TABLE dim_area
ADD COLUMN area_id SERIAL PRIMARY KEY
;
\echo '\nhere dim_area table:\n'
SELECT area_id, area FROM dim_area 
;


DROP TABLE IF EXISTS dim_category
;
CREATE TABLE dim_category AS (
    SELECT DISTINCT category FROM models
)
;
ALTER TABLE dim_category
ADD COLUMN category_id SERIAL PRIMARY KEY
;
\echo '\nhere dim_categories table:\n'
SELECT category_id, category FROM dim_category
;


DROP TABLE IF EXISTS dim_agent
;
CREATE TABLE dim_agent AS (
    SELECT DISTINCT agent FROM models
)
;
ALTER TABLE dim_agent
ADD COLUMN agent_id SERIAL PRIMARY KEY
;
\echo '\nhere dim_categories table:\n'
SELECT agent_id, agent FROM dim_agent
;


DROP TABLE IF EXISTS dim_event_date
;
CREATE TABLE dim_event_date AS (
    SELECT DISTINCT event_date AS event_date_id FROM models
    ORDER BY event_date_id ASC
)
;
ALTER TABLE dim_event_date
ADD PRIMARY KEY (event_date_id)
;

ALTER TABLE dim_event_date
ADD COLUMN year_quarter INT
;
UPDATE dim_event_date
SET year_quarter = CASE 
    WHEN CAST(event_date_id AS DATE) < '2022-03-01' THEN 1
    WHEN CAST(event_date_id AS DATE) < '2022-06-01' THEN 2
    WHEN CAST(event_date_id AS DATE) < '2022-09-01' THEN 3
    ELSE 4
    END 
;

ALTER TABLE dim_event_date
ADD COLUMN financial_year VARCHAR 
;
UPDATE dim_event_date
SET financial_year = CASE 
    WHEN CAST(event_date_id AS DATE) < '2022-06-01' THEN '21/22'
    ELSE '22/23'
    END 
;


\echo '\nhere dim_event_date table:\n'
SELECT * FROM dim_event_date
;
