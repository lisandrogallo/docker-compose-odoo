FROM postgres:13

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    postgresql-contrib \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY unaccent.sql /docker-entrypoint-initdb.d/unaccent.sql