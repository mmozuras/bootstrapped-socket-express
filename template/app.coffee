express = require 'express'
stylus = require 'stylus'
routes = require './routes'
socketio = require 'socket.io'

app = express.createServer()
io = socketio.listen(app)

app.use express.logger {format: ':method :url :status :response-time ms'}
app.use require("connect-assets")()
app.set 'view engine', 'jade'
app.use express.static(__dirname + '/public')

# Routes
app.get '/', routes.index

# Socket.IO
io.sockets.on 'connection', (socket) ->
  socket.emit 'hello',
    hello: 'says server'

port = process.env.PORT or 3000
app.listen port, -> console.log "Listening on port " + port
