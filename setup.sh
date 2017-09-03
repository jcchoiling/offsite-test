# environment check and setup and install java
sudo apt-get update -y
sudo apt-get install default-jre -y

# intall python3 package manager
sudo apt install python3-pip -y

# intall ipython
sudo pip3 install ipython

# unzip the data in the lookup
gzip -d lookup/GeoLiteCity.dat.gz 
gzip -d data/access_log_Aug95

# download spark2.1 and set up softlink
sudo mkdir /opt/spark
wget -O "spark-2.1.0-bin-hadoop2.7.tgz" "http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz"
tar -xvf spark-2.1.0-bin-hadoop2.7.tgz
rm spark-2.1.0-bin-hadoop2.7.tgz
mv spark-2.1.0-bin-hadoop2.7 /opt/spark/
cd /opt/spark/
ln -s spark-2.1.0-bin-hadoop2.7 spark2

# update the bashrc file
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export CLASSPATH=/usr/lib/jvm/java-8-oracle/jre
export SPARK_HOME=/home/ubuntu/spark2
export PYTHONPATH=${SPARK_HOME}/python/:${PYTHONPATH}
export PYTHONPATH=${SPARK_HOME}/python/lib/py4j-0.10.4-src.zip:${PYTHONPATH}
export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=ipython

PATH=/usr/local/bin:$JAVA_HOME/bin:$PYTHON_HOME/bin:$PATH:$HOME/bin

cat << EOF >> ~/.bashrc
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export CLASSPATH=/usr/lib/jvm/java-8-oracle/jre
export SPARK_HOME=/home/ubuntu/spark2
export PYTHONPATH=${SPARK_HOME}/python/:${PYTHONPATH}
export PYTHONPATH=${SPARK_HOME}/python/lib/py4j-0.10.4-src.zip:${PYTHONPATH}
export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=ipython

PATH=/usr/local/bin:$JAVA_HOME/bin:$SPARK_HOME/bin:$PYTHON_HOME/bin:$PATH:$HOME/bin

EOF

source ~/.bashrc