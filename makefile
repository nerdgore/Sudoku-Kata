all: cover test

test:
	$(eval $NODE_PATH := $(:${NODE_PATH}:/users/towalter/Projects/Sudoku-Kata/src))
	@coffee -o js/ -c src/
	@NODE_ENV=test mocha \
	--grep Sudoku \
	test/specs/*.coffee
	
test-min:
	$(eval $NODE_PATH := $(:${NODE_PATH}:/users/towalter/Projects/Sudoku-Kata/src))
	@coffee -o js/ -c src/
	@NODE_ENV=test mocha \
	--reporter min \
	--grep Sudoku \
	test/specs/*.coffee

test-w:
	$(eval $NODE_PATH := $(:${NODE_PATH}:/users/towalter/Projects/Sudoku-Kata/src))
	@NODE_ENV=test mocha \
	--reporter min \
	--watch \
	test/specs/*.coffee

cover:
	$(eval $NODE_PATH := $(:${NODE_PATH}:/users/towalter/Projects/Sudoku-Kata/js))
	@mkdir -p test/reports
	@coffeeCoverage --initfile test/init.js --exclude specs,test src js
	@NODE_ENV=test mocha \
	--require test/init.js \
	--reporter html-cov \
	> test/reports/index.html

.PHONY: all test test-w