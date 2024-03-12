#!/bin/bash

docker-compose -f /home/USER/apps/scansuite/docker-compose.yml up --scale worker=2 -d
cd /home/USER/apps/django-DefectDojo && ./dc-up-d.sh mysql-redis