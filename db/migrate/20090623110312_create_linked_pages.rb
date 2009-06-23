class CreateLinkedPages < ActiveRecord::Migration
  def self.up
    create_table :linked_pages do |t|
      t.string :url
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :linked_pages
  end
end
