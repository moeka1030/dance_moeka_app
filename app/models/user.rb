class User < ApplicationRecord
  # Deviseの認証モジュール
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # メールを小文字に変換（重複を防ぐため）
  before_save { self.email = email.downcase }

  # ActiveStorage（プロフィール画像）
  has_one_attached :profile_image

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :genre, presence: true
  validates :experience, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # ユーザーは複数の投稿を持つ・削除時に投稿も削除
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
end
