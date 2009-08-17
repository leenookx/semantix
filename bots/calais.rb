#!/usr/bin/ruby

require 'rubygems'
require 'lib/calais_client'

require 'pp'

client = CalaisClient.new('Some example text.')

puts "---- RAW Calais Response ------------------------------------"
client.dump_raw_response
puts "-------------------------------------------------------------"

pp "tags: ", client.get_tag_from_json
