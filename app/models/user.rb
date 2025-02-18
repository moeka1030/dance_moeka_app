class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
