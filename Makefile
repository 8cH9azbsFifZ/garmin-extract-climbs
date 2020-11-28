VER=0.4
build:
	docker build . -t garmin-extract-climbs -t asdlfkj31h/garmin-extract-climbs:${VER} -t asdlfkj31h/garmin-extract-climbs:latest -t t20:5000/garmin-extract-climbs:latest -t t20:5000/garmin-extract-climbs:${VER} 
        
push:
	#docker push asdlfkj31h/garmin-extract-climbs:latest
	#docker push asdlfkj31h/garmin-extract-climbs:${VER}
	docker push t20:5000/garmin-extract-climbs:latest
	docker push t20:5000/garmin-extract-climbs:${VER}