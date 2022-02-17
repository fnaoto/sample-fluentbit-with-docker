.PHONY: log check_log

dummy_log:
	@echo '{"key 1": 123456789, "key 2": "abcdefg"}' | fluent-cat json.log

email_log:
	@echo email_log | curl --silent -k --ssl smtp://localhost:25 --mail-from test@example.com --mail-rcpt test@example.com -T -

httpd_log:
	@curl --silent localhost:80

log: dummy_log email_log httpd_log

performance-test-fluentbit:
	@rm -f log/fluent-bit/*
	@docker compose \
		-f docker-compose.yml \
		-f docker-compose.fluent-bit.yml \
			up -d --build
	@sleep 5
	@docker compose \
		-f docker-compose.dummer.yml \
			up -d --build
	@make check_log
	@sleep 60
	@docker compose \
		-f docker-compose.yml \
		-f docker-compose.dummer.yml \
		-f docker-compose.fluent-bit.yml \
			down
	@make check_log

performance-test-fluentd:
	@rm -f log/fluentd/*
	@docker compose \
		-f docker-compose.yml \
		-f docker-compose.fluentd.yml \
			up -d --build
	@sleep 5
	@docker compose \
		-f docker-compose.dummer.yml \
			up -d --build
	@make check_log
	@sleep 60
	@docker compose \
		-f docker-compose.yml \
		-f docker-compose.dummer.yml \
		-f docker-compose.fluentd.yml \
			down
	@make check_log

clean:
	@rm -rf log/**
	@docker compose \
		-f docker-compose.yml \
		-f docker-compose.dummer.yml \
		-f docker-compose.fluentd.yml \
		-f docker-compose.fluent-bit.yml \
			down

check_log:
	@date 
	@if compgen -G "log/*" > /dev/null; then \
			echo [word count]; \
			find log -type f | xargs wc -l; \
			echo [file size]; \
			ls -lsh log/*; \
		fi
