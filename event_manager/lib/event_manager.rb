# The Odin Porject - Section 3: Ruby Programming
# Project File I/O and Serialization, No. 1 Event Manager

require "csv"

def sanitize_zipcode(zipcode)
  if zipcode.nil?
    print "No code, default."
    zipcode = "00000"
  elsif zipcode.length > 5
    print "Long code, cutting... "
    zipcode = zipcode[0..4]
  elsif zipcode.length < 5
    print "Short code, padding... "
    zipcode = zipcode.rjust(5, "0")
  else
    zipcode
  end  
end




contents = CSV.open("../event_attendees.csv", headers: true, header_converters: :symbol)
contents.each do |row|
  name = row[:first_name]
  zipcode = sanitize_zipcode(row[:zipcode])
  print " " + name + " " + zipcode + "\n"
end



