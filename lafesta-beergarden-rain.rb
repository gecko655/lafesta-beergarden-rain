require "nokogiri"
require "slack-ruby-client"
require "open-uri"

force_notify=(ARGV[0]=="yes")

doc = Nokogiri::HTML(open("http://lafesta-beergarden.com/"))
is_open_string = doc.css(".stats_2").first.content


Slack.configure do |config|
  config.token = ENV["TOKEN"]
end
channel_name = ENV["CHANNEL"]
client = Slack::Web::Client.new

client.chat_postMessage(channel: channel_name, text: '本日、La festa BEER GARDEN は"' + is_open_string + '"しています', as_user: false) if (force_notify || ! is_open_string.casecmp("open").zero?)
