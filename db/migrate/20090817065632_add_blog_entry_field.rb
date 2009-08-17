class AddBlogEntryField < ActiveRecord::Migration
  def self.up
    add_column :blogs, :entry, :text, :limit => 4096
  end

  def self.down
  end
end
