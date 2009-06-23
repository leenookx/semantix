class CreateLinkKeywords < ActiveRecord::Migration
  def self.up
    create_table :link_keywords do |t|
      t.integer :link_id
      t.integer :keyword_id

      t.timestamps
    end
  end

  def self.down
    drop_table :link_keywords
  end
end
