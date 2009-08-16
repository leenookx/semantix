require "rubygems"
require "acts_as_ferret"

class Story < ActiveRecord::Base
    acts_as_ferret :fields => ["details"]
    belongs_to :feed
end
