# Offsite Test - Part 1
Part 1 of the offsite-test test for the knowledge of processing unstructured data. How to deal with miliions of apache web log in the file. In this exercise, I will use Spark as the data processing engine to extract and transform the web log. 

## Environment Setup 
Assuming you turn on a brand new linux instance. e.g t2.mirco. You can run directly ***setup.sh***. The setup.sh in the project folder covers all the following environment setup:

1. Run general updates on the linux environment
2. Download and install Python3 and iPython
3. Download and Install Spark2.1 and configure some environment PATH file

Please clone the project to the local folder by executing git clone under your HOME folder, e.g. /home/ubuntu:

    git clone https://github.com/jcchoiling/offsite-test.git
    
Run the setup.sh for environment setup:

    bash setup.sh 
    
#### *If you have already executed the setup.sh, you don't have to run the following code, you can directly jump to _Getting Start_.*

### Environment Setup - Details
This section explain the action in the setup.sh

* Get an update of the linux environment 

        sudo apt-get update -y
        sudo apt-get install default-jre -y
    
* Since I will execute python inside Spark. We also need to ensure Python and iPython has installed in the server, the demo works well with _Python 3.5 or above_. In Ubuntu, it is by default has Python3.5.2 installed.

        sudo apt install python3-pip -y
        sudo pip3 install ipython

#### Install Spark 
* Since I will use Spark to perform the data extraction, we need to ensure Spark is installed. Here are the steps for installation, we will download and install Spark2.1. 

        sudo mkdir /opt/spark
        wget -O "spark-2.1.0-bin-hadoop2.7.tgz" "http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz"
        tar -xvf spark-2.1.0-bin-hadoop2.7.tgz
        rm spark-2.1.0-bin-hadoop2.7.tgz
        sudo mv spark-2.1.0-bin-hadoop2.7 /opt/spark/
        cd /opt/spark/
        sudo ln -s spark-2.1.0-bin-hadoop2.7 spark2
    
* And then we also have to update the ~/.bashfile to update the JAVA_HOME, SPARK_HOME, PYTHON_HOME and assign it to the Path environment

        export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
        export CLASSPATH=/usr/lib/jvm/java-8-openjdk-amd64/jre
        export SPARK_HOME=/opt/spark/spark2
        export PYTHONPATH=${SPARK_HOME}/python/:${PYTHONPATH}
        export PYTHONPATH=${SPARK_HOME}/python/lib/py4j-0.10.4-src.zip:${PYTHONPATH}
        export PYSPARK_PYTHON=/usr/bin/python3
        export PYSPARK_DRIVER_PYTHON=ipython
        
        PATH=/usr/local/bin:$JAVA_HOME/bin:$PYTHON_HOME/bin:$PATH:$HOME/bin


## Getting Start
After running the setup.sh, we need to source the ~/.bashrc file in order to activate the environment variables

       # execute Spark Job through spark-submit
       source ~/.bashrc

After finished setting up the environment. Please execute run.sh to review the results. 
           
       # execute Spark Job through spark-submit
       bash run.sh

It takes around 3 mins to process the data and deliver the results:
<img src="https://i.imgur.com/ad58715.png">

