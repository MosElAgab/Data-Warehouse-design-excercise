\c top_model

-- Create the "first_normal_form" table
DROP TABLE IF EXISTS first_normal_form
;

CREATE TABLE first_normal_form AS
(
    SELECT models.model_id, models.model_name, models.area, models.price_per_event, models.category, models.agent, UNNEST(STRING_TO_ARRAY(models.brand, ', ')) AS brand, models.trait, models.rating, models.event_date, models.revenue
    FROM models
 );

-- Print the "first_normal_form" table
\echo '\nhere first normal form table\n'
SELECT * FROM first_normal_form;

-- Print a list of all tables created in the database
\echo '\nhere a list for all tables we have created so far in our db'
\dt

