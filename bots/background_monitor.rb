#!/usr/bin/env ruby

RAILS_ROOT = '.'
 
#load required rails and backgroundrb files
require File.dirname(__FILE__) + '/../config/boot'
require File.dirname(__FILE__) + '/../config/environment'
require 'erb'
$LOAD_PATH << "#{RAILS_ROOT}/vendor/plugins/backgroundrb/lib"
require "#{RAILS_ROOT}/vendor/plugins/backgroundrb/lib/backgroundrb.rb"


class BackgroundMonitor 

    def test
        begin
          puts "Raw data:"
          puts MiddleMan.all_worker_info
  
          puts
          puts "Individual:"
          puts MiddleMan.all_worker_info.values.flatten.select { |w|
              puts w[:worker] 
              puts "     key = #{w[:worker_key]}"
              puts "  status = #{w[:status]}"
          }
        rescue 
          puts "Some kind of problem occurred..."
        end 
    end 
end

monitor = BackgroundMonitor.new
monitor.test
