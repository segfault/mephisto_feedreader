# $Id$
# liquid-ify the feedtools feeditems
class FeedEater::FeedItem
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

