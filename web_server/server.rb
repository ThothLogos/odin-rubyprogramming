require 'socket'


server = TCPServer.open(7680)

loop {
  client = server.accept

  request = client.gets
  resource = request[/\w+.html/]
  type = request[/(GET|POST)/]
  version = request[/HTTP\/\d\.\d/]
  message = ""
  status = ""
  response = ""

  puts "Request: " + request.chomp

  if type == "GET"
    if File.exists?("#{resource}")
      puts "Resource found, sending: #{resource}"
      file = File.open(resource, "r")
      file.each do |line|
        response << line; end
      status = "200"
      message = "OK"
    else
      puts "Resource not found, sending code 404."
      status = "404"
      message = "Not Found"
    end
    client.puts(version + " " + status + " " + message)
    client.puts(response)
  end

  client.close
}