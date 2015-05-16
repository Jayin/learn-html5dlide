TEST_TIMEOUT = 5000

MOCHA_REPORTER = spec

test:
	@./node_modules/.bin/mocha \
	--timeout $(TEST_TIMEOUT) \
	--reporter $(MOCHA_REPORTER) \
	test/


.PHONY: test
