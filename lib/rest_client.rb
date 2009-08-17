#!/usr/bin/ruby

require 'net/http'
require 'hpricot'
 
class RESTClient < Object
  
  def post_to(uri, post_args)
    begin
      resp, data = Net::HTTP.post_form(uri, post_args)
      data
    rescue URI::InvalidURIError => e
      puts("WARN: Invalid URI: #{e}")
    rescue SocketError => e
      puts("WARN: Could not connect: #{e}")
    rescue Errno::ECONNREFUSED => e
      puts("WARN: Connection refused: #{e}")
    end
  end
  
  def get_from(uri)
    begin
      res = Net::HTTP.get_response(URI.parse(uri))
      res.body
    rescue URI::InvalidURIError => e
      puts("WARN: Invalid URI: #{e}")
    rescue SocketError => e
      puts("WARN: Could not connect: #{e}")
    rescue Errno::ECONNREFUSED => e
      puts("WARN: Connection refused: #{e}")
    end
  end
  
  def get_from_as_xml(uri)
    Hpricot.XML get_from uri
  end
  
end

