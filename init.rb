require 'feedreader'
require 'liquidized_feedreader'
require 'feedreader/plugin'
Liquid::Template.register_tag('feedreader', FeedReader)
