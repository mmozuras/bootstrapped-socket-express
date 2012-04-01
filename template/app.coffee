express = require 'express'
stylus = require 'stylus'
routes = require './routes'

app = express.createServer()
app.use express.logger()
app.use require("connect-assets")()
app.set 'view engine', 'jade'
app.use express.static(__dirname + '/public')

app.get '/', routes.index

port = process.env.PORT or 3000
app.listen port, -> console.log "Listening on port " + port
