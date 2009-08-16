class AddIconToFeed < ActiveRecord::Migration
  def self.up
    add_column :feeds, :icon_file, :string
  end

  def self.down
  end
end
