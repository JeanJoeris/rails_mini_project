require 'nokogiri'
require 'open-uri'
require 'byebug'
doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Wolf"))
# byebug
table_data = doc.css(".infobox").css("td")#.to_xml
doc.css(".infobox").css("td").each do |link|
  puts link
end
# kingdom_index = table_data.index("Kingdom:")
#
# foo = table_data.split("Kingdom:")
# bar = foo[1].split("Phylum:")
# biz = bar[1].split("Class:")
# foobar = biz[1].split("Order:")
# barbiz = foobar[1].split("Family:")
# bizfoo = barbiz[1].split("Genus:")
# thing = bizfoo[1].split("Species:")
# # puts table_data[kingdom_index..-1]
# puts "-----------------------------------"
# # puts foo[1]
# # puts "-----------------------------------"
# # puts bar[1]
# # puts "-----------------------------------"
# # puts bar[0]
# # puts biz[0]
# # puts foobar[0]
# # puts barbiz[0]
# # puts bizfoo[0]
# # puts thing[1]
# # table_row = doc.css(".infobox").css("tr").each do |tr|
# #   puts tr
# # end
# puts
# # puts doc.css(".infobox").css(".kingdom")
# puts doc.css(".infobox")
