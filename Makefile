VER=1.1
build:
	docker build . -t garmin-extract-climbs -t t20:5000/garmin-extract-climbs:latest -t t20:5000/garmin-extract-climbs:${VER} 
        
push:
	docker push t20:5000/garmin-extract-climbs:latest
	docker push t20:5000/garmin-extract-climbs:${VER}