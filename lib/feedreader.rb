# $Id$
# Mephisto FeedReader plugin 
require 'feedeater'
require 'feed_cache'
require 'liquid'

class FeedReader < Liquid::Block
  Syntax = /((#{Liquid::TagAttributes}\s?,?\s?)*)as\s(#{Liquid::VariableSignature}+)/

  def initialize(tag_name, markup, tokens)
    super
    if markup =~ Syntax
      @options = parse_options( $1 )
      @as = $5
    else
      raise Liquid::SyntaxError.new("Syntax Error in tag 'feedreader'")
    end
  end

  def render(context)
    result = []
    FeedEater::Feed.feed_cache = FeedEater::FeedCache
    ft_feed = FeedEater::Feed.open(@options[:url])
    puts "live: #{ft_feed.live?}"
    puts "last retrieved: #{ ft_feed.last_retrieved }"
    #puts "expires: #{ ft_feed.last_retrieved + ft_feed.time_to_live }"
    ft_entries = ft_feed.entries
    max = @options[:max]
    max = 15 unless max
    max = max.to_i
    max = ft_entries.length if ft_entries.length < max
    view_range = 0..max      

    ft_entries[view_range].each_with_index do |ent, index|
      context['feedreader'] = { 'index' => index + 1 }
      context[@as] = ent 
      result << render_all(@nodelist, context)
    end

    result
  end

  private
  def parse_options(opt_string)
    opts = {}
    pairs = opt_string.split(',')
    pairs.each do |pair|
      opt, value = pair.split(/:[^\/]/)          
      opts[opt.strip.to_sym] = value.strip.gsub(/\'/,'')
    end

    opts
  end
end
