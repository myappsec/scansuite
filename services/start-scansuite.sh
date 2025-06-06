#!/bin/bash

cd /USER/apps/scansuite && ./start-scansuite
cd /USER/apps/scansuite/defectdojo && sudo docker compose up -d