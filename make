#!/usr/local/share/npm/bin/coffee
require 'shelljs/make'
fs = require 'fs'

version   = '0.0.1'
root = __dirname + '/'
src = "#{root}/src/"
test = "#{root}/test/"

## TASKS ##

target.prepareTests = ->
  mkdir "-p", "#{test + 'target/specs'}"
  cp "-Rf", "#{test + 'specs/*'}", "#{test + 'target/specs'}"
  cp "-Rf", "#{src + '*'}", "#{test + 'target'}"

target.coverage = ->
  target.prepareTests()
  mkdir "-p", "#{test + 'reports'}"
  exec "coffeeCoverage --initfile #{test + 'init.js'} --exclude specs,test #{test + 'target'} #{test + 'target'}"
  cover= (exec "mocha -R html-cov #{test + 'target/specs'}", silent: true)
  cover.output.to "#{test + 'reports/index.html'}"

target.test = ->
  target.prepareTests()
  echo "running tests"
  # exec "mocha -R spec #{test + 'target/specs'}"
  echo "tests done"