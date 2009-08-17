class Blog < ActiveRecord::Base
    has_many :comments
end
