project = composer
date = $(shell date +%s)
containerName = $(project)-$(date).iaguara
imageName = $(project)

remove:
	- docker image rm -f $(imageName)

run:
	docker run -it --rm \
		--network iaguara \
		--name $(containerName) \
		-h $(containerName) \
		--volumes-from data-vol.iaguara \
		--volumes-from tmp-vol.iaguara \
		-u $(IA_UID):$(IA_GID) \
		-w $(PWD) \
		$(imageName) \
		$(RUN_COMMAND)
