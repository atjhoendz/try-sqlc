postgresql:
	@docker-compose up -d try_sqlc_postgresql

migrate_up:
	@docker-compose up try_sqlc_goose_migration_up

build_migrate_up:
	@docker-compose up --build try_sqlc_goose_migration_up

stop:
	@docker-compose down

.PHONY: postgresql migrate_up build_migrate_up stop