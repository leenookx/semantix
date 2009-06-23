class LinkKeyword < ActiveRecord::Base
    belongs_to :link
    belongs_to :keyword
end
