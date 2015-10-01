class Genre < ActiveRecord::Base
  has_and_belongs_to_many :animes

  default_scope { order('name') } 
end
