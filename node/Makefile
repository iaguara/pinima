NODE_VERSION ?= 10
project = node$(NODE_VERSION)
date = $(shell date +%s)
imageName = iaguara/$(project)
volumeName = $(project)-vol.iaguara

CONTAINER_NAME ?= $(project)-$(date)
containerName = $(CONTAINER_NAME).iaguara

stop:
	- docker container stop $(shell docker ps -q --filter=name=node)

remove: stop
	- docker image rm -f $(imageName)

build: remove
	docker build --build-arg NODE_VERSION=$(NODE_VERSION) -t $(imageName) .

volume:
	- docker volume create $(volumeName)

run: volume
	docker run -it --rm \
		--network iaguara \
		--name $(containerName) \
		-h $(containerName) \
		-v $(volumeName):/usr/local \
		--volumes-from data-vol.iaguara \
		--volumes-from home-vol.iaguara \
		--volumes-from tmp-vol.iaguara \
		-u $(PINIMA_UID):$(PINIMA_GID) \
		-w $(PWD) \
		$(CONTAINER_ARGS) \
		$(imageName) \
		$(RUN_COMMAND)
