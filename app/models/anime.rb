class Anime < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  mount_uploader :image, ImageUploader
  
  belongs_to :producer
  has_many :videos, dependent: :destroy
  accepts_nested_attributes_for :videos, reject_if: :all_blank, allow_destroy: true
  has_and_belongs_to_many :genres

  validates :title, :description, :image, :producer, :status, presence: true
  searchkick word_middle: [:title]
  # default_scope { order('created_at DESC') } 

  def search_data
    {
      title: title,
      status: status,
      genres: genres.pluck(:name),
      producer: producer.name,
      start_aired: start_aired,
      end_aired: end_aired
    }
  end

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end

  def producer_name
    producer.name
  end
end
