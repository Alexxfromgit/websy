#!/usr/bin/env bash

mvn clean package

echo "Copy files.."

scp -i ~/.ssh/id_rsa \
    target/websy-1.0-SNAPSHOT.jar \
    d5enemy@34.83.55.248:/home/d5enemy/

echo "Restart server.."

ssh -i ~/.ssh/id_rsa d5enemy@34.83.55.248 << EOF

mkdir uploads
pgrep java | xargs kill -9
nohup java -jar websy-1.0-SNAPSHOT.jar > log.txt &

EOF

echo "Finished"

