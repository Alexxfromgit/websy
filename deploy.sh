#!/usr/bin/env bash

mvn clean package

echo "Copy files.."

scp -i ~/.ssh/id_rsa \
    target/websy-1.0-SNAPSHOT.jar \
    alexx_rw@35.246.185.137:/home/alexx_rw/

echo "Restart server.."

ssh -i ~/.ssh/id_rsa alexx_rw@35.246.185.137 << EOF

pgrep java | xargs kill -9
nohup java -jar websy-1.0-SNAPSHOT.jar > log.txt &

EOF

echo "Finished"

