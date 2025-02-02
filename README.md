# Postgres Foreign Data Wrapper POC
A proof-of-conept using a foreign data wrapper to query a source database from a data warehouse.

## Usage
1. Standup the app database and data warehouse from the `docker-compose.yml` file:
```bash
docker compose up
```

2. Connect to the datawarehouse database:
```bash
psql -h localhost -U postgres -d dwh -p 5433
```
The password is "postgres" when prompted.

3. Execute a query against `app__public.sales` to test the connection:
```SQL
SELECT * FROM app__public.sales LIMIT 10;
```
