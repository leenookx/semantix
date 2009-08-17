#!/usr/bin/ruby 

require 'rubygems'
require 'activeresource'
require 'lib/calais_client.rb'

class Calaisservice < ActiveResource::Base

    def xml_query query=""
    end

    def json_query query=""
        client = CalaisClient.new( query )
        return client.dump_raw_response
    end
end

