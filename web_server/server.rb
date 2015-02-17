require 'socket'


server = TCPServer.open(7680)

loop {
  client = server.accept


  incoming = client.gets
  if incoming.match(/GET/)
    puts "Request:" + incoming
    client.puts "Request heard."
  end

  client.puts(Time.now.ctime)
  client.puts "Closing connection. "
  client.close
}