#!/bin/sh
SECRET_ENCRYPTION_KEY=$(jq -r '.secret_encryption_key' /data/options.json)

export SECRET_ENCRYPTION_KEY
echo "Genereated key is: $SECRET_ENCRYPTION_KEY"

exec /app/entrypoint.sh "$@"