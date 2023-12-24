#!/bin/sh

set -e

echo "run db migration"
source /app/app.env
/app/migrate -path /app/migration -database "$DB_SOURCE" -verbose up

echo "start the app"
exec "$@"

ssh -i "aws.pem" ec2-user@ec2-34-226-209-98.compute-1.amazonaws.com
