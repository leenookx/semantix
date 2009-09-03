#!/usr/bin/env ruby

require 'rubygems'
require 'memcache'

host = "localhost"
port = 22122
starling = MemCache.new "#{host}:#{port}"

starling.set 'feed_workers__process_all_feeds', {}

