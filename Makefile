PHONY: dummy-log

dummy-log:
	@echo '{"key 1": 123456789, "key 2": "abcdefg"}' | fluent-cat fluent-cat.log

email-log:
	@echo email_log | curl --ssl smtp://localhost:25 --mail-from test@example.com --mail-rcpt test@example.com -T -
