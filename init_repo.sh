#!/bin/bash

cd /home/${user}

source .restic-keys

restic init --repo s3:s3.wasabisys.com/${bucket_name}

echo "repo init done"
