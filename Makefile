.PHONY: dummy-log

dummy-log:
	@echo '{"key 1": 123456789, "key 2": "abcdefg"}' | fluent-cat json.log

email-log:
	@echo email_log | curl --silent -k --ssl smtp://localhost:25 --mail-from test@example.com --mail-rcpt test@example.com -T -

performance-test-with-dummer:
	@docker compose -f docker-compose.yml -f docker-compose.dummer.yml up -d --build
	@date
	@wc -l log/***/*.log
	@ls -lsh log/***/*.log
	@sleep 60	
	@docker compose -f docker-compose.yml -f docker-compose.dummer.yml down
	@date
	@wc -l log/***/*.log
	@ls -lsh log/***/*.log
