class User < ApplicationRecord
  # Deviseの認証モジュール
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  before_save { self.email = email.downcase }
  
  has_one_attached :profile_image

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
 
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
end
