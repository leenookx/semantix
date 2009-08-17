class CreateBlogcomments < ActiveRecord::Migration
  def self.up
    create_table :blogcomments do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :blogcomments
  end
end
