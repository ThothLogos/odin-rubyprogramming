require 'socket'
require 'json'

CONTENT_TYPE = { html:    "text/html",
                 txt:     "text/plain",
                 png:     "image/png",
                 jpg:     "image/jpeg",
                 default: "application/octet-stream" }

server = TCPServer.open(7680)

loop do

  socket = server.accept

  request = socket.gets
  resource = request[/\w+.html/]
  method = request[/(GET|POST)/]
  version = request[/HTTP\/\d\.\d/]
  incoming = request[/Content-Length: (\d*)/]
  message = ""
  status = ""
  body = ""

  puts "Request: " + request

  if method == "GET"
    if File.exists?(resource) && !File.directory?(resource)
      ext = File.extname(resource).split(".").last
      if ext == "html" || ext == "htm"
        type = :html
      elsif ext == "txt"
        type = :txt; end
      file = File.open(resource, "r")
      file.each do |line|
        body << line; end
      status = "200"
      message = "OK"
    else
      status = "404"
      message = "Not Found"
    end
  elsif method == "POST"
    if File.exists?(resource)
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

  socket.print "#{version} #{status} #{message}\r\n" +
               "Date: " + Time.now.ctime + "\r\n" +
               "Content-Type: #{CONTENT_TYPE.fetch(type, CONTENT_TYPE[:default])}\r\n" +
               "Content-Length: #{body.bytesize}\r\n" +
               "Connection: close\r\n"
  socket.print "\r\n"
  socket.print body

  socket.close

end