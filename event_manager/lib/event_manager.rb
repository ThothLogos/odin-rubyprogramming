# The Odin Porject - Section 3: Ruby Programming
# Project File I/O and Serialization, No. 1 Event Manager

require "csv"
require "sunlight/congress"


Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def sanitize_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
  legi_names = legislators.collect do |legi|
    "#{legi.first_name} #{legi.last_name}"
  end
  legi_names = legi_names.join(", ")
end


contents = CSV.open("../event_attendees.csv", headers: true, header_converters: :symbol)
template_letter = File.read "../form_letter.html"


contents.each do |row|
  name = row[:first_name]
  zipcode = sanitize_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  personal_letter = template_letter.gsub("FIRST_NAME", name)
  personal_letter.gsub!("LEGISLATORS", legislators)

  puts personal_letter
end