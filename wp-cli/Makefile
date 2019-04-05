project = wp-cli
date = $(shell date +%s)
containerName = $(project)-$(date).iaguara
imageName = wordpress:cli

remove:
	- docker image rm -f $(imageName)

run:
	docker run -it --rm \
		--network iaguara \
		--name $(containerName) \
		-h $(containerName) \
		--volumes-from data-vol.iaguara \
		--volumes-from home-vol.iaguara \
		--volumes-from tmp-vol.iaguara \
		-u $(PINIMA_UID):$(PINIMA_GID) \
		-w $(PWD) \
		$(imageName) \
		$(RUN_COMMAND)
