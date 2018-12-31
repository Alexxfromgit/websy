#!/usr/bin/env bash

mvn clean package

echo "Copy files.."

scp -i ~/.ssh/id_rsa \
    target/websy-1.0-SNAPSHOT.jar \
    d5enemy@35.204.36.103:/home/d5enemy/

echo "Restart server.."

ssh -i ~/.ssh/id_rsa d5enemy@35.204.36.103 << EOF

pgrep java | xargs kill -9
nohup java -jar websy-1.0-SNAPSHOT.jar > log.txt &

EOF

echo "Finished"

