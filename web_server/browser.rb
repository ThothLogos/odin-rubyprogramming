# The Odin Porject - Section 3: Ruby Programming
# Project - Ruby on the Web, No. 2 Basic Web Server & Browser

require 'socket'
require 'json'


host = 'localhost'
port = 7680

getpath = "/index.html"
postpath = "/thanks.html"
body = ""
puts "Please enter 1) GET or 2) POST: "
input = gets.chomp

if input == "1" || input == "GET"
  request = "GET #{getpath} HTTP/1.1\r\n\r\n"
elsif input == "2" || input == "POST"
  raid = Hash.new
  member = Hash.new
  name = "Gets Chaeump"
  email = "email@emails.org"
  member[:name] = name
  member[:email] = email
  raid[:viking] = member
  body = raid.to_json
  request = "POST #{postpath} HTTP/1.1"
end


puts body

socket = TCPSocket.open(host, port)
socket.print "#{request}\r\n" +
             "Content-Type: application/json\r\n" +
             "Content-Length: #{body.bytesize}\r\n"
socket.print "\r\n"
socket.print body if body != ""



response = socket.read
print response