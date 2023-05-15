\c top_model

-- Create the "brands" table
DROP TABLE IF EXISTS brands
;
CREATE TABLE brands AS (
    SELECT DISTINCT brand
    FROM first_normal_form
);
ALTER TABLE brands
ADD COLUMN brand_id SERIAL PRIMARY KEY ;

-- Print the "brands" table
\echo '\nhere is our new brands table\n'
SELECT * FROM brands
;

-- Create the "models_brands" table
DROP TABLE IF EXISTS models_brands
;
CREATE TABLE models_brands AS (
    SELECT first_normal_form.model_id, brands.brand_id
    FROM first_normal_form
    JOIN brands ON first_normal_form.brand = brands.brand
);
ALTER TABLE models_brands
ADD COLUMN model_brand_id SERIAL PRIMARY KEY 
;

-- Print the "models_brands" table
\echo '\nhere models_brands \n'
SELECT * FROM models_brands
;

-- Create the "second_normal_form" table
DROP TABLE IF EXISTS second_normal_form;
CREATE TABLE second_normal_form AS (
    SELECT DISTINCT model_id, model_name, area, price_per_event, category, agent, trait, rating, event_date, revenue
    FROM first_normal_form
    ORDER BY model_id ASC
)
;

-- Print the "second_normal_form" table
\echo '\nhere second normal form table\n'
SELECT * FROM second_normal_form
;

-- Print a list of all tables created in the database
\echo '\nhere a list for all tables we have created so far in our db'
\dt
