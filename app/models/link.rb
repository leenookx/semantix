class Link < ActiveRecord::Base
    validates_presence_of :url
    validates_uniqueness_of :id

    has_many :link_keywords
    has_many :linked_pages
end
