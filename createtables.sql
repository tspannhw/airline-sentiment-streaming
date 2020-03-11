  
CREATE TABLE airlinesentimentkudu ( uuid STRING,  `end` STRING, systemtime STRING, runtime STRING, cpu DOUBLE, id STRING, te STRING, 
host STRING,
macaddress STRING, diskusage STRING, memory DOUBLE, ipaddress STRING, host_name STRING,
node_id_0 INT, label_0 STRING, result_0 DOUBLE,
node_id_1 INT, label_1 STRING, result_1 DOUBLE,
node_id_2 INT, label_2 STRING, result_2 DOUBLE,
node_id_3 INT, label_3 STRING, result_3 DOUBLE,
node_id_4 INT, label_4 STRING, result_4 DOUBLE,
PRIMARY KEY (uuid, `end`)
)
PARTITION BY HASH PARTITIONS 4
STORED AS KUDU
TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');

  
CREATE TABLE airlinetweetsrawkudu ( uuid STRING,  `end` STRING, systemtime STRING, runtime STRING, cpu DOUBLE, id STRING, te STRING, 
host STRING,
macaddress STRING, diskusage STRING, memory DOUBLE, ipaddress STRING, host_name STRING,
node_id_0 INT, label_0 STRING, result_0 DOUBLE,
node_id_1 INT, label_1 STRING, result_1 DOUBLE,
node_id_2 INT, label_2 STRING, result_2 DOUBLE,
node_id_3 INT, label_3 STRING, result_3 DOUBLE,
node_id_4 INT, label_4 STRING, result_4 DOUBLE,
PRIMARY KEY (uuid, `end`)
)
PARTITION BY HASH PARTITIONS 4
STORED AS KUDU
TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');


-- Create parquet tables for warehouse

CREATE TABLE airlinetweetsraw ( uuid STRING,  `end` STRING, systemtime STRING, runtime STRING, cpu DOUBLE, id STRING, te STRING, 
host STRING,
macaddress STRING, diskusage STRING, memory DOUBLE, ipaddress STRING, host_name STRING,
node_id_0 INT, label_0 STRING, result_0 DOUBLE,
node_id_1 INT, label_1 STRING, result_1 DOUBLE,
node_id_2 INT, label_2 STRING, result_2 DOUBLE,
node_id_3 INT, label_3 STRING, result_3 DOUBLE,
node_id_4 INT, label_4 STRING, result_4 DOUBLE,
PRIMARY KEY (uuid, `end`)
)
STORED AS PARQUET;



CREATE EXTERNAL TABLE IF NOT EXISTS airlinesentiment (friendscount STRING, hashtags STRING, listedcount STRING,  
annonym STRING, favouritescount STRING, airlinesentiment STRING, airlinepolarity STRING,  retweetcount STRING, 
tweetid STRING, statusescount STRING, followerscount STRING, tweetlocation STRING, tweettext STRING, 
tweettime STRING, airline STRING,  tweettimestamp STRING ) 
STORED AS PARQUET
LOCATION 's3a://cdp-sandbox-default-se/datalake/warehouse/tablespace/external/hive/airlinesentiment'
 ;

  
  CREATE EXTERNAL TABLE IF NOT EXISTS airlinesentiment (friendscount STRING, hashtags STRING, listedcount STRING,  
annonym STRING, favouritescount STRING, airlinesentiment STRING, airlinepolarity STRING,  retweetcount STRING, 
tweetid STRING, statusescount STRING, followerscount STRING, tweetlocation STRING, tweettext STRING, 
tweettime STRING, airline STRING,  tweettimestamp STRING ) 
LOCATION 's3a://cdp-sandbox-default-se/datalake/warehouse/tablespace/external/hive/airlinesentiment'
 ;

CREATE TABLE IF NOT EXISTS airlinesentimentkudu (tweetid STRING, `timestamp` STRING, friends_count STRING, hashtags STRING, listed_count STRING, 
annonym STRING, favourites_count STRING, airlinesentiment STRING, airlinepolarity STRING, retweet_count STRING, 
statuses_count STRING, followers_count STRING, `location` STRING, text STRING, time STRING, airline STRING, 
PRIMARY KEY (tweetid, `timestamp`)
)
PARTITION BY HASH PARTITIONS 4
STORED AS KUDU
TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');

