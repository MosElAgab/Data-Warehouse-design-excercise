\c top_model

DROP TABLE IF EXISTS first_normal_form
;

CREATE TABLE first_normal_form AS
(SELECT models.model_id, models.model_name, models.area, models.price_per_event, models.category, models.agent, UNNEST(STRING_TO_ARRAY(models.brand, ', ')) AS brand, models.trait, models.rating, models.event_date, models.revenue
 FROM models)
;

\echo '\nhere first normal form table\n'
SELECT * FROM first_normal_form;

\echo '\nhere a list for all tables we have created so far in our db'
\dt