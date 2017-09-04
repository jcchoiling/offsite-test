# Offsite Test - Part 2
Part 2 of the offsite-test test for the knowledge of RDBMS. 

## Environment Setup
Assuming you turn on a t2.micro instance, you can use the same instance as Q1-WebLog. Next, move to rdbms folder and run setup.sh

    bash setup.sh 
    
The setup.sh will first install the PostgreSQL in the server and execute the DDL script to create articles and clickstream tables.
#### *If you have already executed the setup.sh, you don't have to run the following code, you can directly jump to _Getting Start_.*

### Details
I choose PostgresSQL as the database, so first we have to installed it.

    sudo apt-get install postgresql postgresql-contrib -y > /dev/null

In order to simulate the environment, I have prepared the DDL Insert Statement. Firstly, to create the articles and clickstream tables. Secondly, insert some data for testing the sql. 

    sudo -u postgres psql -f ./ddl/articles.sql
    sudo -u postgres psql -f ./ddl/clickstream.sql

Articles and Clickstream table have the following table relationships. Two tables joined together by clickstream.objectId and articles.id
<img src="https://i.imgur.com/0xIOKaK.png"> 

## Getting Started
#### Execute the sql file
execute the run.sh to return the sql results

    bash run.sh

The run.sh aims to pass two sql below to the PostgreSQL that I have installed during the environment setup.

_Query 1 Explaination_

Find the top-10 articles (title, ID and like received) with most LIKE received from user on 2017-04-01

    SELECT t.title, t.article_id, t.value
    FROM (
    SELECT a.title AS title, a.id AS article_id, 
        COUNT(c.action) AS value,
        ROW_NUMBER() OVER (ORDER BY COUNT(c.action) DESC) AS rn
    FROM clickstream c 
    JOIN articles a ON c.objectId = a.id
    WHERE c.dtime = '2017-04-01'
    GROUP BY 1, 2)t 
    WHERE t.rn < 11;
    
_Query 2 Explaination_

Find the count of users who install the app (i.e. with FIRST_INSTALL event) on
2017-04-01 and use our app at least once (i.e. with any event) between 2017-04-02 and 2017-04-08

    CREATE TEMP TABLE tmp_usr AS (
    SELECT DISTINCT userId AS userId
    FROM clickstream WHERE action = 'FIRST_INSTALL'
    AND dtime = '2017-04-01'
    );
    
    SELECT COUNT(DISTINCT src.userId) AS value
    FROM clickstream src
    JOIN tmp_usr tmp_usr ON src.userId = tmp_usr.userId
    WHERE src.dtime BETWEEN '2017-04-02' AND '2017-04-08';

