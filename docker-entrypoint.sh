#!/bin/bash

set -e

cmd="$@"

echo "CMD:  $cmd"

pushd "/code/subrosa"

./create_db

exec $cmd
