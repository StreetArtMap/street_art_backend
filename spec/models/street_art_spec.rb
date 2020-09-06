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

  describe 'instance methods' do
    it '#get_coordinates' do
      user = create(:user)
      street_art = user.street_arts.create(address: "200 E Colfax Ave", city: "Denver", state: "CO", zipcode: "80203", image_urls: ["https://images.freeimages.com/images/large-previews/5b5/bristles-1173194.jpg"], description: "neat-o!", artist_name: "Larry")

      street_art.validate_location

      expect(street_art.latitude).to_not eq(nil)
      expect(street_art.longitude).to_not eq(nil)

      expect(street_art.latitude).to eq("39.740023")
      expect(street_art.longitude).to eq("-104.985053")
    end

    it '#get_address' do
      user = create(:user)
      street_art = user.street_arts.create(latitude: "39.740023", longitude: "-104.985053", image_urls: ["https://images.freeimages.com/images/large-previews/5b5/bristles-1173194.jpg"], description: "neat-o!", artist_name: "Larry")

      street_art.validate_location

      expect(street_art.address).to eq("201 E Colfax Ave")
      expect(street_art.city).to eq("Denver")
      expect(street_art.state).to eq("CO")
      expect(street_art.zipcode).to eq("80203")
    end
  end
end
