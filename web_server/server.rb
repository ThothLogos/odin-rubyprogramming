require 'socket'
require 'json'

content_type = { html: 'text/html',
                 txt: 'text/plain',
                 png: 'image/png',
                 jpg: 'image/jpeg' }

server = TCPServer.open(7680)

loop do

  socket = server.accept

  request = socket.gets
  resource = request[/\w+.html/]
  method = request[/(GET|POST|HEAD)/]
  version = request[/HTTP\/\d\.\d/]
  incoming = request[/Content-Length: (\d*)/]
  message = ""
  status = ""
  body = ""

  puts "Request: " + request

  if method == "GET"
    if File.exists?("#{resource}")
      ext = File.extname(resource).split(".").last
      if ext == "html" || ext == "htm" || ext == "txt"
        file = File.open(resource, "r")
        file.each do |line|
          body << line; end
        status = "200"
        message = "OK"
      end
    else
      status = "404"
      message = "Not Found"
      socket.puts(version + " " + status + " " + message)
      socket.puts("Date: " + Time.now.ctime)
    end
  elsif method == "POST"
    if File.exists?("#{resource}")
      file = File.open(resource, "r")
      file.each do |line|
        #stuff
      end
      status = "200"
      message = "OK"
      socket.puts(version + " " + status + " " + message)
      socket.puts("Date: " + Time.now.ctime)
    else
      status = "404"
      message = "Not Found"
      socket.puts(version + " " + status + " " + message)
      socket.puts("Date: " + Time.now.ctime)
    end
  else
    status = "400"
    message = "Bad Request"
    socket.puts(version + " " + status + " " + message)
    socket.puts("Date: " + Time.now.ctime)
  end

  socket.print "#{version} #{status} #{message}\r\n" +
               "Content-Type: #{content_type[:html]}\r\n" +
               "Content-Length: #{body.bytesize}\r\n" +
               "Connection: close\r\n"
  socket.print "\r\n"
  socket.print body

  socket.close

end