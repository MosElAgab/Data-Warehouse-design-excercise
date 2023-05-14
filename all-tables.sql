\c top_model

\echo '\nhere a list for all tables we have created so far in our db'
\dt

\echo '\nhere models table\n'

SELECT * FROM models
;

\echo '\nhere first normal form table\n'
SELECT * FROM first_normal_form
;

\echo '\nhere is our new brands table\n'
SELECT * FROM brands
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