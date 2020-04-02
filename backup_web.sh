#!/bin/bash

cd /home/${user}

source .restic-keys

restic -r s3:s3.wasabisys.com/${bucket_name} backup /var/www/html

echo "web backup done"
