-- schema.sql
-- Since we might run the import many times we'll drop if exists
DROP DATABASE IF EXISTS dummy_db;

CREATE DATABASE dummy_db;

-- Make sure we're using our `blog` database
\c blog;

-- We can create our user table
CREATE TABLE IF NOT EXISTS DUMMY_TABLE1(
  id SERIAL PRIMARY KEY,
  username VARCHAR,
  email VARCHAR
);

-- We can create our post table
CREATE TABLE IF NOT EXISTS DUMMY_TABLE2(
  id SERIAL PRIMARY KEY,
  userId INTEGER REFERENCES t_user(id),
  title VARCHAR,
  content TEXT,
  image VARCHAR,
  date DATE DEFAULT CURRENT_DATE
);

CREATE USER grafana WITH PASSWORD 'grafana';
GRANT SELECT ON dummy_table1 TO grafana;
GRANT SELECT ON dummy_table2 TO grafana;
