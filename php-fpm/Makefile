project = php-fpm
containerName = $(project).iaguara
imageName = $(project)

rootDir = $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
rootfs = $(rootDir)/rootfs
conf = /usr/local/etc/php/conf.d/custom.ini

stop:
	- docker container stop $(containerName)

remove: stop
	- docker image rm -f $(imageName)

build: remove
	docker build -t $(imageName) .

volume:
	- docker create \
			--name www-html-vol.iaguara \
			-v $(PINIMA_DATA)/www/html:/var/www/html \
			tianon/true

run: volume
	docker run -d --rm \
		--network iaguara \
		--name $(containerName) \
		-h $(containerName) \
		-v $(rootfs)$(conf):$(conf) \
		--volumes-from data-vol.iaguara \
		--volumes-from tmp-vol.iaguara \
		--volumes-from www-html-vol.iaguara \
		$(imageName) \
		$(RUN_COMMAND)
