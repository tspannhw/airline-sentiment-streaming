select count(*) as NumberOfUsers, airlinesentiment, airline
from airlinesentimentkudu
where airline != 'None'
group by airlinesentiment, airline;
