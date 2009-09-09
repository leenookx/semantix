class TwitterTrend < ActiveRecord::Base
  belongs_to :twitter_trend_head, :foreign_key => 'head'
end
