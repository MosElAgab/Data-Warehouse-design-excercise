\c top_model

\echo '\nhere a list for all tables we have created so far in our db'
\dt

\echo '\nSection 1: OLTP\n'

\echo '\nhere models table\n'

SELECT * FROM models
;

\echo '\nhere first normal form table\n'
SELECT * FROM first_normal_form
;

\echo '\nhere is our new brands table\n'
SELECT * FROM brands
;

\echo '\nhere models_brands \n'
SELECT * FROM models_brands
;

\echo '\nhere second normal form table\n'
SELECT * FROM second_normal_form
;

\echo '\nhere categories table'
SELECT * FROM categories
;

\echo '\nhere is third normal form table\n'

SELECT * FROM third_normal_form
;

\echo '\nSection 2: OLAP\n'

\echo '\nhere dim_area table:\n'
SELECT area_id, area FROM dim_area 
;

\echo '\nhere dim_category table:\n'
SELECT category_id, category FROM dim_category
;

\echo '\nhere dim_agent table:\n'
SELECT agent_id, agent FROM dim_agent
;

\echo '\nhere dim_event_date table:\n'
SELECT * FROM dim_event_date
;
