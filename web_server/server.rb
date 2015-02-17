require 'socket'


server = TCPServer.open(7680)

loop {
  client = server.accept

  request = client.gets
  resource = request[/\w+.html/]
  type = request[/(GET|POST)/]

  response = ""
  file = File.open(resource, "r")
  file.each do |line|
    response << line
  end

  if type == "GET"
    puts "Request: " + request + " Sending: #{resource}"
    client.puts(response)
  end




  client.puts(Time.now.ctime)
  client.puts "Closing connection. "
  client.close
}