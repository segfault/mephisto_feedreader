require 'feedreader'
Liquid::Template.register_tag('feedreader', MephistoFeedReader::FeedReader)
