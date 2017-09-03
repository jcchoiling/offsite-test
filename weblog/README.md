# offsite-test
The offsite test have three questions. It is suggested to set up one EC2 Instance to review it. 

## Environment Setup 
Assuming you turn on a brand new linux instance. e.g t2.mirco. You can run directly ***setup.sh***. The setup.sh in the project folder covers all the following environment setup:

* Get an update of the linux environment 

        sudo apt-get update -y
        sudo apt-get install default-jre -y
    
* Since I will execute python inside Spark. We also need to ensure Python and iPython has installed in the server.

        sudo apt install python3-pip -y
        sudo pip3 install ipython

#### Install Spark 
* I use Spark technology to process the access log file. Therefore, please ensure the environment got Spark installed. Here is the steps, we have to download and install Spark2.1. 

        sudo mkdir /opt/spark
        wget -O "spark-2.1.0-bin-hadoop2.7.tgz" "http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz"
        tar -xvf spark-2.1.0-bin-hadoop2.7.tgz
        rm spark-2.1.0-bin-hadoop2.7.tgz
        mv spark-2.1.0-bin-hadoop2.7 /opt/spark/
        cd /opt/spark/
        ln -s spark-2.1.0-bin-hadoop2.7 spark2
    
* And then we also have to update the ~/.bashfile to update the JAVA_HOME, SPARK_HOME, PYTHON_HOME and assign it to the Path environment

        export JAVA_HOME=/usr/lib/jvm/java-8-oracle
        export CLASSPATH=/usr/lib/jvm/java-8-oracle/jre
        export SPARK_HOME=/home/ubuntu/spark2
        export PYTHONPATH=${SPARK_HOME}/python/:${PYTHONPATH}
        export PYTHONPATH=${SPARK_HOME}/python/lib/py4j-0.10.4-src.zip:${PYTHONPATH}
        export PYSPARK_PYTHON=/usr/bin/python3
        export PYSPARK_DRIVER_PYTHON=ipython
        
        PATH=/usr/local/bin:$JAVA_HOME/bin:$PYTHON_HOME/bin:$PATH:$HOME/bin


## Getting Start
After finished setting up the environment. Please execute run.sh to review the results. The 

    bash run.sh

It takes around 5 mins to process the data and deliver the Results:
<img src="https://i.imgur.com/ad58715.png">

