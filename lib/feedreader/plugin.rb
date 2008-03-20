# $Id: plugin.rb 89 2007-03-02 23:49:05Z segfault $
module Mephisto::Plugins
  class Feedreader < Mephisto::Plugin
    author 'Mark Guzman'
    version 'r$Rev: 89 $'.gsub( /(\$Rev:\s+)|(\s+\$)/, "" )
    notes "Add liquid blocks displaying RSS feeds"
    homepage "http://hasno.info/2006/11/11/mephisto-plugins"
    
    class Schema < ActiveRecord::Migration
      def self.install
        create_table :cached_feeds do |t|
          t.column :href, :string
          t.column :title, :string
          t.column :link, :string
          t.column :feed_data, :text
          t.column :feed_data_type, :string
          t.column :http_headers, :text
          t.column :last_retrieved, :datetime
          t.column :time_to_live, :integer
          t.column :serialized, :text
        end    
      end

      def self.uninstall
        drop_table :cached_feeds
      end
    end
  end
end
