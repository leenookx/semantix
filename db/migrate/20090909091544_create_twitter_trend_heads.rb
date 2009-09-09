class CreateTwitterTrendHeads < ActiveRecord::Migration
  def self.up
    create_table :twitter_trend_heads do |t|
      t.datetime :as_of

      t.timestamps
    end
  end

  def self.down
    drop_table :twitter_trend_heads
  end
end
