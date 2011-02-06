require 'parse_feed'
class HomeController < ApplicationController
  include ParseFeed
  def index
    @feeds = Feed.all
    content_from_feed = []
    @feeds.each do |feed|
      content_from_feed << feed_data(feed.name)
    end
    @items = content_from_feed.flatten
  end
end
