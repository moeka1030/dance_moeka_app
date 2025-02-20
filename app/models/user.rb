class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_secure_password
 #userに関するバリデーション
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :genre, presence: true
  validates :experience, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  #userは複数の投稿が可能・userが削除されると投稿も削除
 has_many :posts, dependent: :destroy
 has_many :likes, dependent: :destroy
 has_many :liked_posts, through: :likes, source: :post

end
