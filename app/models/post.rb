class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_one_attached :video

  validates :description, presence: true, length: { maximum: 200 } 
  # validates :video, presence: true
  validates :genre, presence: true
end
