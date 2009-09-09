#!/usr/bin/env ruby

require 'rubygems'
require 'memcache'

host = "localhost"
port = 22122
starling = MemCache.new "#{host}:#{port}"

starling.set 'twitter_workers__grab_trends', {}

