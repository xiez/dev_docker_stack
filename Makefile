PROJECT=seafile_dev_docker

es.up:
	docker-compose -f docker-compose.mysql.yml up elasticsearch

db.up:
	docker-compose -f docker-compose.mysql.yml up db

dev.up:
	@echo '--> Up dev with sqlite'
	docker-compose -f docker-compose.yml up pro

dev.up.full:
	@echo '--> Up dev with mysql and elasticsearch'
	docker-compose -f docker-compose.mysql.yml up pro

.PHONY: dev.up dev.up.full mysql.up
