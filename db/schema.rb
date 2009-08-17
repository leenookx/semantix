# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090817065632) do

  create_table "blogcomments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogs", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "entry",      :limit => 4096
  end

  create_table "feeds", :force => true do |t|
    t.string   "url"
    t.integer  "interval"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "cache_file"
    t.datetime "published"
    t.string   "icon_file"
  end

  create_table "keywords", :force => true do |t|
    t.string   "keyword"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "link_keywords", :force => true do |t|
    t.integer  "link_id"
    t.integer  "keyword_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "linked_pages", :force => true do |t|
    t.string   "url"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "link_id"
  end

  create_table "links", :force => true do |t|
    t.string   "url"
    t.integer  "processed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cache_file"
  end

  create_table "stories", :force => true do |t|
    t.integer  "feed_id"
    t.string   "url"
    t.string   "title"
    t.datetime "released"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "details",    :limit => 4096
  end

end
