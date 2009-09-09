class TwitterTrendHead < ActiveRecord::Base
  has_many :twitter_trend :foreign_key => 'head'
end
