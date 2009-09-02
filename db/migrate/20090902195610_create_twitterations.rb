class CreateTwitterations < ActiveRecord::Migration
  def self.up
    create_table :twitterations do |t|
      t.integer :id

      t.timestamps
    end
  end

  def self.down
    drop_table :twitterations
  end
end
