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

# export the environment variables
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export CLASSPATH=/usr/lib/jvm/java-8-openjdk-amd64/jre
export SPARK_HOME=/opt/spark/spark2
export PYTHONPATH=${SPARK_HOME}/python/:${PYTHONPATH}
export PYTHONPATH=${SPARK_HOME}/python/lib/py4j-0.10.4-src.zip:${PYTHONPATH}
export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=ipython
export PATH=/usr/local/bin:$JAVA_HOME/bin:$SPARK_HOME/bin:$PYTHON_HOME/bin:$PATH:$HOME/bin

# update the bashrc file with the environment variables
cat << EOF >> ~/.bashrc
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export CLASSPATH=/usr/lib/jvm/java-8-openjdk-amd64/jre
export SPARK_HOME=/opt/spark/spark2
export PYTHONPATH=${SPARK_HOME}/python/:${PYTHONPATH}
export PYTHONPATH=${SPARK_HOME}/python/lib/py4j-0.10.4-src.zip:${PYTHONPATH}
export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=ipython
PATH=/usr/local/bin:$JAVA_HOME/bin:$SPARK_HOME/bin:$PYTHON_HOME/bin:$PATH:$HOME/bin

EOF


source ~/.bashrc