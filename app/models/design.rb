class Design < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :favorites
  has_many :images
  has_many :favorites
  accepts_nested_attributes_for :images
  has_and_belongs_to_many :tags
  acts_as_taggable_on :moods, :colors, :roomtypes
end
