class Post < ApplicationRecord
  belongs_to :user
  has_many :comments , dependent: :destroy
  
  mount_uploader :image, PictureUploader
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
