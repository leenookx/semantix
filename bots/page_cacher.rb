#!/usr/bin/ruby

require 'rubygems'
require 'simplehttp'

data = SimpleHttp.get "http://slashdot.org"

afile = File.new('local_cache/cache.tmp', "w+")

afile.puts data

afile.close

