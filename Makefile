build:
	docker build . -t garmin-extract-climbs
	docker build . -t asdlfkj31h/garmin-extract-climbs:0.1
        
push:
	docker push asdlfkj31h/garmin-extract-climbs:0.1
