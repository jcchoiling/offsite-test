
/* 
Find the top-10 articles (title, ID and like received) with most LIKE received from user on 2017-04-01
*/
SELECT 
    t.title,
    t.article_id,
    t.value
FROM 
(
SELECT 
    a.title AS title,
    a.id AS article_id, 
    COUNT(c.action) AS value,
    ROW_NUMBER() OVER (ORDER BY COUNT(c.action) DESC) AS rn
FROM clickstream c 
JOIN articles a ON c.objectId = a.id
WHERE c.dtime = '2017-04-01'
GROUP BY 1, 2
)t 
WHERE t.rn < 11;

/* 
Find the count of users who install the app (i.e. with FIRST_INSTALL event) on
2017-04-01 and use our app at least once (i.e. with any event) between 2017-04-02 and 2017-04-08
*/
CREATE TEMP TABLE tmp_usr AS (
SELECT DISTINCT userId AS userId
FROM clickstream WHERE action = 'FIRST_INSTALL'
AND dtime = '2017-04-01'
);

SELECT COUNT(DISTINCT src.userId) AS value
FROM clickstream src
JOIN tmp_usr tmp_usr ON src.userId = tmp_usr.userId
WHERE src.dtime BETWEEN '2017-04-02' AND '2017-04-08';

