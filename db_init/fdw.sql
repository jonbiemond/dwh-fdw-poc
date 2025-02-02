CREATE EXTENSION IF NOT EXISTS postgres_fdw;

CREATE SERVER app FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host 'application_db', port '5432', dbname 'appdb');
CREATE USER MAPPING FOR postgres SERVER app OPTIONS (USER 'postgres', password 'postgres');
CREATE SCHEMA app;
IMPORT FOREIGN SCHEMA public FROM SERVER app INTO app;
