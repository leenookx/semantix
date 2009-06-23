#!/usr/bin/ruby

require 'rubygems'
require 'simplehttp'
require 'active_record'

link_id = 1

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.colorize_logging = true

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :dbfile => "db/development.sqlite3"
)

require 'app/models/link.rb'

record = Link.find( link_id )
url = record.url
puts url

data = SimpleHttp.get url

filename = "local_cache/"+`uuidgen`.strip+".tmp"
afile = File.new(filename, "w+")

afile.puts data

afile.close

Link.update(link_id, :cache_file => filename, :processed => 1 )


