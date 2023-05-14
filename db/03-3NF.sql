\c top_model

DROP TABLE IF EXISTS categories
;
CREATE TABLE categories AS (
SELECT DISTINCT category, agent, area
FROM
second_normal_form
)
;

\echo '\nhere categories table'
SELECT * FROM categories
;

DROP TABLE IF EXISTS third_normal_form
;

CREATE TABLE third_normal_form AS (
    SELECT model_id, model_name, category, price_per_event, trait, rating, event_date, revenue
    FROM second_normal_form
    ORDER BY model_id ASC
)
;

\echo '\nhere is third normal form table\n'

SELECT * FROM third_normal_form
;