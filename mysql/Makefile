project = mysql
containerName = $(project).iaguara
imageName = $(project):5.7
volumeName = $(project)-vol.iaguara

MYSQL_DATABASE ?= iaguara
MYSQL_USER ?= iaguara
MYSQL_PASSWORD ?= 123456

stop:
	- docker container stop $(containerName)

remove: stop
	- docker image rm -f $(imageName)
	- docker volume rm -f $(volumeName)

volume:
	- docker volume create $(volumeName)

run: volume
	docker run -d --rm \
		--network iaguara \
		--name $(containerName) \
		-h $(containerName) \
		-v $(volumeName):/var/lib/mysql \
		--volumes-from tmp-vol.iaguara \
		-e MYSQL_ROOT_PASSWORD=root \
		-e MYSQL_DATABASE=$(MYSQL_DATABASE) \
		-e MYSQL_USER=$(MYSQL_USER) \
		-e MYSQL_PASSWORD=$(MYSQL_PASSWORD) \
		$(imageName)
