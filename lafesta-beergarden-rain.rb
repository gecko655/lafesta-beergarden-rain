require "nokogiri"
require "slack-ruby-client"
require "open-uri"

doc = Nokogiri::HTML(open("http://lafesta-beergarden.com/"))
is_open_string = doc.css(".stats_2").first.content
Slack.configure do |config|
  config.token = ENV["TOKEN"]
end
client = Slack::Web::Client.new

client.chat_postMessage(channel: '#general', text: 'La festa beer garden is ' + is_open_string + ' today.', as_user: false)
