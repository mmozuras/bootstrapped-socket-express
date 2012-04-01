host = '#{ host }'
socket = io.connect host

socket.on 'hello', (data) ->
  socket.emit 'hello', { hello: 'says client' }
