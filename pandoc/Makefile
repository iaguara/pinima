project = pandoc
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
	docker run -t --rm \
		--network iaguara \
		--name $(containerName) \
		-h $(containerName) \
		--volumes-from data-vol.iaguara \
		--volumes-from home-vol.iaguara \
		--volumes-from tmp-vol.iaguara \
		-u $(PINIMA_UID):$(PINIMA_GID) \
		-w $(PWD) \
		$(CONTAINER_ARGS) \
		$(imageName) \
		$(RUN_COMMAND)
