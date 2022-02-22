
#! /bin/sh

set -e
set -o pipefail

if [ -z "$MINIO_ACCESSKEY" ]; then
    echo "You need to set the MINIO_ACCESSKEY environment variable."
    exit 1
fi

if [ -z "$MINIO_SECRETKEY" ]; then
    echo "You need to set the MINIO_SECRETKEY environment variable."
    exit 1
fi

if [ -z "$MINIO_HOST" ]; then
    echo "You need to set the MINIO_HOST environment variable."
    exit 1
fi

if [ -z "$MINIO_BUCKET" ]; then
    echo "You need to set the MINIO_BUCKET environment variable."
    exit 1
fi

if [ -z "$TYPEDB_DATABASE" ]; then
  echo "You need to set the TYPEDB_DATABASE environment variable."
  exit 1
fi

echo "Creating export of ${TYPEDB_DATABASE} database."

typedb server export --database=$TYPEDB_DATABASE --file=export.typedb

echo "Creating MinIO alias ..."
mc alias set minio_alias $MINIO_HOST $MINIO_ACCESSKEY $MINIO_SECRETKEY

echo "Uploading export.typedb to $MINIO_BUCKET ..."
mc cp dump.tar minio_alias/$MINIO_BUCKET/${POSTGRES_DATABASE}_$(date +"%Y-%m-%dT%H:%M:%SZ").typedb
echo "TypeDB backup uploaded successfully."

rm export.typedb
