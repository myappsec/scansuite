#!/bin/bash

docker-compose -f /home/USER/scansuite-demo/docker-compose.yml up -d
cd /home/USER/apps/django-DefectDojo
./dc-up-d.sh mysql-redis