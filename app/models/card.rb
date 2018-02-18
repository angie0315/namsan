class Card < ApplicationRecord
  belongs_to :user
  has_many :replies
  mount_uploader :image, ImageUploader
  serialize :images, JSON
  validates :title, presence: :true, length: { maximum: 50 }
  validates :content, presence: :true, length: { minimum: 5 }
  validates :image, presence: :true
end
