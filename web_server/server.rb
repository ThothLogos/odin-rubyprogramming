require 'socket'
require 'json'


server = TCPServer.open(7680)

loop {
  client = server.accept

  request = client.gets
  resource = request[/\w+.html/]
  type = request[/(GET|POST|HEAD)/]
  version = request[/HTTP\/\d\.\d/]
  incoming = request[/Content-Length: (\d+)/]
  message = ""
  status = ""
  body = ""

  puts "Request: " + request.chomp

  if type == "GET"
    if File.exists?("#{resource}")
      file = File.open(resource, "r")
      file.each do |line|
        body << line; end
      status = "200"
      message = "OK"
    else
      status = "404"
      message = "Not Found"
    end
  elsif type == "POST"
    if File.exists?("#{resource}")
      file = File.open(resource, "r")
      file.each do |line|
        #stuff
      end
      status = "200"
      message = "OK"
    else
      status = "404"
      message = "Not Found"
    end
  else
    status = "400"
    message = "Bad Request"
  end

  client.puts(version + " " + status + " " + message)
  client.puts("Date: " + Time.now.ctime)
  client.puts("Content-Length: " + body.length.to_s)
  client.puts(body)

  client.close
}