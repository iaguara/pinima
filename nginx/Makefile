project = nginx
containerName = $(project).iaguara
imageName = $(project)
rootfs = $(HOST_IA_HOME)/projects/$(project)/rootfs
conf = /etc/nginx/conf.d/default.conf

stop:
	- docker container stop $(containerName)

remove: stop
	- docker image rm -f $(imageName)

volume:
	- docker create \
			--name www-html-vol.iaguara \
			-v $(IA_DATA)/www/html:/var/www/html \
			tianon/true

run: volume
	docker run -d --rm \
		--network iaguara \
		--name $(containerName) \
		-p 80:80 \
		-h $(containerName) \
		-v $(rootfs)$(conf):$(conf) \
		-v /tmp/nginx/log:/var/log/nginx \
		--volumes-from tmp-vol.iaguara \
		--volumes-from data-vol.iaguara \
		--volumes-from www-html-vol.iaguara \
		$(imageName) \
		$(RUN_COMMAND)
