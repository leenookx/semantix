class AddDetailFieldsToFeeds < ActiveRecord::Migration
  def self.up
    add_column :feeds, :description, :string
    add_column :feeds, :published, :date
    add_column :feeds, :cache_file, :string
  end

  def self.down
  end
end
