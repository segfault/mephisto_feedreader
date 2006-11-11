class FeedTools::FeedItem
  def to_liquid
    {
      'href' => link,
      'description' => abstract,
      'extended' => description,
      'tags' => tags,
      'time' => Time.parse(time)
    }
  end
end
