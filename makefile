NODE_PATH := ${NODE_PATH}:/users/towalter/Projects/Sudoku-Kata/js

all: cover test

test:
	@NODE_ENV=test mocha

test-w:
	@NODE_ENV=test mocha \
	--reporter min \
	--growl \
	--watch

cover:
	@mkdir -p test/reports
	@coffeeCoverage --initfile test/init.js --exclude specs,test src js
	@NODE_ENV=test mocha \
	--require test/init.js \
	--reporter html-cov \
	> test/reports/index.html

.PHONY: all cover test test-w