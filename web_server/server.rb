# The Odin Project - Section 3: Ruby Programming
# Ruby on the Web, No. 2 Basic Web Server & Browser

require 'socket'
require 'json'

# Possible content types this server knows how to handle
CONTENT_TYPE = { html:    "text/html",
                 txt:     "text/plain",
                 default: "application/octet-stream" }

server = TCPServer.open(7680)

loop do

  socket = server.accept

  # Grab and parse the incoming request-line from the header
  request = socket.gets
  method = request[/(GET|POST)/] # Identify what the client wants to do
  resource = request[/\w+.html/] # Identify the relevant file
  version = request[/HTTP\/\d\.\d/] # Identify the HTTP protocol version

  # Placeholder for return body
  body = ""

  # Echo the incoming request-line to server
  puts "Request: " + request

  if method == "GET"
    if File.exists?(resource) && !File.directory?(resource)
      # Grab the file extension
      ext = File.extname(resource).split(".").last
      # Check and set types based on the extension
      type = :html if ext == "html" || ext == "htm"
      type = :txt if ext == "txt"
      # Find the file, append each line to prepare the response body
      file = File.open(resource, "r")
      file.each do |line|
        body << line; end
      status = "200"
      message = "OK"
    else # File couldn't be found or was a directory
      status = "404"
      message = "Not Found"
    end
  elsif method == "POST"
    # If data is being sent to the server...
    type = socket.gets.scan(/Content-Type: (\S*)/) # Identify the incoming type
    size = socket.gets.scan(/Content-Length: (\d*)/) # Identify the expected size
    socket.gets # Skip the blank line of the incoming request
    data = socket.recv(size[0].first.to_i) # Receive incoming data by size
    if File.exists?(resource) && !File.directory?(resource)
      # Convert incoming JSON to a local hash
      data = JSON.parse(data, :symbolize_names => true)
      # Prepare data for display
      sub = "<li>Name: #{data[:viking][:name]}</li><li>Email: #{data[:viking][:email]}</li>"
      # Open resource, insert formatted data where yield appears
      file = File.open(resource, "r")
      file.each do |line|
        line = line.sub("<%= yield %>", sub)
        body << line; end
      type = :html
      status = "200"
      message = "OK"
    else # 
      status = "404"
      message = "Not Found"
    end
  else # Unrecognized or unhandled method
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