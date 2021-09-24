#!/bin/sh

set -e
docker run -d --name reviews -p 8082:9080 --link ratings:ratings -e  'ENABLE_RATINGS=true' -e 'RATINGS_SERVICE=http://ratings:8080' reviews
docker run -d --name productpage -p 8083:9080 --link ratings:ratings --link reviews:reviews --link details:details -e 'DETAILS_HOSTNAME=http://details:9080' -e 'RATINGS_HOSTNAME=http://ratings:8080' -e 'REVIEWS_HOSTNAME=http://reviews:9080' productpage