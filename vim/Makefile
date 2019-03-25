project = vim
date = $(shell date +%s)
containerName = $(project)-$(date).iaguara
imageName = iaguara/$(project)

stop:
	- docker container stop $(shell docker ps -q --filter=name=vim)

remove: stop
	- docker image rm -f $(imageName)

build: remove
	docker build -t $(imageName) .

run:
	docker run -it --rm \
		--network iaguara \
		--name $(containerName) \
		-h $(containerName) \
		--volumes-from data-vol.iaguara \
		--volumes-from home-vol.iaguara \
		--volumes-from iaguara-vol.iaguara \
		--volumes-from tmp-vol.iaguara \
		-e IA_UID \
		-e IA_GID \
		-e COLUMNS \
		-e LINES \
		-w $(PWD) \
		$(imageName) \
		$(RUN_COMMAND)
