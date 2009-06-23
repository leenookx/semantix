class AmendLinksDatabaseForCache < ActiveRecord::Migration
  def self.up
    add_column :links, :cache_file, :string
  end

  def self.down
  end
end
