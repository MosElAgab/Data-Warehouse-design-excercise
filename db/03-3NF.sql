\c top_model

DROP TABLE IF EXISTS categories
;
CREATE TABLE categories AS (
SELECT DISTINCT category, agent, area
FROM
second_normal_form
)
;
ALTER TABLE categories
ADD COLUMN category_id SERIAL PRIMARY KEY
;

\echo '\nhere categories table'
SELECT * FROM categories
;

DROP TABLE IF EXISTS third_normal_form
;

CREATE TABLE third_normal_form AS (
    SELECT second_normal_form.model_id, second_normal_form.model_name, categories.category_id, second_normal_form.price_per_event, second_normal_form.trait, second_normal_form.rating, second_normal_form.event_date, second_normal_form.revenue
    FROM second_normal_form
    JOIN categories ON second_normal_form.category = categories.category
    ORDER BY model_id ASC
)
;

\echo '\nhere is third normal form table\n'

SELECT * FROM third_normal_form
;