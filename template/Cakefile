{ spawn, exec } = require 'child_process'

run = (cmd, args) ->
  proc = spawn cmd, args
  proc.stderr.pipe process.stderr, end: false
  proc.stdout.pipe process.stdout, end: false
  proc.on 'exit', (status) ->
   process.kill(1) if status != 0

task 'start', 'Start the app', ->
  run 'node', ['server.js']

task 'test', 'Run mocha tests', ->
  run 'node', ['node_modules/mocha/bin/mocha',
               '--colors',
               '--require', 'should',
               '--reporter', 'spec',
               '--compilers', 'coffee:coffee-script']
