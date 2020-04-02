#!/bin/bash

MYSQL_HOST='localhost'
MYSQL_PORT='3306'
MYSQL_USER='aster'
MYSQL_PASSWORD='${password}'
DATABASE_NAME='aster'

cd /home/${user}

mysqldump --single-transaction -h ${MYSQL_HOST} \
   -P ${MYSQL_PORT} \
   -u ${MYSQL_USER} \
   -p${MYSQL_PASSWORD} \
   ${DATABASE_NAME} > ${DATABASE_NAME}.sql

source .restic-keys

restic -r s3:s3.wasabisys.com/${bucket_name} backup /home/${user}/aster.sql

echo "mysql aster backup done"
