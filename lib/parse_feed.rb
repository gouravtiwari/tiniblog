require 'nokogiri'
require 'open-uri'

module ParseFeed
  def feed_data feed
    doc = Nokogiri::XML(open(feed))
    items = doc.xpath('//item').collect do |i|
      {
      :title       => i.xpath('title').text,
      :link        => i.xpath('link').text,
      :description => i.xpath('description').text
      }
    end
    items
  end
end
