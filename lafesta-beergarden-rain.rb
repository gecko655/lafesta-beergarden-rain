require "nokogiri"
require "slack-ruby-client"
require "open-uri"

doc = Nokogiri::HTML(open("http://lafesta-beergarden.com/"))
p doc.css(".stats_2").first.content
