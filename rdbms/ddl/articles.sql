DROP TABLE IF EXISTS articles;
CREATE TABLE articles (
    id varchar(20),
    title varchar(50),
    created_by date,
    updated_by date
);

INSERT INTO articles (id, title, created_by, updated_by) VALUES
(23465,'Hello world','2017-04-05','2017-04-05'),
(23466,'Hello python','2017-04-06','2017-04-06'),
(23467,'Hello spark','2017-04-05','2017-04-05'),
(23468,'Hello kafka','2017-04-08','2017-04-08'),
(23469,'Hello hadoop','2017-04-09','2017-04-09'),
(23470,'Hello donald trump','2017-04-05','2017-04-05'),
(23471,'Hello viu','2017-04-05','2017-04-05'),
(23472,'Hello hk01','2017-04-12','2017-04-12'),
(23473,'Hello john','2017-04-05','2017-04-05'),
(23474,'Hello eason','2017-04-14','2017-04-14'),
(23475,'Hello night','2017-04-05','2017-04-05'),
(23476,'Hello openrice','2017-04-16','2017-04-16'),
(23477,'Hello tea','2017-04-17','2017-04-17'),
(23478,'Hello java','2017-04-05','2017-04-05'),
(23479,'Hello flume','2017-04-19','2017-04-19'),
(23480,'Hello hive','2017-04-05','2017-04-05'),
(23481,'Hello pig','2017-04-21','2017-04-21'),
(23482,'Hello datastax','2017-04-22','2017-04-22'),
(23483,'Hello databricks','2017-04-05','2017-04-05'),
(23484,'Hello o2o','2017-04-05','2017-04-05');

COMMIT;