class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged
  mount_uploader :avatar, AvatarUploader

  has_many :companies

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :first_name, :last_name, :email, :username
end
