# $Id$
# liquid-ify the feedtools feeditems
#
# Variables title through author_href added by Luigi Montanez

class FeedTools::FeedItem
  def to_liquid
    {
      'href' => link,
      'description' => title,
      'extended' => content,
      'title' => title,
      'summary' => summary,
      'author_name' => author.name,
      'author_email' => author.email,
      'author_href' => author.href,
      'tags' => tags,
      'time' => time
    }
  end
end

