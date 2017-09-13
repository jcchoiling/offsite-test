# environment check and setup and install java
sudo apt-get update -y > /dev/null
sudo apt-get install default-jre -y > /dev/null

# intall python3 package manager
sudo apt install python3-pip -y > /dev/null

# intall ipython
sudo pip3 install ipython
sudo pip3 install pygeoip

# unzip the data in the lookup
gzip -d ./lookup/GeoLiteCity.dat.gz
gzip -d ./data/access_log_Aug95.gz

# download spark2.1 and set up softlink
sudo mkdir /opt/spark
wget -O "spark-2.1.0-bin-hadoop2.7.tgz" "http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz" > /dev/null
tar -xvf spark-2.1.0-bin-hadoop2.7.tgz
rm spark-2.1.0-bin-hadoop2.7.tgz
sudo mv spark-2.1.0-bin-hadoop2.7 /opt/spark/
cd /opt/spark/
sudo ln -s spark-2.1.0-bin-hadoop2.7 spark2

sudo mv conf/.bashrc ~/.bashrc
source ~/.bashrc