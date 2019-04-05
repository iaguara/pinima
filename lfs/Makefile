project = lfs
containerName = $(project).iaguara
imageName = iaguara/$(project)

LFS_DIR ?= $(PINIMA_DATA)/lfs
LFS_UID ?= $(PINIMA_UID)
LFS_GID ?= $(PINIMA_GID)

stop:
	- docker container stop $(containerName)

remove: stop
	- docker image rm -f $(imageName)
	- docker container rm -f lfs-vol.iaguara

build: remove
	docker build \
		-t $(imageName) \
		--build-arg LFS_UID=$(LFS_UID) \
		--build-arg LFS_GID=$(LFS_GID) \
		.

lfsVol:
	- docker create \
		--name lfs-vol.iaguara \
		-v $(LFS_DIR):/lfs \
		tianon/true

run: lfsVol
	docker run -it --rm --privileged \
		--name $(containerName) \
		-h $(containerName) \
		--volumes-from lfs-vol.iaguara \
		-e COLUMNS \
		-e LINES \
		$(imageName) \
		$(RUN_COMMAND)
