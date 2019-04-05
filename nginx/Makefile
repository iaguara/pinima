project = nginx
containerName = $(project).iaguara
imageName = $(project)

rootDir = $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
rootfs = $(rootDir)/rootfs
conf = /etc/nginx/conf.d/default.conf

stop:
	- docker container stop $(containerName)

remove: stop
	- docker image rm -f $(imageName)

volume:
	- docker create \
			--name www-html-vol.iaguara \
			-v $(PINIMA_DATA)/www/html:/var/www/html \
			tianon/true

run: volume
	docker run -d --rm \
		--network iaguara \
		--name $(containerName) \
		-p 80:80 \
		-h $(containerName) \
		-v $(rootfs)$(conf):$(conf) \
		-v /tmp/nginx/log:/var/log/nginx \
		--volumes-from data-vol.iaguara \
		--volumes-from tmp-vol.iaguara \
		--volumes-from www-html-vol.iaguara \
		$(imageName) \
		$(RUN_COMMAND)
