#!/bin/bash
TODAY=$(date +"%A")
HOUR=$(date +"%H")

BACKUP_EZIO_DIR="/mnt/d/backup/ezio/"${TODAY}
BACKUP_AGENDA_DIR="/mnt/d/backup/planning/"${TODAY}

AMAZON_S3_EZIO_BUCKET="s3://backup.bdd/ezio/"${TODAY}"/"
AMAZON_S3_AGENDA_BUCKET="s3://backup.bdd/planning/"${TODAY}"/"
AMAZON_S3_BIN="/usr/local/bin/aws"

download_ezio_from_s3() {
    ${AMAZON_S3_BIN} s3 cp ${AMAZON_S3_EZIO_BUCKET}${HOUR}h.sql ${BACKUP_EZIO_DIR}
}


download_agenda_from_s3() {
    ${AMAZON_S3_BIN} s3 cp ${AMAZON_S3_AGENDA_BUCKET}${HOUR}h.sql ${BACKUP_AGENDA_DIR}
}

download_ezio_from_s3
download_agenda_from_s3
