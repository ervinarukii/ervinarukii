class Video < ActiveRecord::Base
  belongs_to :anime
  mount_uploader :file, VideoUploader
  store_in_background :file

  default_scope { order('created_at ASC') } 

  validate :file, :title
end
