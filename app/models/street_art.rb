class StreetArt < ApplicationRecord
  serialize :image_urls, Array
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode
  validates_presence_of :image_urls
end
