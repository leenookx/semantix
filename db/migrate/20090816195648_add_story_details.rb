class AddStoryDetails < ActiveRecord::Migration
  def self.up
    add_column :stories, :details, :text, :limit => 4096
  end

  def self.down
  end
end
