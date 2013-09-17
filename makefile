REPORTER = html-cov

clean:
	rm -rf test/target

setup:
	mkdir -p test/target/
	mkdir -p test/reports
	mkdir -p test/target/specs
	cp src/* test/target
	cp test/specs/* test/target/specs

test:
	@NODE_ENV=test mocha \
	test/target/specs

test-w:
	@NODE_ENV=test mocha \
	--growl \
	--watch

cover:
	coffeeCoverage --initfile test/init.js --exclude specs,test test/target test/target
	@NODE_ENV=test mocha \
	--reporter $(REPORTER) \
	test/target/specs \
	> test/reports/index.html

.PHONY: clean setup cover test