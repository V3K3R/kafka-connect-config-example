bootstrap:
	docker compose  up -d

teardown:
	docker compose down --remove-orphans --volumes --timeout=5 > /dev/null

e2e:
	poetry run behave test
