class Design < ActiveRecord::Base
  belongs_to :user
  has_many :images
  has_and_belongs_to_many :tags
  acts_as_taggable
end
