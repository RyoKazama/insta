class Picture < ActiveRecord::Base
  validates :title, presence: true
  mount_uploader :picture, PictureUploader
  validates :picture, presence: true
end
