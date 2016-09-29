#!/bin/bash

set -e

cmd="$@"
host="db"
dbname="subrosa"
user="subrosa_user"
password="secret"

until psql "host=$host dbname=$dbname user=$user password=$password" -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

pushd "/code/subrosa"

./create_db

exec $cmd
