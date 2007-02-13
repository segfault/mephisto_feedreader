# $Id$
# liquid-ify the feedtools feeditems
class FeedTools::FeedItem
  def to_liquid
    {
      'href' => link,
      'description' => title,
      'extended' => content,
      'tags' => tags,
      'time' => time
    }
  end
end

