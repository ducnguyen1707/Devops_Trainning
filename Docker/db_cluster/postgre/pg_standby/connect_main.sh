#!/bin/bash
set -e

echo "[REPLICA] Starting replica setup..."

MASTER_HOST=${MASTER_HOST:-postgres-master}
REPLICATION_USER=${REPLICATION_USER:-replicator}
REPLICATION_PASSWORD=${REPLICATION_PASSWORD:-replica_pass}
PGDATA=${PGDATA:-/var/lib/postgresql/data}

# -----------------------------------------------------------------------------
# 1. Wait until master accepts connections
# -----------------------------------------------------------------------------
echo "[REPLICA] Waiting for master at $MASTER_HOST:5432 ..."
until pg_isready -h "$MASTER_HOST" -p 5432 -U "$REPLICATION_USER"; do
    sleep 2
done
echo "[REPLICA] Master is reachable."

# -----------------------------------------------------------------------------
# 2. If PGDATA is empty → do pg_basebackup
# -----------------------------------------------------------------------------
if [ ! -s "$PGDATA/PG_VERSION" ]; then
    echo "[REPLICA] PGDATA is empty. Performing pg_basebackup..."

    rm -rf "$PGDATA"/*
    chmod 700 "$PGDATA"

    PGPASSWORD="$REPLICATION_PASSWORD" pg_basebackup \
        -h "$MASTER_HOST" \
        -U "$REPLICATION_USER" \
        -D "$PGDATA" \
        -Fp -Xs -P -R

    echo "[REPLICA] Base backup complete."
else
    echo "[REPLICA] Existing PGDATA detected → skipping pg_basebackup."
fi

# -----------------------------------------------------------------------------
# 3. Ensure standby mode
# -----------------------------------------------------------------------------

# Force create standby.signal if missing
if [ ! -f "$PGDATA/standby.signal" ]; then
    echo "[REPLICA] Creating standby.signal ..."
    touch "$PGDATA/standby.signal"
fi

# Add primary_conninfo if missing
if ! grep -q "primary_conninfo" "$PGDATA/postgresql.auto.conf"; then
    echo "[REPLICA] Setting primary_conninfo ..."
    echo "primary_conninfo = 'host=$MASTER_HOST user=$REPLICATION_USER password=$REPLICATION_PASSWORD'" \
        >> "$PGDATA/postgresql.auto.conf"
fi

echo "[REPLICA] Starting PostgreSQL in standby mode..."
exec docker-entrypoint.sh postgres
