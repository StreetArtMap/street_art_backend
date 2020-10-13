class User < ApplicationRecord
  has_many :street_arts

  validates_presence_of :username
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest, require: true

  has_secure_password
end
