require 'rails_helper'

describe StreetArt, type: :model do
  describe 'validations' do
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zipcode }
    # it { should validate_presence_of :image_urls }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
