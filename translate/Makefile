project = translate
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
		--device /dev/snd \
		-w $(PWD) \
		$(CONTAINER_ARGS) \
		$(imageName) \
		$(RUN_COMMAND)
