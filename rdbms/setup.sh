sudo apt-get install postgresql postgresql-contrib -y > /dev/null
sudo -u postgres psql -f ./ddl/articles.sql
sudo -u postgres psql -f ./ddl/clickstream.sql
sudo -u postgres psql -f query_results.sql