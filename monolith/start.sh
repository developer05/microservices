#!/bin/bash
/usr/bin/mongod --fork --logpath /var/log/mongod.log --config /etc/mongodb.conf
source /app/.env
cd /app && bin/console server:run 0.0.0.0:8080 || exit