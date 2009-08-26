class AddReadFieldToStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :read, :boolean
  end

  def self.down
  end
end
