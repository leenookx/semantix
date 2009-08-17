class AddTitleToBlogEntry < ActiveRecord::Migration
  def self.up
    add_column :blogs, :title, :string
  end

  def self.down
  end
end
