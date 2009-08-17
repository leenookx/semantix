#!/usr/bin/ruby 

require 'rubygems'
require 'activeresource'
require 'lib/calais_client.rb'

class Calaisservice < ActiveResource::Base

    def xml_query query=""
    end

    def json_query query=""
        client = CalaisClient.new( query )
        return client.to_json
    end
end

