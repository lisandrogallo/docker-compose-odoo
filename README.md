# Odoo Docker Compose Stack

## Usage

### Create `.env` file with environment variables

```text
ODOO_USER=odoo
ODOO_PASS=odoo
TRAEFIK_DEFAULT_DOMAIN=example.com
PG_SHARED_BUFFERS=768MB
PG_MAINTENANCE_WORK_MEM=400MB
PG_WAL_BUFFERS=8MB
PG_EFFECTIVE_CACHE_SIZE=4GB
PG_WORK_MEM=32MB
PG_MAX_CONNECTIONS=200
PG_DEFAULT_TEXT_SEARCH_CONFIG=pg_catalog.spanish
TZ=America/Argentina/Buenos_Aires
PGTZ=GMT-3
WORKERS=4
```

### Run Docker Compose stack

#### Production

```bash
sudo docker-compose build --no-cache
sudo docker-compose up -d
```

#### Development

```bash
sudo docker-compose build --no-cache
sudo docker-compose -f develop.yml up
```
