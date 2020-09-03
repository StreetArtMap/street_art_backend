class User < ApplicationRecord
  has_many :street_arts
  validates_presence_of :username
  validates_presence_of :email
end
