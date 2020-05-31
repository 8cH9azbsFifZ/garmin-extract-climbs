VER=0.3
build:
	docker build . -t garmin-extract-climbs -t asdlfkj31h/garmin-extract-climbs:${VER} -t asdlfkj31h/garmin-extract-climbs:latest
        
push:
	docker push asdlfkj31h/garmin-extract-climbs:latest
	docker push asdlfkj31h/garmin-extract-climbs:${VER}
