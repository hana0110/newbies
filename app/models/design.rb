class Design < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :favorites
  has_many :images
  has_many :favorites
  accepts_nested_attributes_for :images
  acts_as_taggable_on :styles, :colors, :items
  acts_as_taggable
end