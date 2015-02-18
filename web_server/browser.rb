require 'socket'
require 'json'


host = 'localhost'
port = 7680

getpath = "/index.html"
postpath = "/thanks.html"
body = nil
puts "Please enter 1) GET or 2) POST: "
input = gets.chomp

if input == "1" || input == "GET"
  request = "GET #{getpath} HTTP/1.0\r\n\r\n"
elsif input == "2" || input == "POST"
  raid = Hash.new
  member = Hash.new
  
  puts "Enter a name: "
  name = gets.chomp
  member[:name] = name
  
  puts "Enter email: "
  email = gets.chomp
  member[:email] = email

  raid[:viking] = member
  body = raid.to_json

  request = "POST #{postpath} HTTP/1.0\r\n\r\n"
else
  puts "Error."
end




socket = TCPSocket.open(host, port)
socket.puts(request)
if body != nil
  socket.puts("Content-Length: " + body.length.to_s)
  socket.puts(body)
end
response = socket.read

print response