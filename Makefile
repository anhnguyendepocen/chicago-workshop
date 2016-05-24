#-This has been modelled off of jupyter/docker-demo-images (https://github.com/jupyter/docker-demo-images.git)-#

image:
	docker build -t mmcky/chicago .

relaunch:
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)
	./scripts/run.sh

launch:
	./scripts/run.sh

super-nuke: nuke
	-docker rmi mmcky/chicago

# Cleanup with fangs
nuke:
	-docker stop `docker ps -aq`
	-docker rm -fv `docker ps -aq`
	-docker images -q --filter "dangling=true" | xargs docker rmi

.PHONY: nuke
