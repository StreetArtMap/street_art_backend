class StreetArt < ApplicationRecord
  before_save :validate_location
  belongs_to :user
  serialize :image_urls, Array
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode
  validates_presence_of :image_urls

  def validate_location
    get_coordinates if latitude.nil? || longitude.nil?
    get_address if address.nil? || zipcode.nil? || city.nil? || state.nil?
  end

  def get_coordinates
    full_address = "#{address} #{city} #{state} #{zipcode}"
    json = LocationService.new.get_coordinates(full_address)
    result = json[:results][0][:locations][0][:latLng]
    self.latitude = result[:lat]
    self.longitude = result[:lng]
  end

  def get_address
    coordinates = "#{latitude}, #{longitude}"
    json = LocationService.new.get_address(coordinates)
    result = json[:results][0][:locations][0]
    self.address = result[:street]
    self. city = result[:adminArea5]
    self.state = result[:adminArea3]
    self.zipcode = result[:postalCode][0..4]
  end
end
