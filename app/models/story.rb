require "rubygems"
require "acts_as_ferret"

class Story < ActiveRecord::Base
    acts_as_ferret :fields => [:description]
    belongs_to :feed
end
