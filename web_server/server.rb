require 'socket'


server = TCPServer.open(7680)

loop {
  client = server.accept
  client.puts(Time.now.ctime)
  client.puts "Closing connection. "
  client.close
}