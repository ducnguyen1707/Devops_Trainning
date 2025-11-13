#!/bin/bash
set -e

if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

echo "Waiting for pg_master ($PG_MASTER_HOST:$PG_MASTER_PORT)..."
until nc -z "$PG_MASTER_HOST" "$PG_MASTER_PORT"; do
  sleep 2
done
echo "Master is up. Starting base backup..."

if [ -z "$(ls -A /var/lib/postgresql/data)" ]; then
  echo "Data directory empty, running base backup..."
  pg_basebackup -h "$PG_MASTER_HOST" -D /var/lib/postgresql/data -U "$PGUSER" -v -P --wal-method=stream
else
  echo "Data already exists, skipping base backup."
fi

# Tạo file standby.signal để bật chế độ replica
touch /var/lib/postgresql/data/standby.signal

# Cấu hình kết nối đến master trong postgresql.auto.conf
echo "primary_conninfo = 'host=$PG_MASTER_HOST port=$PG_MASTER_PORT user=$PGUSER password=$PGPASSWORD'" >> /var/lib/postgresql/data/postgresql.auto.conf

chown -R postgres:postgres /var/lib/postgresql/data

echo "Starting pg_standby"
exec docker-entrypoint.sh postgres