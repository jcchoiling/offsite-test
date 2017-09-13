# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export CLASSPATH=/usr/lib/jvm/java-8-openjdk-amd64/jre
export SPARK_HOME=/opt/spark/spark2
export PYTHONPATH=${SPARK_HOME}/python/:${PYTHONPATH}
export PYTHONPATH=${SPARK_HOME}/python/lib/py4j-0.10.4-src.zip:${PYTHONPATH}
export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=ipython

PATH=/usr/local/bin:$JAVA_HOME/bin:$PYTHON_HOME/bin:$PATH:$HOME/bin