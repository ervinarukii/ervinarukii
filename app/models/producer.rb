class Producer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  default_scope { order('name') } 
  
  has_many :animes, dependent: :destroy

  validate :name
end
