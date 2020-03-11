select airlinesentiment, cast(airlinepolarity as float) polarity, tweettime, airline, cast(retweetcount as decimal) retweets,
       cast(favouritescount as float) favorites, cast(friendscount as float) friends
from airlinesentiment
order by tweettime desc
