class Anime < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  mount_uploader :image, ImageUploader

  belongs_to :company
  validate :title, :description, :image, :company

  def slug_candidates
    [
      :title,
      [:title, :id],
      [:title, "by", (company.host rescue nil)],
      [:title, :id, "by", (user.host rescue nil)]
    ]
  end
end
