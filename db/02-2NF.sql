\c top_model

DROP TABLE IF EXISTS brands;

CREATE TABLE brands AS (
    SELECT first_normal_form.model_id, first_normal_form.brand
    FROM first_normal_form
)
;

\echo '\nhere is our new brands table\n'
SELECT * FROM brands
;

DROP TABLE IF EXISTS second_normal_form;

CREATE TABLE second_normal_form AS (
    SELECT DISTINCT model_id, model_name, area, price_per_event, category, agent, trait, rating, event_date, revenue
    FROM first_normal_form
    ORDER BY model_id ASC
)
;

\echo '\nhere second normal form table\n'
SELECT * FROM second_normal_form
;

\echo '\nhere a list for all tables we have created so far in our db'
\dt