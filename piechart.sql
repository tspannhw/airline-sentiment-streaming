select count(*) numberoftweets, avg(cast(airlinepolarity as float)) as polarity, airlinesentiment, airline
from airlinesentimentkudu
group by airlinesentiment, airline
