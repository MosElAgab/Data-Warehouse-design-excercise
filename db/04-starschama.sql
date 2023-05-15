-- Facts: model_id, model_name, price_per_event, brand, trait, revenue 
-- Dimensions: area, category, agent, event_date

-- Connect to the "top_model" database
\c top_model

-- Create the "dim_area" table
DROP TABLE IF EXISTS dim_area
;
CREATE TABLE dim_area AS (
    SELECT DISTINCT area FROM models
);
ALTER TABLE dim_area
ADD COLUMN area_id SERIAL PRIMARY KEY;

-- Print the "dim_area" table
\echo '\nhere dim_area table: \n'
SELECT area_id, area FROM dim_area;


-- Create the "dim_category" table
DROP TABLE IF EXISTS dim_category
;
CREATE TABLE dim_category AS (
    SELECT DISTINCT category FROM models
)
;
ALTER TABLE dim_category
ADD COLUMN category_id SERIAL PRIMARY KEY;

-- Print the "dim_category" table
\echo '\nhere dim_categories table:\n'
SELECT category_id, category FROM dim_category;

-- Create the "dim_agent" table
DROP TABLE IF EXISTS dim_agent;
CREATE TABLE dim_agent AS (
    SELECT DISTINCT agent FROM models
);
ALTER TABLE dim_agent
ADD COLUMN agent_id SERIAL PRIMARY KEY;

-- Print the "dim_agent" table
\echo '\nhere dim_categories table:\n'
SELECT agent_id, agent FROM dim_agent
;

-- Create the "dim_event_date" table
DROP TABLE IF EXISTS dim_event_date
;
CREATE TABLE dim_event_date AS (
    SELECT DISTINCT event_date AS event_date_id FROM models
    ORDER BY event_date_id ASC
);
ALTER TABLE dim_event_date
ADD PRIMARY KEY (event_date_id);

-- Add the "year_quarter" column to "dim_event_date" table
ALTER TABLE dim_event_date
ADD COLUMN year_quarter INT
;

-- Update "year_quarter" values based on conditions
UPDATE dim_event_date
SET year_quarter = CASE 
    WHEN CAST(event_date_id AS DATE) < '2022-03-01' THEN 1
    WHEN CAST(event_date_id AS DATE) < '2022-06-01' THEN 2
    WHEN CAST(event_date_id AS DATE) < '2022-09-01' THEN 3
    ELSE 4
    END
;

-- Add the "financial_year" column to "dim_event_date" table
ALTER TABLE dim_event_date
ADD COLUMN financial_year VARCHAR;

-- Update "financial_year" values based on conditions
UPDATE dim_event_date
SET financial_year = CASE 
    WHEN CAST(event_date_id AS DATE) < '2022-06-01' THEN '21/22'
    ELSE '22/23'
    END 
;

-- Print the "dim_event_date" table
\echo '\nhere dim_event_date table:\n'
SELECT * FROM dim_event_date;



-- Create the "fact_models" table
DROP TABLE IF EXISTS fact_models;
CREATE TABLE fact_models AS (
    SELECT * FROM models
);

-- Add the "area_id" column to "fact_models" table
ALTER TABLE fact_models
ADD COLUMN area_id INT;

-- Update "area_id" values based on the "dim_area" table
UPDATE fact_models
SET area_id = dim_area.area_id
FROM dim_area
WHERE fact_models.area = dim_area.area;

-- Drop the "area" column from "fact_models" table
ALTER TABLE fact_models
DROP COLUMN area;

-- Add the foreign key constraint to "area_id" referencing "dim_area"
ALTER TABLE fact_models
ADD FOREIGN KEY (area_id) REFERENCES dim_area(area_id);

-- Add the "category_id" column to "fact_models" table
ALTER TABLE fact_models
ADD COLUMN category_id INT;

-- Update "category_id" values based on the "dim_category" table
UPDATE fact_models
SET category_id = dim_category.category_id
FROM dim_category
WHERE fact_models.category = dim_category.category;

-- Drop the "category" column from "fact_models" table
ALTER TABLE fact_models
DROP COLUMN category;

-- Add the foreign key constraint to "category_id" referencing "dim_category"
ALTER TABLE fact_models
ADD FOREIGN KEY (category_id) REFERENCES dim_category(category_id);

-- Add the "agent_id" column to "fact_models" table
ALTER TABLE fact_models
ADD COLUMN agent_id INT;

-- Update "agent_id" values based on the "dim_agent" table
UPDATE fact_models
SET agent_id = dim_agent.agent_id
FROM dim_agent
WHERE fact_models.agent = dim_agent.agent;

-- Drop the "agent" column from "fact_models" table
ALTER TABLE fact_models
DROP COLUMN agent;

-- Add the foreign key constraint to "agent_id" referencing "dim_agent"
ALTER TABLE fact_models
ADD FOREIGN KEY (agent_id) REFERENCES dim_agent(agent_id);

-- Rename the "event_date" column to "event_date_id" in "fact_models" table
ALTER TABLE fact_models
RENAME COLUMN event_date TO event_date_id;

-- Add the foreign key constraint to "event_date_id" referencing "dim_event_date"
ALTER TABLE fact_models
ADD FOREIGN KEY (event_date_id) REFERENCES dim_event_date(event_date_id);

-- Print the "fact_models" table
\echo '\nhere fact_models table: \n'
SELECT * FROM fact_models;




