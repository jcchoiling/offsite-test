import sys
import utils

from pyspark.sql import SparkSession
from pyspark.sql import Row



if __name__ == "__main__":

    if len(sys.argv) < 2:
        print("Usage: weblogParser.py <file>")
        exit(-1)

    spark = SparkSession.builder.master("local[*]").appName("WebLog Parser").getOrCreate()

    sc = spark.sparkContext
    sc.setLogLevel("ERROR")

    # load the source file and make an RDD
    accessLogRDD = sc.textFile(sys.argv[1], 10)

    # question1: count the total number of http log record
    count = accessLogRDD.count()
    print("Questions 1) The total number of HTTP request recorded by this access logfile: " + '\n \t' + "access logfile count: "+str(count))

    # question2:q
    mapLogRDD = accessLogRDD.map(lambda m: (m.split()[0], m.split()[3].replace('[', ''))).map(
        lambda m: (m[0], m[1].split(':')[0]))
    mapLogWithDtRDD = mapLogRDD.map(lambda m: (m[0], utils.datetime_parser(m[1])))
    accessLog = mapLogWithDtRDD.map(lambda p: Row(ip=p[0], dtime=p[1]))
    accessLogDF = spark.createDataFrame(accessLog)
    accessLogDF.createOrReplaceTempView("accessLog")

    access_res1 = spark.sql(
        "SELECT ip, count(1) as cnt FROM accessLog WHERE dtime between '1995-08-18' and '1995-08-20' GROUP BY ip ORDER BY count(1) DESC").limit(
        10)
    # access_res1 = spark.sql(
    #     "SELECT ip, count(1) as cnt FROM accessLog GROUP BY ip ORDER BY count(1) DESC").limit(
    #     10)
    print("\nQuestions 2) Top 10 hosts with the most request - hosts (no. of requests): ")
    results = access_res1.rdd.map(lambda m: m.ip + " (" + str(m.cnt) + ")").collect()
    for res in enumerate(results,1):
        print('\t'+ str(res[0])+')', res[1])

    # questions3
    print("\nQuestions 3) Country with the most requests:")
    access_res2 = spark.sql("SELECT ip, count(1) as cnt FROM accessLog GROUP BY ip ORDER BY count(1) DESC").limit(1)
    results2 = access_res2.rdd.map(lambda m: (utils.getGeoCountry(m.ip), m.ip, m.cnt)).collect()
    print("\t{country} ({hostname} - {cnt})".format(country=results2[0][0].split('/')[0],hostname=results2[0][1],cnt=results2[0][2]))

    sc.stop()