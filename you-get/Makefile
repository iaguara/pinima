project = you-get
imageName = iaguara/$(project)

CONTAINER_NAME ?= $(project)
containerName = $(CONTAINER_NAME).iaguara

stop:
	- docker container stop $(containerName)

remove: stop
	- docker image rm -f $(imageName)

build: remove
	docker build -t $(imageName) .

run:
	docker run -it --rm \
		--network iaguara \
		--name $(containerName) \
		--hostname $(containerName) \
		--volumes-from home-vol.iaguara \
		--volumes-from tmp-vol.iaguara \
		-e PINIMA_UID \
		-e PINIMA_GID \
		-w $(PWD) \
		$(CONTAINER_ARGS) \
		$(imageName) \
		$(RUN_COMMAND)
