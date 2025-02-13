# Postgres Foreign Data Wrapper POC
A proof-of-conept using a foreign data wrapper to query a source database from a data warehouse.

## Usage
1. Standup the app database and data warehouse from the [`docker-compose.yml`](./docker-compose.yml) file:
```bash
docker compose up
```

2. Connect to the datawarehouse database:
```bash
psql -h localhost -U postgres -d dwh -p 5433
```
The password is "postgres" when prompted.

3. Execute a query against `app.sales` to test the connection:
```SQL
SELECT * FROM app.sales LIMIT 10;
```

> [!WARNING]
> Changes to the database and any data is not persisted.
> When the container is taken down you will lose any data in the database!

## Transform
A dbt project is configured in [`/transform`](./transform).
Install the dependencies with `uv`:
```bash
uv sync
```

Run the following command to build the models:
```bash
dbt build --project-dir transform --profiles-dir transform
```

## Resources
* Official `postgres_fdw` docs: https://www.postgresql.org/docs/current/postgres-fdw.html
* Detailed `postgres_fdw` tutorial: https://www.percona.com/blog/foreign-data-wrappers-in-postgresql-databases-postgres_fdw-dblink/
* Discussion on dbt and FDW: https://github.com/dbt-labs/dbt-core/issues/2182
* FDW performance tuning: https://www.crunchydata.com/blog/performance-tips-for-postgres-fdw

