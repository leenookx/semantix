class AddLinkFieldToLinkedPages < ActiveRecord::Migration
  def self.up
    add_column :linked_pages, :link_id, :integer
  end

  def self.down
  end
end
