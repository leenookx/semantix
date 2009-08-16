class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.integer :id
      t.integer :feed_id
      t.string :url
      t.string :title
      t.datetime :released

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
