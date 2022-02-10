PHONY: dummy-log

dummy-log:
	@echo '{"key 1": 123456789, "key 2": "abcdefg"}' | fluent-cat fluent-cat.log
