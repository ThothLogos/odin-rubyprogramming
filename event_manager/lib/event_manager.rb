# The Odin Porject - Section 3: Ruby Programming
# Project File I/O and Serialization, No. 1 Event Manager


lines = File.readlines "../event_attendees.csv"
lines.each do |line|
  columns = line.split(",")
  puts columns[2]
end