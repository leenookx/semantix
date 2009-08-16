class AddDetailFieldsToFeeds2 < ActiveRecord::Migration
  def self.up
    remove_column :feeds, :published
    add_column :feeds, :published, :datetime
  end

  def self.down
  end
end
