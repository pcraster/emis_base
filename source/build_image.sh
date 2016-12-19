#!/usr/bin/env bash
set -e


docker build -t test/emis_base .

# A test to see whether we can create a file in a mounted directory and
# read it again afterwards.
docker run --env EMIS_USER_ID=$(id -u) -v$EMIS_PROPERTY_DATA:/data test/emis_base /bin/bash -c "echo 'Hello World!' > /data/blah.txt; ls -l /data"
cat $EMIS_PROPERTY_DATA/blah.txt
rm $EMIS_PROPERTY_DATA/blah.txt
