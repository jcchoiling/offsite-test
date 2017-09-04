#!/usr/bin/env bash
sudo apt-get install postgresql postgresql-contrib -y > /dev/null
sudo -u postgres psql -f ./ddl/articles.sql
sudo -u postgres psql -f ./ddl/clickstream.sql