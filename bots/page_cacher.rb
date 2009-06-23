#!/usr/bin/ruby

require 'rubygems'
require 'simplehttp'

data = SimpleHttp.get "http://slashdot.org"

filename = "local_cache/"+`uuidgen`.strip+".tmp"
afile = File.new(filename, "w+")

afile.puts data

afile.close

